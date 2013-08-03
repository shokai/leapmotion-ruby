module LeapMotion
  def self.connect(opts={})
    DEFAULT_OPTION.each do |k,v|
      opts[k] = v unless opts.has_key? k
    end
    LeapMotion::Device.new opts
  end

  class Data < Hashie::Mash
  end

  class Device
    include EventEmitter
    attr_accessor :version
    attr_reader :options

    def initialize(opts)
      @ws = WebSocket::Client::Simple.connect opts[:websocket]
      @options = opts
      @version = nil
      this = self
      @ws.on :message do |msg|
        data = Data.new JSON.parse msg.data rescue this.emit :error, "JSON parse error"
        if data.has_key? "gestures" and !data.gestures.empty?
          this.emit :gestures, data.gestures
        end
        if data.has_key? "currentFrameRate"
          this.emit :data, data
        elsif data.has_key? "version"
          this.version = data.version
        end
      end

      @ws.on :open do
        if this.options[:gestures]
          data = {:enableGestures => true}.to_json
          send data
        end
        this.emit :connect
      end

      @ws.on :close do
        this.emit :disconnect
      end
    end

    def close
      @ws.close
    end

    def wait
      loop do
        sleep 1
      end
    end
  end
end
