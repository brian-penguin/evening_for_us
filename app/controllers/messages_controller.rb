class MessagesController <ApplicationController

  def create
    # creates the message for the Twilio client
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    # These are the params passed through the hidden field tags
    place_name = params[:name]
    location1 = params[:street]
    location2 = params[:city_state]

    # added on the new#message view form
    time = params[:time]
    numbers = params[:number_number]

    # constructs the message
    msg = "Lets go to #{place_name} at #{time}. It's at #{location1}, #{location2}. I'll see you there! From #{current_user.email}"

    # Loops through and sends the
    numbers.each do |number|
      @client.account.messages.create(
        from: '+14132413794',
        to: "+1#{number}",
        body: msg
        )
    end

    # Sends them back to the homepage
    redirect_to root_path,  notice: "Sent your messages!"
  end

  # Post method for passing hidden params from the places search result page to
  # new message page
  def get_info
    render :new
  end
end
