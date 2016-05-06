class AbstractTestDb
	def initialize
	end
end
class TestDb1 < AbstractTestDb
	def initialize
		super
		@session=Session.new
		@log=DBLogSession.new
		@session.set_table_size(6)
		@session.set_session_length(20000)
		@session.add_listener(@log)
		@session.play
	end
end
