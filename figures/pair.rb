class Pair < Figure
	def initialize
		super
		@order=2
	end
	def sort_kickers
		@kickerList=@kickerList.sort!.reverse!.slice(0..2)
	end
	def compute_score
		sort_kickers()
		temp=@value
		'len=@kickerList.length
		for j in 0..(len-2)
			temp=temp*15
		end
		for i in 0..len-1
			temp2=@kickerList[i]
			
			for j in 0..(len-3-i)
				temp2=temp2*15
			end
			temp=temp+temp2
		end
		@score=temp+@order*@orderbase'
		@score=@value*1000000+@kickerList[0]*10000+@kickerList[1]*100+@kickerList[2]+@order*@orderbase
	end
	def get_name
		return "Paire"
	end
	def to_s
		return "Paire de "+Card.value_to_name(@value)+", kickers: "+Figure.kickerlist_to_s(@kickerList)+" // score: "+@score.to_s
	end
end