class Table
	def initialize(count)
		@playersMax=10
		@playerList=Array.new()
		@cards=Cards.new()
		i=1
		while i<count+1
			@playerList.push(Player.new(i))
			i+=1
		end
		 GameData.initialize_player_liste(@playerList)
	end
	def card_distribution()
		@cards=Cards.new()
		@playerList.each{|x| x.get_new_card(@cards.slice!(0))}
		@playerList.each{|x| x.get_new_card(@cards.slice!(0))}
	end
	def flop_distribution()
		@board=Board.new()
		@cards.slice!(0)
		@playerList.each{|x| x.set_board(@board)}
		@board.add_card(@cards.slice!(0))
		@board.add_card(@cards.slice!(0))
		@board.add_card(@cards.slice!(0))
		if ConfigSession.need_flop_winner?
			@playerList.each{|x| x.find_figures_postflop()}
			@playerList.each{|x| x.find_amelioration_postflop()}
			sort_players_by_score_postflop()
			len=@playerList.length-1
			for i in 0..len
				@playerList[i].set_rank_postflop(i+1)
			end
			set_flop_winner()
		end
	end
	def turn_distribution()
		@cards.slice!(0)
		@board.add_card(@cards.slice!(0))
		if ConfigSession.need_turn_winner?
			@playerList.each{|x| x.find_figures_postturn()}
			@playerList.each{|x| x.find_amelioration_postturn()}
			sort_players_by_score_postturn()
			len=@playerList.length-1
			for i in 0..len
				@playerList[i].set_rank_postturn(i+1)
			end
			set_turn_winner()
		end
	end
	def river_distribution()
		@cards.slice!(0)
		@board.add_card(@cards.slice!(0))
		@playerList.each{|x| x.find_figures_postriver()}
		sort_players_by_score_postriver()
		len=@playerList.length-1
		for i in 0..len
			@playerList[i].set_rank_postriver(i+1)
		end
		set_winner()
	end
	def sort_players_by_score_postflop()
		aucun_echange=false
		while aucun_echange==false
			aucun_echange=true
			len=@playerList.length-2
			for i in 0..len
				if @playerList[i].get_score_postflop<@playerList[i+1].get_score_postflop
					temp=@playerList[i]
					@playerList[i]=@playerList[i+1]
					@playerList[i+1]=temp
					aucun_echange=false
				end
			end
		end
	end
	def sort_players_by_score_postturn()
		aucun_echange=false
		while aucun_echange==false
			aucun_echange=true
			len=@playerList.length-2
			for i in 0..len
				if @playerList[i].get_score_postturn<@playerList[i+1].get_score_postturn
					temp=@playerList[i]
					@playerList[i]=@playerList[i+1]
					@playerList[i+1]=temp
					aucun_echange=false
				end
			end
		end
	end
	def sort_players_by_score_postriver()
		aucun_echange=false
		while aucun_echange==false
			aucun_echange=true
			len=@playerList.length-2
			for i in 0..len
				if @playerList[i].get_score_postriver<@playerList[i+1].get_score_postriver
					temp=@playerList[i]
					@playerList[i]=@playerList[i+1]
					@playerList[i+1]=temp
					aucun_echange=false
				end
			end
		end
	end
	def set_flop_winner
		len=@playerList.length-1
		if @playerList[0].get_score_postflop>@playerList[1].get_score_postflop
			@playerList[0].set_flop_winner(true)
			for i in 1..len
				@playerList[i].set_flop_winner(false)
			end
		else
			@playerList[0].set_flop_tie(true)
			@playerList[0].set_flop_winner(true)
			for i in 1..len
				if @playerList[i].get_score_postflop==@playerList[0].get_score_postflop 
					@playerList[i].set_flop_tie(true)
					@playerList[i].set_flop_winner(true)
				else
					@playerList[i].set_flop_winner(false)
				end
			end
		end
	end
	def set_turn_winner
		len=@playerList.length-1
		if @playerList[0].get_score_postturn>@playerList[1].get_score_postturn
			@playerList[0].set_turn_winner(true)
			for i in 1..len
				@playerList[i].set_turn_winner(false)
			end
		else
			@playerList[0].set_turn_tie(true)
			@playerList[0].set_turn_winner(true)
			for i in 1..len
				if @playerList[i].get_score_postflop==@playerList[0].get_score_postturn
					@playerList[i].set_turn_tie(true)
					@playerList[i].set_turn_winner(true)
				else
					@playerList[i].set_turn_winner(false)
				end
			end
		end
	end
	def set_winner
		len=@playerList.length-1
		@winner=@playerList[0]
		if @playerList[0].get_score_postriver>@playerList[1].get_score_postriver
			@playerList[0].set_winner(true)
			for i in 1..len
				@playerList[i].set_winner(false)
			end
		else
			@playerList[0].set_river_tie(true)
			@playerList[0].set_winner(true)
			for i in 1..len
				if @playerList[i].get_score_postriver==@playerList[0].get_score_postriver
					@playerList[i].set_winner(true)
					@playerList[i].set_river_tie(true)
				else
					@playerList[i].set_winner(false)
				end
			end
		end
	end
	def reset_cards()
		@winner=nil
		@cards=nil
		@board=nil
		@playerList.each{|x| x.reset_cards()}
	end
	def to_object()
		tab=Hash.new
		#@playerList.each{|x| tab.push({"result"=>x.to_s()})}
		@playerList.each{|x| tab[x.get_name]=x.to_hash()}
		o={"players_count"=>@playerList.length, "winner"=>@winner.get_name, "board"=>@board.to_hash(), "players"=>tab}
		return o
	end

	def to_s()
		result="\n"
		result=result+"Board : "+@board.to_s()+"\n\n"
		@playerList.each{|x| result=""+result+x.to_s()+" "+"\n\n"}
		result=result+"Le gagnant est le "+@winner.get_name+" avec "+@winner.get_figure3.to_s
		return result
	end		
end	