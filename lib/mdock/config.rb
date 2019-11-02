require "yaml"

module Mdock

  def parse_config(file)
    config = YAML.load(File.read(file))
    if !config["dock"]
      print "Invalid config file, expects 'dock'"
      exit
    end
    return config["dock"]
  end

end
