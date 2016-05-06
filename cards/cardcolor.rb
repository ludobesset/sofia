class CardColor
	@@pique=0
	@@coeur=1
	@@trefle=2
	@@carreau=3
	def initialize(newcolor)
		@value=newcolor
	end
	def get_value
		return @value
	end
	def to_s()
		if @value==@@pique
			return "Pique"
		elsif @value==@@carreau
			return "Carreau"
		elsif @value==@@coeur
			return "Coeur"
		elsif @value==@@trefle
			return "Trefle"
		else
			return "Error"
		end
		'return "#@value"'
	end
end