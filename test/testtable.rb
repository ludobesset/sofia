class AbstractTestTable
	def initialize
		@session=Session.new
		ConfigSession.set_print_table(true)
	end
	def print_to_output
		result1=@session.print_table
		t=Time.new
		dirname=t.strftime("%Y%m%d_%H%M%S")+"_"+@session.get_table_size.to_s+"_"+@session.get_session_length.to_s
		dir=Dir.mkdir("output/testtable/"+dirname)
		f1 = File.new("output/testtable/"+dirname+"/listesmain.txt", "w+")
		f1.puts(result1)
		f1.close
	end
end

class TestTable1 <  AbstractTestTable
	def initialize
		super()
		@session.set_table_size(9)
		@session.set_session_length(1)
		@session.play
	end
end
class TestTable2 < AbstractTestTable
	def initialize
		super()
		@session.set_table_size(9)
		@session.set_session_length(2)
		@session.play
	end
end
class TestTable3 < AbstractTestTable
	def initialize
		super()
		@session.set_table_size(10)
		@session.set_session_length(5)
		@session.play	
	end
end