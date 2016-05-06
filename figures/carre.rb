class Carre < Figure
	def initialize
		super
		@order=8
	end
	def compute_score
		sort_kickers()
		@score=@value*100+@kickerList[0]+@order*@orderbase
	end
	def sort_kickers
		@kickerList=@kickerList.sort!.reverse!.slice(0..0)
	end
	def get_name
		return "Carré"
	end
	def to_s
		return "Carre de #@value, kicker: "+Figure.kickerlist_to_s(@kickerList)+" // score: "+@score.to_s
	end
end