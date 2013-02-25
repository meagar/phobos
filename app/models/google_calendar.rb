
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
      @events ||= find_events
    end

    def find_events
      events = calendar.events("showhidden" => true, "futureevents" => "true", "max-results" => 30).reject { |e| e.status == :canceled || e.start_time < Time.now}

      uniq_events = {}

      events.inject({}) do |h,e|
        uniq_events["#{e.title} #{e.start_time}"] = e
      end

      uniq_events.values.sort_by(&:start_time)
    end
  end

end
