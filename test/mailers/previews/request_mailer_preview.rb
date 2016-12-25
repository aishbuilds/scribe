# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def request_mail_preview
    RequestMailer.request_email(Request.last, User.last)
  end
end
