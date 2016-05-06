class Hauteur < Figure
	def initialize
		super
		@order=1
	end
	def sort_kickers
		@kickerList=@kickerList.sort!.reverse!.slice(0..4)
	end
	def compute_score
		sort_kickers()
		'temp=0
		len=@kickerList.length
		for i in 0..len-1
			temp2=@kickerList[i]
			for j in 0..(len-2-i)
				temp2=temp2*15
			end
			temp=temp+temp2
		end
		@score=temp+@order*@orderbase'
		@score=@kickerList[0]*100000000+@kickerList[1]*1000000+@kickerList[2]*10000+@kickerList[3]*100+@kickerList[4]+@order*@orderbase
	end
	def get_name
		return "Hauteur"
	end
	def to_s
		return "Hauteur "+Figure.kickerlist_to_s(@kickerList)+" // score: "+@score.to_s
	end
end
