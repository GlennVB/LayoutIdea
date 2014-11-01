module ApplicationHelper
  require 'serialport'
  def icon(*args)
    options = args.extract_options!
    icon = args.first.to_s
 
    return content_tag(:i, :class => "fa #{icon} fa-fw") do
    end
  end

  def read_common
    setup_serial
    @ser.puts "<#DEV#>"
    dev = read
    @ser.puts "<#LIGHT#>"
    light = read
    @data = {}
    @data["LIGHT"] = light
    @data["DEV"] = dev
    return @data
    # @data = "{\"Device\":\"#{dev}\",\"light\": \"#{light}\"}"
  end

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
