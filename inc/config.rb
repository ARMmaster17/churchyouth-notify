require_relative '../config/configstore'

module Config
  def Config.getVar(varname)
    case varname
    when "ward"
      return ConfigStore::WARD
    else
      return "Empty"
    end
  end
end
