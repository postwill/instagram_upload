module InstagramUpload
  class Request
    attr_reader :agent, :cookies

    def initialize(agent)
      @agent = agent
      @cookies = Tempfile.new('cookies')
    end

    def post(url, body)
      http = Curl::Easy.new(url)
      http.headers['User-Agent'] = agent.user_agent
      http.verbose = true
      http.follow_location = true
      http.enable_cookies = true

      yield(http) if block_given?

      http.post(body)

      JSON.parse(http.body).tap { http.close }
    end
  end
end
