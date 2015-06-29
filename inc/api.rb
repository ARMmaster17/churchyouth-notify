require_relative 'mail'

module API
  def API.a()
    return "200 API OK"
  end
  def API.mailvalidate(to)
    r = Mail.validate(to)
    if (r)
      return "true"
    else
      return "false"
    end
  end
end
