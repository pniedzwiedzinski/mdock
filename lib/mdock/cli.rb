require_relative "config"
require_relative "run"

module Mdock
  def main()
    file = ARGV[0] || ENV['HOME'] + "/.config/mdock/dock.yml"
    config = parse_config(file)

    config.each do |key, value|
      if CLASS_MAP[value.class]
        run(key, value)
      end
      if value.class == Array && key == "persistent-apps"
        persistent_apps(value)
      end
    end
    restart()
  end
end
