class Reserve < ApplicationRecord
  belongs_to :slot
  belongs_to :vehicle
  accepts_nested_attributes_for :vehicle

  # Función que representa retorna la última reserva de un espacio seleccionado
  def self.reservaActual(id)
  	Reserve.where("slot_id = ?", id).last
  end

  # Función que retorna el cálculo de los minutos de una reserva desde el inicio al final
  def tiempoTranscurrido
  	time = DateTime.now.to_time - self.initTime.to_time
  	minutes = time/60
  	return minutes.round
  end
end
