module Search
  #include the yelp search module
  include Yelp::V2::Search::Request

  def set_yelp
    # set up in the config/initializers
    @client = Yelp::Client.new
  end

  def send_request(city,state,term)
    set_yelp()
    #makes a request to the yelp api
    request = Location.new(city: city, state: state, radius: 2, category:['arts','nightlife'], term: term)
    # gets a hash of twenty businesses
    response = @client.search(request)
    # strip only the business information
    return response['businesses']
  end

end
