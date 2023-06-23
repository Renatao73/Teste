#instancias
require_relative '../pages/get_marvel_page'

class MarvelMain
    def get_marvel_page
      Marvel::GetMarvel.new
    end

end
  
    def marvel
      MarvelMain.new
    end


