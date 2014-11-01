class UsbinterfaceController < ApplicationController
  require 'serialport'
  before_filter :setup_serial
  def light
    @ser.puts "<#LIGHT#>"
    data = read
    render json: "{\"light\": \"#{data}\"}"
  end

  def dev
    @ser.puts "<#DEV#>"
    data = read
    render json: "{\"light\": \"#{data}\"}"
  end

  def common
    @ser.puts "<#DEV#>"
    dev = read
    @ser.puts "<#LIGHT#>"
    light = read
    render json: "{\"Device\":\"#{dev}\",\"light\": \"#{light}\"}"    
  end

  private
  def read
    
    output = ""
    data = []
    until output == ">" do
      output = @ser.readchar
      data << output
    end

    data = data * ""
    return data.split('*')[1]
  end

  def setup_serial
    @ser = SerialPort.new("/dev/ttyUSB0", 9600, 8, 1)    
  end
end
