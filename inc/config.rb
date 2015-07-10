require 'json'

module Config
  def Config.getVar(varname)
    case varname
    when "ward"
      begin
        file = open(File.expand_path("./config/config.json"))
        parsed = JSON.parse(file.read)
      rescue
        return "Error"
      end
      return parsed['ward']
    else
      return "Empty"
    end
  end
  def Config.factoryreset()
    File.delete(File.expand_path("./config/config.json"))
  end
end
