class TicketPdf < Prawn::Document
	
	PDF_OPTIONS = {
	    page_size:   "LETTER",
	    page_layout: :portrait,
	    margin:      [40, 200]
  	}

	def initialize(reserve)
		super(PDF_OPTIONS)

		text "TICKET DE ESTACIONAMIENTO", :align => :center, :size => 16, :style => :bold
		move_down 20

		text "Espacio: Slot - "+ reserve.slot.number.to_s, :align => :center, :size => 12
		text "Entrada: "+ reserve.initTime.to_s, :align => :center, :size => 12
		text "Salida: "+ reserve.exitTime.to_s, :align => :center, :size => 12
		text "Tiempo: "+ reserve.totalTime.to_s + " minutos", :align => :center, :size => 12
		move_down 5
		text "Precio Total: $"+ reserve.price.to_s, :align => :center, :size => 12, :style => :bold

	end
end