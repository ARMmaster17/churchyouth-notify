require 'pony'

module Mail
  def Mail.send(to, subject, body)
    Pony.mail :to => to,
              :from => "me@example.com",
              :subject => subject,
              :body => body
  end
  def Mail.validate(to)
    #Validate email address
    return true
  end
end
