require 'guard/compat/plugin'
require 'guard/watcher'

require "guard/riotjs/runner"

module Guard
  class Riotjs < Plugin
    attr_accessor :options, :runner

    DEFAULT_OPTIONS = {
      output: 'app/assets/javascripts/riot',
    }

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge options
      super(options)
      @runner = Runner.new options
    end

    def start
      ::Guard::Compat::UI.info "Guard::Riotjs is running"
      run_all if options[:all_on_start]
    end

    def run_all
      ::Guard::Compat::UI.info "compile all .tag files"
      runner.run ::Guard::Watcher.match_files(self, Dir['**/*.tag'])
    end

    def run_on_additions(paths)
      throw :task_has_failed unless runner.run paths
    end

    def run_on_modifications(paths)
      throw :task_has_failed unless runner.run paths
    end

    def run_on_removals(paths)
      throw :task_has_failed unless runner.remove_files paths
    end

  end
end
