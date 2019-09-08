require "yaml"



def parse_config(file)
  config = YAML.load(file)
  if !config["dock"]
    print "Invalid config file, expects 'dock'"
    exit
  end
  return config["dock"]
end
