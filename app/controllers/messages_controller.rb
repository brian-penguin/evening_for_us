class MessagesController <ApplicationController
  before_action :set_twilio_client

  def create
    # These are the params passed through the hidden field tags
    place_name = params[:name]
    street_name = params[:street]
    city_state = params[:city_state]

    # added on the new#message view form
    time = params[:time]

    # constructs the message
    msg = "Lets go to #{place_name} at #{time}. It's at #{street_name}, #{city_state}. I'll see you there! From #{current_user.email}"

    # Send the Message to each of the selected numbers
    send_message(msg,params[:number_number])

    # Sends them back to the homepage
    redirect_to root_path,  notice: "Sent your messages!"
  end

  # Post method for passing hidden params from the places search result page to
  # new message page
  def get_info
    render :new
  end

  # set twilio client
  def set_twilio_client
    # creates the Twilio client
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
  end

  def send_message(msg,numbers)
    # Loops through and sends the message
    numbers.each do |number|
      @client.account.messages.create(
        from: '+14132413794',
        to: "+1#{number}",
        body: msg
        )
    end
  end

end
