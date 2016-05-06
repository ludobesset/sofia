class ShowDown < AbstractEvent
	def initialize(o)
		super(o)
		@name="showdown"
		@message=o
	end
end