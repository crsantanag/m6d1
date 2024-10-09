class MovieApiService
  include HTTParty
  base_uri 'http://www.omdbapi.com/'

  def initialize(api_key)
    @api_key = Rails.application.credentials.omdb[:api_key]
  end

  def fetch_movie_poster(title)
    # Realiza una petición GET a la API de OMDb
    response = self.class.get("/", query: { t: title, apikey: @api_key })
    
    # Verifica que la respuesta sea exitosa
    if response.success? && response["Response"] == "True"
      # Retorna la URL del póster
      response["Poster"]
    else
      nil
    end
  end
end
