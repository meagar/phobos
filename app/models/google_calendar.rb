
class GoogleCalendar

  class << self

    def auth
      @auth ||= YAML::load_file(Rails.root.join("config", "google_calendar.yml"))[Rails.env]
    end

    def service
      return @service if @service

      @service = GCal4Ruby::Service.new

      unless @service.authenticate(auth["username"], auth["password"])
        raise "Unable to authenticate with google calendar"
      end

      @service
    end

    def calendar
      @calendar ||= GCal4Ruby::Calendar.find(service, :title => auth["calendar"]).try(:first)
    end

    def events
      @events ||= calendar.
        events(:orderby => "starttime", :sortorder => "ascending").
        #reject { |e| e.status == :canceled}.
        #uniq { |e| "#{e.title} #{e.start_time}" }.
        sort_by(&:start_time)
    end

  end

end
