class WelcomeController < ApplicationController
  # Inicio del sistema donde se muestran los Espacios del estacionamiento
  def index
  	@slots = Slot.all
  end
end
