require 'test_helper'

class Fluent::SyslogTest < Test::Unit::TestCase

  class TestSocket
    attr_reader :packets

    def initialize
      @packets = []
    end

    def puts(message)
      @packets << message
    end
  end

  def setup
    Fluent::Test.setup
    @driver = Fluent::Test::BufferedOutputTestDriver.new(Fluent::Syslog, 'test')
    @mock_token = 'c56a4180-65aa-42ec-a945-5fd21dec0538'
    @driver.configure("
      syslog_token #{@mock_token}
      ")
    #@driver.instance.socket = TestSocket.new
    @default_record = {
      'hostname' => 'some_hostname',
      'facility' => 'local0',
      'severity' => 'warn',
      'program' => 'some_program',
      'message' => 'some_message'
    }
  end

  def test_configure_empty_configuration
    begin
      @driver.configure('')
    rescue => e
      assert e.is_a? Fluent::ConfigError
    end
  end

  def test_configure_uses_syslog_config
    assert @driver.instance.syslog_token.eql? @mock_token
  end


end
