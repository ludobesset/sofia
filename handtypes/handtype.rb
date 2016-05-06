class HandType
	def initialize(value1,value2,type)
		@value1=value1
		@value2=value2
		@type=type
	end
	def get_value1
		return @value1
	end
	def get_value2
		return @value2
	end
	def get_type
		return @type
	end
	def HandType.print(value)
		if value<10
			return value.to_s
		elsif value==10
			return "T"
		elsif value==11
			return "J"
		elsif value==12
			return "Q"
		elsif value==13
			return "K"
		elsif value==14
			return "A"
		end
	end
	def to_s()
		if @value1>@value2
			result=" "+HandType.print(@value1)+HandType.print(@value2)+"-"+@type.to_s
		elsif @value2>@value1
			result=" "+HandType.print(@value2)+HandType.print(@value1)+"-"+@type.to_s
		elsif @value2==@value1
			result=" "+HandType.print(@value2)+HandType.print(@value1)
		end
		return result
	end
end