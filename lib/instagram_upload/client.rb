module InstagramUpload
  class Client
    API_URL = 'https://instagram.com/api/v1/'.freeze

    LOGIN = API_URL + 'accounts/login/'
    UPLOAD_PHOTO = API_URL + 'media/upload/'
    CONFIGURE_PHOTO = API_URL + 'media/configure/'

    attr_reader :username, :password, :agent, :request

    def initialize(username, password)
      @username = username
      @password = password
      @agent = Agent.new
      @request = Request.new(agent)

      login
    end

    def upload_photo(image, caption)
      data = [
        Curl::PostField.file('photo', image),
        Curl::PostField.content('device_timestamp', device_timestamp)
      ]

      result = request.post(UPLOAD_PHOTO, data) do |http|
        http.multipart_form_post = true
        http.cookiefile = request.cookies.path
      end

      configure_photo(result['media_id'], caption)
    end

    def configure_photo(media_id, caption)
      body = agent.body(
        device_timestamp: device_timestamp,
        media_id: media_id,
        caption: caption,
        source_type: 5,
        filter_type: 0,
        extra: {}
      )

      request.post(CONFIGURE_PHOTO, body) do |http|
        http.cookiefile = request.cookies.path
      end
    end

    private

    def login
      body = agent.body(username: username, password: password)

      request.post(LOGIN, body) do |http|
        http.cookiejar = request.cookies.path
      end
    end

    def device_timestamp
      Time.now.to_i.to_s
    end
  end
end
