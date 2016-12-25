class RequestMailer < ApplicationMailer
  default from: "cheerful.twitter@gmail.com"

  def request_email(request, to_user)
    @request = request
    @to_user = to_user
    mail(to: @to_user.email, subject: 'Request for a Scribe')
  end
end
