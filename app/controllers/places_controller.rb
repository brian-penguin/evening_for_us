# Needs a search result and and a show.

class PlacesController <ApplicationController
  include Yelp::V2::Search::Request

# This is done in the config initializers dir

  def search
    # Yelp.configure(:consumer_key => ENV['YELP_CONSUMER_KEY'],:consumer_secret => ENV['YELP_CONSUMER_SECRET'],:token => ENV['YELP_TOKEN'],:token_secret => ENV['YELP_TOKEN_SECRET'])

    Yelp.configure(consumer_key: 'q5OUFntefdxjzO0-hW0kNw',consumer_secret: 'I_SBqoiEZtgq3FGiXgn-XLIQq3M',token: 'VG0NipIARq5auD0OBYv0JZpnubRvkLtw',token_secret: 'DxdlXS77mOKzmhgrP_E_X2pKzxI')

    @client = Yelp::Client.new

    #if the user has given all the data then do

      # In the search User will give City, State, and term
      request = Location.new(city: 'Boston', state: 'MA', radius: 1, category:['arts','nightlife'], term: 'drinks')
      # Gets a Hash of forty businesses
      response = @client.search(request)#['businesses']
      @places = response['businesses']

  end
end
