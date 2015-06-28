require 'json'

module Config
  def getVar(varname)
    configfile = File.read('../config/config.json')
    confighash = JSON.parse(configfile)
    case varname
    when "ward"
      return confighash["ward"]
    else
      return "Empty"
    end
  end
end
