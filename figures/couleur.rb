class Couleur < Figure
	def initialize
		super
		@order=6
	end
	def sort_kickers
		@kickerList=@kickerList.sort!.reverse!.slice(0..3)
	end
	def set_value(newvalue)
		super(newvalue)
	end
	def compute_score
		if !@order.nil?
			sort_kickers()
			@score=@value*100000000+@kickerList[0]*1000000+@kickerList[1]*10000+@kickerList[2]*100+@kickerList[3]+@order*@orderbase
		end
	end
	def get_name
		return "Couleur"
	end
	def to_s
		return "Couleur au "+Card.value_to_name(@value)+", kickers: "+Figure.kickerlist_to_s(@kickerList)+" // score: "+@score.to_s
	end
end