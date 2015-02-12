require 'guard/compat/plugin'
require 'fileutils'

module Guard
  class Riotjs < Plugin
    attr_accessor :options

    DEFAULT_OPTIONS = {
      cmd: 'riot',
      src: 'app/frontend/riot',
      dist: 'app/assets/javascripts/riot',
    }

    def initialize(options = {})
      super
      @options = DEFAULT_OPTIONS.merge options
    end

    def start
      Guard::Compat::UI.info "Guard::Riotjs is running"
    end

    def run_all
      true
    end

    def run_on_additions(paths)
      return false if paths.empty?
      paths.each do |path|
        raise :task_has_failed unless compile_tag(path)
      end
    end

    def run_on_modifications(paths)
      return false if paths.empty?
      paths.each do |path|
        raise :task_has_failed unless compile_tag(path)
      end
    end

    def run_on_removals(paths)
      return false if paths.empty?

      targets = paths.map{|p| "#{options[:dist]}/#{File.basename(p).sub(/\.tag$/, '.js')}" }
      FileUtils.rm targets, force: true, verbose: true
    end


    private

    def compile_tag(path)
      system "#{options[:cmd]} #{path} #{options[:dist]}"
    end

  end
end
