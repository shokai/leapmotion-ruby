require File.expand_path "test_helper", File.dirname(__FILE__)

class TestGestures < MiniTest::Test

  def setup
    @leap = LeapMotion.connect :gestures => true
  end

  def teardown
    @leap.close
    sleep 1
  end

  def test_gestures
    _gs = nil
    STDERR.puts "plese move your hands."
    @leap.on :gestures do |gestures|
      _gs = gestures
    end
    while !_gs
      sleep 1
    end
    g = _gs[0]
    assert_equal g.class, LeapMotion::Data
    assert_equal g.direction.class, Array
    assert_equal g.duration.class, Fixnum
    assert_equal g.handIds.class, Array
    assert_equal g.pointableIds.class, Array
    assert_equal g.position.class, Array
    assert_equal g.speed.class, Float
    assert_equal g.startPosition.class, Array
    assert_equal g.state.class, String
    assert ["swipe", "screenTap", "keyTap", "circle"].include? g.type
  end

end
