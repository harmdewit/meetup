class Notifier < ActionMailer::Base
  default :from => "Crap in a box"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.request_received.subject
  #
  def request_received
    @user = user
    

    mail :to => @user.email, :subject => 'Nieuwe aanmelddienst LaRed: Shit In A Box'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.registration_request.subject
  #
  def registration_request(user)
    @user = user
    mail :to => "#{@user.first_name} #{@user.last_name} <#{@user.email}>", :subject => 'Nieuwe aanmelddienst LaRed: Shit In A Box'    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.meeting_request.subject
  #
  def meeting_request
    @greeting = "Hi"

    mail :to => "to@example.org"
    mail :to => order.email, :subject => 'Pragmatic Store Order Confirmation'
  end
end
