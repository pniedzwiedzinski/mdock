require_relative "config"
require_relative "run"


def main()
  config = parse_config(File.read(ARGV[0]))

  config.each do |key, value|
    if CLASS_MAP[value.class]
        run(key, value)
    end
  end
  restart()
end
