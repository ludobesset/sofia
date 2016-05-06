##
# Carte issue d'un paquet traditionnel de 52 cartes
# Une carte est dotée de 2 attributs 
# 	- value : valeur faciale, comprise entre 2 et 14 (11:valet, 12:dame, 13:roi, 14:as)
#   - color : objet CardColor
class Card
	def initialize(value, newcolor)
		@value=value
		@color=CardColor.new(newcolor)
		if @value==11
			@name="Valet"
		elsif @value==12
			@name="Dame"
		elsif @value==13
			@name="Roi"
		elsif @value==14
			@name="As"
		else
			@name="#@value"
		end
	end
	def get_name()
		return "#@name"
	end
	def get_value()
		return @value
	end
	def get_value_bis()
		if @value==14
			return 1
		else
			return @value
		end
	end
	def get_color()
		return @color
	end
	def to_s()
		return "#@name #@color"
	end
	def Card.value_to_name(value)
		if value==11
			name="Valet"
		elsif value==12
			name="Dame"
		elsif value==13
			name="Roi"
		elsif value==14
			name="As"
		else
			name=value.to_s
		end
	end
end
