module PagyHelper
  include Pagy::Frontend

  def pagy_custom_bootstrap_nav(pagy)
    nav = pagy_bootstrap_nav(pagy)
    # Aquí puedes modificar el HTML generado por nav
    nav.gsub('class="page-item"', 'class="page-item custom-class"') # Ejemplo de personalización
  end

end
