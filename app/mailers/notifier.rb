class Notifier < ActionMailer::Base
  default :from => "LaRed MeetUp"

  def request_received(user, connected_user)
    @user = user
    @connected_user = connected_user
    

    mail :to => "#{@connected_user.first_name} #{@connected_user.last_name} <#{@connected_user.email}>", :subject => 'Nieuwe aanmelddienst LaRed: MeetUp'
  end

  def registration_request(user)
    @user = user
    mail :to => "#{@user.first_name} #{@user.last_name} <#{@user.email}>", :subject => 'Nieuwe aanmelddienst LaRed: Shit In A Box'    
  end

  def meeting_request
    @greeting = "Hi"

    mail :to => "to@example.org"
    mail :to => order.email, :subject => 'Pragmatic Store Order Confirmation'
  end
end
