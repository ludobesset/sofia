class Brelan < Figure
	def initialize
		super
		@order=4
	end
	def sort_kickers
		@kickerList=@kickerList.sort!.reverse!.slice(0..1)
	end
	def compute_score
		sort_kickers()
		@score=@value*10000+@kickerList[0]*100+@kickerList[1]+@order*@orderbase
	end
	def get_name
		return "Brelan"
	end
	def to_s
		return "Brelan de "+Card.value_to_name(@value)+" , kickers: "+Figure.kickerlist_to_s(@kickerList)+" // score: "+@score.to_s
	end
end