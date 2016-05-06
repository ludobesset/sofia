class AbstractTestSession
	def initialize
		@session=Session.new
	end
	def to_full_liste
		return GameData.to_full_liste
	end
	def to_simple_liste
		return GameData.to_simple_liste
	end
	def to_array
		return GameData.to_array
	end
	def figure_to_liste
		return GameData.figure_to_liste
	end
	def print_to_output
		result1=to_array()
		result2=to_full_liste()
		result3=to_simple_liste()
		result4=figure_to_liste()
		result5=GameData.player_to_liste()
		t=Time.new
		dirname=t.strftime("%Y%m%d_%H%M%S")+"_"+@session.get_table_size.to_s+"_"+@session.get_session_length.to_s
		dir=Dir.mkdir("output/testsession/"+dirname)
		f1 = File.new("output/testsession/"+dirname+"/tableau.txt", "w+")
		f1.puts(result1)
		f1.close
		f2 = File.new("output/testsession/"+dirname+"/fullliste.txt", "w+")
		f2.puts(result2)
		f2.close
		f3 = File.new("output/testsession/"+dirname+"/simpleliste.txt", "w+")
		f3.puts(result3)
		f3.close
		f4 = File.new("output/testsession/"+dirname+"/figure.txt", "w+")
		f4.puts(result4)
		f4.close
		f5 = File.new("output/testsession/"+dirname+"/players.txt", "w+")
		f5.puts(result5)
		f5.close
	end
end

class TestSession1 < AbstractTestSession
	def initialize
		super
		@session.set_table_size(9)
		@session.set_session_length(1000)
		@session.play
	end
end
class TestSession2 < AbstractTestSession
	def initialize
		super
		@session.set_table_size(10)
		@session.set_session_length(5000)
		@session.play
	end
end
class TestSession3 < AbstractTestSession
	def initialize
		super
		@session.set_table_size(2)
		@session.set_session_length(2000)
		@session.play	
	end
end