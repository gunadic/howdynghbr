module MeetupHelper

  def add_map_for(markers = " ") 

    if markers.blank?
      @gmaps_options = {
        "map_options" => {
          "center_latitude" => 42.3583,
          "center_longitude" => -71.0603,
          "zoom" => 14
        }       
      }
      gmaps(@gmaps_options)
    else
    gmaps(
      "map_options" =>{
        :auto_zoom => true
        },
        "markers" => { 
          "data" => markers, 
          "options" => {
            "do_clustering" => true, 
            "clusterer_maxZoom" => 16} 
          }
    ) 
      end
    end

end
