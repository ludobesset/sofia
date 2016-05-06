class DoublePair < Figure
	def initialize
		super
		@value2=0
		@order=3
	end
	def compute_score
		sort_kickers()
		@score=@value*10000+@value2*100+@kickerList[0]+@order*@orderbase
	end
	def set_value(newvalue)
		if @value==0
			@value=newvalue
		elsif @value2==0
			@value2=newvalue
		end
		if @value!=0 and @value2!=0
			if @value<@value2
				temp=@value2
				@value2=@value
				@value=temp
			end
		end
	end
	def sort_kickers
		@kickerList=@kickerList.sort!.reverse!.slice(0..0)
	end
	def get_name
		return "Double paire"
	end
	def to_s
		return "Double paire de "+Card.value_to_name(@value)+" et "+Card.value_to_name(@value2)+", kicker: "+Figure.kickerlist_to_s(@kickerList)+" // score: "+@score.to_s
	end
end