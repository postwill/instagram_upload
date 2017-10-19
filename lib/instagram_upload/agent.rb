module InstagramUpload
  class Agent
    SECRET_KEY = 'b4a23f5e39b5929e0666ac5de94c89d1618a2916'.freeze
    CONTENT_TYPE = 'application/x-www-form-urlencoded; charset=UTF-8'
    RESOLUTION = %w[720x1280 320x480 480x800 1024x768 1280x720 768x1024 480x320].freeze
    VERSION = ['GT-N7000', 'SM-N9000', 'GT-I9220', 'GT-I9100'].freeze
    DPI = %w[120 160 320 240].freeze

    attr_reader :guid, :device_id, :user_agent

    def initialize
      @guid = SecureRandom.uuid
      @device_id = 'android-' + guid
      @user_agent = generate_user_agent
    end

    def body(data)
      body_data = data.merge(
        'guid': guid,
        'device_id': device_id,
        'Content-Type': CONTENT_TYPE
      ).to_json.tr("'", '"')

      'ig_sig_key_version=4&signed_body=' + signature(body_data) + '.' + URI.encode(body_data, /\W/)
    end

    private

    def signature(data)
      OpenSSL::HMAC.hexdigest('sha256', SECRET_KEY, data)
    end

    def generate_user_agent
      resolution = RESOLUTION.sample
      version = VERSION.sample
      dpi = DPI.sample

      instagram_version = '4.' + rand(1..2).to_s + '.' + rand(0..2).to_s
      android_version = rand(10..11).to_s + '/' + [rand(1...3), rand(3..5), rand(0..5)].join('.')
      android_config = [android_version, dpi, resolution, 'samsung', version, version, 'smdkc210', 'ru_RU'].join('; ')

      "Instagram #{instagram_version} Android (#{android_config})"
    end
  end
end
