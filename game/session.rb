class Session
	def initialize
		HandTypeArray.create
		GameData.create
		@s=""
		@t1=Time.new
		@listeners=Array.new
	end
	def add_listener(listener)
		@listeners.push(listener)
	end
	def dispatch_event(event)
		@listeners.each { |e| e.on_event(event) }
	end
	def set_table_size(size)
		@playercount=size
	end
	def get_table_size()
		return @playercount
	end
	def set_session_length(l)
		@count=l
	end
	def get_session_length()
		return @count
	end
	def configure_player_hand(position,hand)
	end
	def play
		@table=Table.new(@playercount)
		puts("start session "+@count.to_s+" distributions "+@playercount.to_s+" joueurs")
		for i in 1..@count
			@table.reset_cards()
			@table.card_distribution()
			@table.flop_distribution()
			@table.turn_distribution()
			@table.river_distribution()
			dispatch_event(ShowDown.new(@table.to_object))
			if i==@count/10
				puts("10% "+(Time.new-@t1).to_s)
			elsif  i==2*@count/10
				puts("20% "+(Time.new-@t1).to_s)
			elsif  i==3*@count/10
				puts("30% "+(Time.new-@t1).to_s)
			elsif  i==4*@count/10
				puts("40% "+(Time.new-@t1).to_s)
			elsif  i==5*@count/10
				puts("50% "+(Time.new-@t1).to_s)
			elsif  i==6*@count/10
				puts("60% "+(Time.new-@t1).to_s)
			elsif  i==7*@count/10
				puts("70% "+(Time.new-@t1).to_s)
			elsif  i==8*@count/10	
				puts("80% "+(Time.new-@t1).to_s)
			elsif  i==9*@count/10	
				puts("90% "+(Time.new-@t1).to_s)
			end
			if ConfigSession.is_table_printed?
				@s=@s+@table.to_s+"\n"+"-----------------------------"+"\n"+"-----------------------------"+"\n"
			end
		end
		puts("end session "+(Time.new-@t1).to_s)
	end
	def print_table
		return @s
	end
end