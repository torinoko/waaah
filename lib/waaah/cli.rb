require 'optparse'
require 'date'

module Waaah
  class CLI
    def self.run(argv)
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

      due_date = options[:due_date]
      today = Date.today
      start_date = due_date - 280

      puts '----------------------'
      puts "Due date: #{due_date}"
      puts '----------------------'
      puts "Pregnancy start date: #{start_date}"

      (1..10).each do |month|
        month_start_date = start_date + (month * 4 * 7)
        month_end_date = month_start_date + 28
        now = ' *' if (month_start_date..month_end_date).cover?(today)
        puts "#{month} month of pregnancy: #{month_start_date}#{now}"
      end
    end
  end
end
