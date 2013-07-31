module LeapMotion
  def self.connect
    LeapMotion::Device.new 
  end

  class Data < Hashie::Mash
  end

  class Device
    include EventEmitter
    attr_accessor :version

    def initialize(ws_url="http://localhost:6437")
      @ws = WebSocket::Client::Simple.connect ws_url
      @version = nil
      this = self
      @ws.on :message do |msg|
        data = Data.new JSON.parse msg.data rescue this.emit :error, "JSON parse error"
        if data.has_key? "currentFrameRate"
          this.emit :data, data
        elsif data.has_key? "version"
          this.version = data.version
        end
      end

      @ws.on :open do
        this.emit :connect
      end

      @ws.on :close do
        this.emit :disconnect
      end
    end

    def wait
      loop do
        sleep 1
      end
    end
  end
end
