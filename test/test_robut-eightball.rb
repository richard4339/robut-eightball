require 'test_helper'
require 'robut'
require 'robut-eightball'
require 'mocha/setup'

class Robut::Plugin::EightBallTest < Test::Unit::TestCase

  def setup
    @connection = Robut::ConnectionMock.new
    @presence = Robut::PresenceMock.new(@connection)
    @plugin = Robut::Plugin::EightBall.new(@presence)
  end

  def test_handle_8ball_no_robut
    @plugin.stubs(:random).returns(1)
    @plugin.handle(Time.now, "John", "8ball something")
    assert_equal( [], @plugin.reply_to.replies )
  end

  def test_handle_8ball_no_question
    @plugin.stubs(:random).returns(1)
    @plugin.handle(Time.now, "John", "@robut 8ball")
    assert_equal( [], @plugin.reply_to.replies )
  end

  def test_handle_8ball_normal
    @plugin.stubs(:random).returns(1)
    @plugin.handle(Time.now, "John", "@robut 8ball something")
    assert_equal( ["It is decidedly so"], @plugin.reply_to.replies )
  end
end