module API
  def API.conductor(string URLcall)
    case URLcall
    when !String
      "An error occured. Please send this code to support: 0xAPI-INVPARAM"
    when '/api'
      "200 Version: ERROR"
    else
      "An error occured. Please send this code to support: 0xAPI-NOPARAMMATCH"
    end
  end
end
