# encoding: utf-8

STDOUT.sync = true
STDERR.sync = true

require 'pathname'

def mikes_escapeHTML(string)
  escapes = {
    '&' => '&amp;',
    '"' => '&quot;',
    '<' => '&lt;',
    '>' => '&gt;',
  }
  string.gsub(/[&\"<>]/, escapes)
end

at_exit do
  if (e = $ERROR_INFO) && !e.instance_of?(SystemExit)
    require "#{ENV['TM_SUPPORT_PATH']}/lib/escape"
    # require "cgi"
    io = IO.for_fd(ENV['TM_ERROR_FD'].to_i)

    io.write "<div id='exception_report' class='framed'>\n"
    # io.write "<p id='exception'><strong>#{e.class.name}:</strong> #{CGI.escapeHTML e.message.sub(/`(\w+)'/, '‘\1’').sub(/ -- /, ' — ')}</p>\n"
    io.write "<p id='exception'><strong>#{e.class.name}:</strong> #{mikes_escapeHTML e.message.sub(/`(\w+)'/, '‘\1’').sub(/ -- /, ' — ')}</p>\n"

    io.write "<blockquote><table border='0' cellspacing='4' cellpadding='0'>\n"

    e.backtrace.each do |b|
      if b =~ /(.*?):(\d+)(?::in\s*`(.*?)')?/ then
        file, line, method = Regexp.last_match[1], Regexp.last_match[2], Regexp.last_match[3]

        url, display_name = '', 'untitled document'
        if file != '-' && File.exist?(file) && !ENV['TM_SCRIPT_IS_UNTITLED'] then
          file = Pathname.new(file).realpath.to_s
          url = '&url=file://' + e_url(file)
          display_name = File.basename(file)
        end

        io << "<tr><td><a class='near' href='txmt://open?line=#{line + url}'>"
        #        io << (method ? "method #{CGI::escapeHTML method}" : '<em>at top level</em>')
        io << (method ? "method #{mikes_escapeHTML method}" : '<em>at top level</em>')
        #        io << "</a></td>\n<td>in <strong>#{CGI::escapeHTML display_name}</strong> at line #{line}</td></tr>\n"
        io << "</a></td>\n<td>in <strong>#{mikes_escapeHTML display_name}</strong> at line #{line}</td></tr>\n"
      end
    end

    io.write '</table></blockquote></div>'
    io.flush

    exit!
  end
end
