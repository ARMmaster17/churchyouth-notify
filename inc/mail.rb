require 'pony'

module Mail
  def Mail.send(to, subject, body)
    Pony.mail :to => to,
              :from => "me@example.com",
              :subject => subject,
              :body => body
  end
  def Mail.validate(to)
    if to.include?("@")
      if to.include?(".com")
        return true
      elsif to.include?(".net")
        return true
      elsif to.include?(".org")
        return true
      end
    end
    return false
  end
end
