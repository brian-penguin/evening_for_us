
class PlacesController <ApplicationController
  def search
    # gets the search from form params
    term = params[:term]
    city = params[:city]
    state = params[:state]

    @places = Search.send_request(city,state,term)

  end
end
