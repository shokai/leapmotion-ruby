class TestLeapMotion < MiniTest::Test

  def setup
    @leap = LeapMotion.connect
  end

  def teardown
    @leap.close
  end

  def test_version
    _connected = false
    @leap.on :connect do
      _connected = true
    end
    while !_connected
      sleep 1
    end
    assert @leap.version > 0
  end

  def test_data
    _data = nil
    @leap.on :data do |data|
      _data = data
    end
    while !_data
      sleep 1
    end
    assert_equal _data.class, LeapMotion::Data
    assert_equal _data.id.class, Fixnum
    assert_equal _data.currentFrameRate.class, Float
    assert_equal _data.timestamp.class, Fixnum
    assert_equal _data.hands.class, Array
    assert_equal _data.pointables.class, Array
    assert_equal _data.gestures.class, Array
    assert_equal _data.interactionBox.center.class, Array
    assert_equal _data.interactionBox["size"].class, Array
    assert_equal _data.r.class, Array
    assert_equal _data.t.class, Array
    assert_equal _data.s.class, Float
  end

end
