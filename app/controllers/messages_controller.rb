class MessagesController <ApplicationController

  def create
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    place_name = params[:name]
    location1 = params[:street]
    location2 = params[:city_state]

    time = params[:time]
    numbers = params[:number_number]

    msg = "Lets go to #{place_name} at #{time}. It's at #{location1}, #{location2}. I'll see you there! From #{current_user.email}"

    numbers.each do |number|
      @client.account.messages.create(
        from: '+14132413794',
        to: "+1#{number}",
        body: msg
        )
    end

    redirect_to root_path,  notice: "Sent your messages!"
  end

  def get_info
    render :new
  end
end
