require 'optparse'
require 'date'

module Waaah
  class CLI
    class << self
      def run(argv)
        options = {}

        OptionParser.new do |opts|
          opts.on('-h' '--help', 'Command execution example: waaah -d YYYY-MM-DD') do |boolean|
            puts ops
            exit
          end

          opts.on("-d", "--date DATE", "Specify the due date（ex: 2025-01-01）") do |date|
            begin
              options[:due_date] = Date.parse(date)
            rescue ArgumentError
              puts 'Error: The date format is not correct.（ex: 2025-01-01）'
              exit 1
            end
          end
        end.parse!

        unless options[:due_date]
          warn "Error: The specification of the due date is required."
          exit 1
        end

        today = Date.today
        due_date = options[:due_date]
        start_date = due_date - 280

        puts '----------------------'
        puts "Due date: #{due_date}"
        puts '----------------------'
        puts "Pregnancy start date: #{start_date}"

        (1..10).each do |month|
          month_start_date = start_date + (month * 28)
          now = ' *' if months_of_pregnancy?(today, month_start_date)
          puts "#{month} month of pregnancy: #{month_start_date}#{now}"
        end
      end

      def months_of_pregnancy?(today, month_start_date)
        month_end_date = month_start_date + 27
        (month_start_date..month_end_date).cover?(today)
      end
    end
  end
end