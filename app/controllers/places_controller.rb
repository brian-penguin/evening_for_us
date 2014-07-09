# Needs a search result and and a show.

class PlacesController <ApplicationController
  include Yelp::V2::Search::Request

# This is done in the config initializers dir

  def search
    @client = Yelp::Client.new

    #if the user has given all the data then do

      # In the search User will give City, State, and term
      request = Location.new(city: 'Boston', state: 'MA', radius: 1, category:['arts','nightlife'], term: 'drinks')
      # Gets a Hash of forty businesses
      response = @client.search(request)
      @places = response['businesses']

  end
end
