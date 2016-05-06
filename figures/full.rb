class Full < Figure
	def initialize
		super
		@value2=0
		@order=7
	end
	def set_value(newvalue)
		if @value==0
			@value=newvalue
		else
			if newvalue>@value
				@value2=@value
				@value=newvalue
			else
				@value2=newvalue
			end	
		end
	end
	def set_value2(newvalue)
		if newvalue>@value2
			@value2=newvalue
		end
	end
	def compute_score
		if !@order.nil?
			@score=@value*100+@value2+@order*@orderbase
		end
	end
	def get_name
		return "Full"
	end

	def to_s
		return "Full au "+Card.value_to_name(@value)+" par les "+Card.value_to_name(@value2)+""+" // score: "+@score.to_s
	end
end