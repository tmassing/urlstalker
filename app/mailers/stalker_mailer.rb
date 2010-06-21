class StalkerMailer < ActionMailer::Base
  default :from => "urlstalkers@gmail.com"

  def hello_email(email)
    mail(:to => email) do |format|
      format.text { render :text => "This is text!" }
      format.html { render :text => "<h1>This is HTML</h1>" }
    end
  end
end
