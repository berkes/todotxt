require "parseconfig"
require "fileutils"

module Todotxt
  class Config < ParseConfig
    def initialize config_file = ""
      if config_file.empty?
        @config_file = Config.config_path
      else
        @config_file = config_file
      end

      if file_exists?
        super @config_file
        validate
      else
        @params = {}
        @groups = []
      end
    end

    def file_exists?
      File.exists? @config_file
    end

    def files
      params["files"] || {"todo" => params["todo_txt_path"] }
    end

    def generate!
     FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), "..", "..", "conf", "todotxt.cfg"), @config_file
     import_config
    end

    def path
      @config_file
    end

    def basename
      File.basename @config_file
    end

    def self.config_path
      File.join ENV["HOME"], ".todotxt.cfg"
    end

    def deprecated?
      params["files"].nil?
    end

    private
    def validate
      if params["files"] && params["todo_txt_path"]
        raise "Bad configuration file: use either files or todo_txt_path"
      end
    end
  end
end
