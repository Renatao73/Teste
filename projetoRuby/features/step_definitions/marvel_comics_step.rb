Dado('que configure minha request') do
    $header = FilesHelper::MarvelFileHelper.new.marvelHeader['marvel']
    #não vamos utilizar body nessas requests
    #$request = FilesHelper::MarvelFileHelper.new.marvelPayload
end
  
Quando('realizo uma consulta') do
    $response = marvel.get_marvel_page.list_get($header)
end
  
Então('deve retornar o total de registros refetente a o limit da pagina') do
    expect($response.code).to eql 200
    expect($response['data']['limit'].to_s).to eql "20"
end


Quando('realizo uma consulta por Id') do   
    $response = marvel.get_marvel_page.list_get($header)
    comics = JSON.parse($response.body)['data']['results']
    puts $ant_man_comics_ids = comics.map { |comic| comic['id'] if comic['title'] == 'Marvel Previews (2017)' }.compact
  end

E('consulto por id') do
    $ant_man_comics_ids.each do |id|
        comics_response  = marvel.get_marvel_page.list_get_id($header,id)
        if comics_response.success?
          puts "Resultado para ID #{id}: #{comics_response.body}"
        else
          puts "Erro ao consultar ID #{id}"
        end
      end
    end
Então('deve retornar todas as histórias que possuem o titulo Marvel Previews') do    
    expect($response.code).to eql 200
    puts comics = JSON.parse($response.body)['data']['results']
    puts $returned_ids = comics.map { |comic| comic['id'] if comic['title'] == 'Marvel Previews (2017)'}
    puts expected_ids = $ant_man_comics_ids.take(3)  # Obter apenas os 3 primeiros IDs
    puts expected_ids.each do |id|
    puts expect($returned_ids).to include(id)
  end
end                                                                          