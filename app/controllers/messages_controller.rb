class MessagesController <ApplicationController
  include Message

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

end
