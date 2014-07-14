# Needs a search result and and a show.

class PlacesController <ApplicationController
  # Configuring Yelp API is done in the config initializers dir
  include Yelp::V2::Search::Request

  def search
    @client = Yelp::Client.new

    term = params[:term]
    city = params[:city]
    state = params[:state]

    #if the user has given all the data then do (all form fiels are required)

    # In the search User will give City, State, and term
    request = Location.new(city: city, state: state, radius: 2, category:['arts','nightlife'], term: term)
    # Gets a Hash of businesses (you can only see 20)
    response = @client.search(request)
    @places = response['businesses']

  end
end
