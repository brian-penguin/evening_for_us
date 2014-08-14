module Message
  def send_message(msg,numbers)
    set_up_twilio()
    # Loops through and sends the message
    numbers.each do |number|
      @client.account.messages.create(
        from: '+14132413794',
        to: "+1#{number}",
        body: msg
        )
    end
  end

  def set_up_twilio()
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
  end
end
