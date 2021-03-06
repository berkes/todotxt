module Todotxt
  class TodoFile
    def initialize(path)
      @path = File.expand_path(path)
    end

    # Generate a file from template
    def generate!
      FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), '..', '..', 'conf', 'todo.txt'), @path
    end

    attr_reader :path

    def basename
      File.basename @path
    end

    def exists?
      File.exist? File.expand_path(@path)
    end

    def self.from_key(key)
      config = Todotxt::Config.new
      if config.files.key? key
        path = config.files[key]
        new path
      else
        raise 'Key not found in config'
      end
    end

    def to_s
      @path
    end

    def ==(other)
      @path == other.path
    end
  end
end
