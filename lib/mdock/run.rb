require "shellwords"

module Mdock

  CLASS_MAP = {FalseClass => "bool", TrueClass => "bool", Fixnum => "int", Float => "float", String => "string"}
  BOOL_MAP = {true => "true", false => "false"}

  def plist_value(value)
    if !!value == value
      return BOOL_MAP[value]
    end
    return value
  end

  def run(option, value, type=nil)
    if !type
      type = CLASS_MAP[value.class]
    end
    cmd = "defaults write com.apple.dock #{option.shellescape} -#{type.shellescape} #{plist_value(value)}"
    system(cmd)
    if $?.exitstatus != 0
      print "An error occurred while executing #{cmd}"
      exit
    end
  end

  def delete(option)
    cmd = "defaults delete com.apple.dock #{option.shellescape}"
    system(cmd)
  end

  def persistent_apps(apps)
    delete("persistent-apps")
    apps.each do |app|
      if app == "spacer"
        app_dict = "'{tile-data={}; tile-type=\"spacer-tile\";}'"
      else
        app_dict = "'<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>#{app}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'"
      end
      run("persistent-apps", app_dict, "array-add")
    end
  end

  def restart()
    system("killall Dock")
  end

end