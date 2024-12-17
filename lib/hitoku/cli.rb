# frozen_string_literal: true

module Hitoku
  class Cli
    HELP_OPTIONS = ['-h', '--help'].freeze
    VERSION_OPTIONS = ['-v', '--version'].freeze

    class << self
      def start # rubocop:disable Metrics/MethodLength
        case ARGV[0]
        when *HELP_OPTIONS
          help
        when *VERSION_OPTIONS
          version
        when 'show'
          show
        when 'get'
          get(ARGV[1])
        when 'set'
          set(ARGV[1], ARGV[2])
        when 'del'
          del(ARGV[1])
        else # rubocop:disable Lint/DuplicateBranch
          help
        end
      end

      private

      def help
        puts 'Usage: hitoku [OPTION]...'
        puts 'Options:'
        puts "  #{HELP_OPTIONS.join(', ')}"
        puts 'Examples:'
        puts '  hitoku set <name> <value>'
        puts '  hitoku get <name>'
        puts '  hitoku del <name>'
        puts '  hitoku show'
      end

      def version
        puts "hitoku v#{Hitoku::VERSION}"
      end

      def show
        client = Client.new
        credentials = client.show
        credentials.each do |name, value|
          puts "#{name}: #{value}"
        end
      end

      def get(name)
        client = Client.new
        puts "#{name}: #{client.get(name)}"
      end

      def set(name, value)
        client = Client.new
        client.set(name, value)
      end

      def del(name)
        client = Client.new
        client.del(name)
      end
    end
  end
end
