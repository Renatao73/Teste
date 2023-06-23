module Marvel
class GetMarvel
    include HTTParty
    URL = FilesHelper::MarvelFileHelper.new.marvelUrl
    base_uri ("#{URL['marvel']['url']['homolog']}")
    headers  'Content-Type' => 'application/json'

# --------------------------- Accounts ---------------------------
def list_get(header)
  response = self.class.get("/comics#{URL['marvel']['hash']['api_key']}",headers: header)
end

def list_get_id(header,id)
  response = self.class.get("/comics/#{id}#{URL['marvel']['hash']['api_key']}",headers: header)
end
    end
end
