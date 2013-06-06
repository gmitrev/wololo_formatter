module ActiveSupport
  class BufferedLogger
    def add(severity, message = nil, progname = nil, &block)
      return if @level > severity
      severity_map = { 0=> "DEBUG", 1=> "INFO", 2=> "WARN", 3=> "ERROR", 4=> "FATAL", 5=> "UNKNOWN"}
      severity = severity_map[severity]
      time = ->{Time.now}.call
      formatted_time = time.strftime("%Y-%m-%d %H:%M:%S.") << time.usec.to_s[0..2].rjust(3)
      message = "#{severity_color severity} \033[0;37m#{formatted_time}\033[0m #{String === message ? message : message.inspect} (pid:#{$$})\n"
      buffer << message
      auto_flush
      message
    end
    private

    def severity_color(severity)
      case severity
      when "DEBUG"
        "\033[1;34;40m[DEBUG]\033[0m" # blue
      when "INFO"
        "\033[0;32;40m[INFO]\033[0m " # bold white
      when "WARN"
        "\033[0;33;40m[WARN]\033[0m " # bold yellow
      when "ERROR"
        "\033[1;31;40m[ERROR]\033[0m" # bold red
      when "FATAL"
        "\033[7;31;40m[FATAL]\033[0m" # bold black, red bg
      else
        "[#{severity}]" # none
      end
    end
  end
end
