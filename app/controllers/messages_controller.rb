class MessagesController <ApplicationController
  def new
    render :new
  end

  def create
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    place = eval(params[:place])

    place_name = place[:value]['name']
    location1 = place[:value]['location']['display_address'][0]
    location2 = place[:value]['location']['display_address'][1]
    location3 = place[:value]['location']['display_address'][2]

    time = params[:time]
    numbers = params[:number_number]

    msg = "Lets go to #{place_name} at #{time}. It's at #{location1}, #{location2} #{location3}. I'll see you there! From #{current_user.email}"

      @client.account.messages.create(
        from: '+14132413794',
        to: "+1#{numbers}",
        body: msg
        )

    redirect_to root_path,  notice: "Sent your messages!"
  end
end
