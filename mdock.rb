require 'yaml'
require 'shellwords'

CLASS_MAP = {FalseClass => "bool", TrueClass => "bool", Fixnum => "int", Float => "float", String => "string"}
BOOL_MAP = {true => "true", false => "false"}

def parse_config(file)
  config = YAML.load(file)
  if !config["dock"]
    print "Invalid config file, expects 'dock'"
    exit
  end
  return config["dock"]
end

def plist_value(value)
  if !!value == value
    return BOOL_MAP[value]
  end
  return value
end

def run(option, value)
  cmd = "defaults write com.apple.dock #{option.shellescape} -#{CLASS_MAP[value.class].shellescape} #{plist_value(value)}"
  p cmd
  system(cmd)
  p $?
end

def restart()
  system("killall Dock")
end

def main()
  config = parse_config(File.read(ARGV[0]))

  config.each do |key, value|
    if CLASS_MAP[value.class]
      run(key, value)
    end
  end
  restart()
end

main()
