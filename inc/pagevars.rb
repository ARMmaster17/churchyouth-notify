require_relative 'builddata'

module Pagevars
  def Pagevars.setVars(vname)
    if vname == "CIbuild"
      return Builddata.getCIstring()
    else
      return "Error"
    end
  end
end
