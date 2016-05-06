class Quinte < Figure
	def initialize
		@order=5
		super
	end
	def compute_score
		if !@order.nil?
			@score=@value+@order*@orderbase
		end
	end
	def get_name
		return "Quinte"
	end
	def to_s
		return "Quinte au "+Card.value_to_name(@value)+""+" score: "+@score.to_s
	end
end