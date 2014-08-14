
class PlacesController <ApplicationController
  include Search
  def search
    # gets the search from form params
    term = params[:term]
    city = params[:city]
    state = params[:state]

    @places = send_request(city,state,term)

  end
end
