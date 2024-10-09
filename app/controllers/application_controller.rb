class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  Pagy::DEFAULT[:items] = 8
  include Pagy::Backend
end