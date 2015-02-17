require 'fileutils'

module Guard
  class Riotjs < Plugin
    class Runner
      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def run(files)
        return false if files.empty?

        files.inject(true) do |result, file|
          result &= compile(file)
        end
      end

      def compile(file)
        system "#{options[:cmd]} #{file} #{options[:output]}"
      end

      def remove_files(files)
        return false if files.empty?

        targets = files.map{|f| "#{options[:output]}/#{File.basename(f).sub(/\.tag$/, '.js')}" }
        FileUtils.rm targets, force: true, verbose: true
      end
    end
  end
end
