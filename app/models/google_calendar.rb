
class GoogleCalendar

  class << self

    def calendar
      return @calendar if @calendar

      auth = YAML::load_file(Rails.root.join("config", "gdata.yml"))[Rails.env]

      service = GCal4Ruby::Service.new

      if !service.authenticate(auth["username"], auth["password"])
        raise "Unable to authenticate with google calendar"
      end

      @calendar = GCal4Ruby::Calendar.find(service, :title => auth["calendar"]).first
    end

    def events
      @events ||= self.calendar.events.reject { |c| c.start_time < Time.now || c.status == :canceled }.sort_by(&:start_time)
    end
  end

end
