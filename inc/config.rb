require 'json'

module Config
  def Config.getVar(varname)
    case varname
    when "ward"
      begin
        file = open("../config/config.json")
        parsed = JSON.parse(file.read)
      rescue
        return "Error"
      end
      return parsed['ward']
    else
      return "Empty"
    end
  end
end
