require_relative 'report'
require_relative 'html_report'
require_relative 'plain_text_report'

puts 'HTML Report'
report = HTMLReport.new
report.output_report

puts ''

puts 'Plain Text Report'
report = PlainTextReport.new
report.output_report
