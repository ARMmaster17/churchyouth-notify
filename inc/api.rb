require_relative 'mail'

module API
  def API.a()
    return "200 API OK"
  end
  def API.mailvalidate(to)
    return Mail.validate(to)
  end
end
