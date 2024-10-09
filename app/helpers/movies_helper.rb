module MoviesHelper
  Pagy::DEFAULT[:limit] = 8
  include Pagy::Frontend
end
