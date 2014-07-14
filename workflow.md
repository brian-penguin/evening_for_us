
 Work flow

send_friend_place
  @place = params[:location]
end

send friends numbers
@place.location
@place.picture


For the Twilio bit we want to pass each place in the loop as
an object to the twilio controller using a form tag

  form_tag
  hidden_value :place => @place
  checkbox w list of friends :friends
  'send texts'
  end

In the text friends controller
  send_texts
    params[:friends].each {|p| Twilio.send_texts(p, params[:place])}
  end

Twilio.send_texts(person, place)
  hey person.name let's go to place.name
end
