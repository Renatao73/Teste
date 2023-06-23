#indicamos aqui o caminho dos arquivos que vamos utilizar nossos yml, os mesmos são as dependencias das requests
module FilesHelper
    class MarvelFileHelper
      def marveltPayload
        YAML.load_file(File.expand_path('../support/marvel_body.yml', File.dirname(__FILE__)))
      end  
      def marvelUrl
        YAML.load_file(File.expand_path('../support/url.yml', File.dirname(__FILE__)))
      end
      def marvelHeader
        YAML.load_file(File.expand_path('../support/header_padrao.yml', File.dirname(__FILE__)))
      end
    end
  end
  
  