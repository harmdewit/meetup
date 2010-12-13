require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "request_received" do
    mail = Notifier.request_received
    assert_equal "Request received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "registration_request" do
    mail = Notifier.registration_request
    assert_equal "Registration request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "meeting_request" do
    mail = Notifier.meeting_request
    assert_equal "Meeting request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
