class ConfigSession
	@@print_table=false
	@@find_flop_winner=true
	@@find_turn_winner=true
	@@find_flop_amelioration=false
	@@find_turn_amelioration=false
	def ConfigSession.is_table_printed?
		return @@print_table
	end
	def ConfigSession.set_print_table(value)
		@@print_table=value
	end
	def ConfigSession.need_flop_winner?
		return @@find_flop_winner
	end
	def ConfigSession.need_turn_winner?
		return @@find_turn_winner
	end
end
