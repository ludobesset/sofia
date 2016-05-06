class Player
	attr_accessor:id
	def initialize(tablePlace)
		@place=tablePlace
		@name="Player "+tablePlace.to_s
		r=Random.new
		@id=r.rand(1000000)
		@hand=Hand.new()
		@rank=10
	end
	def get_new_card(newCard)
		@hand.add_card(newCard)
	end
	def set_board(newBoard)
		@board=newBoard
	end
	def find_amelioration_postflop()
		#@amelioration=Amelioration.find_amelioration(@hand,@board,@figure)
	end
	def find_amelioration_postturn()
		#@amelioration2=Amelioration.find_amelioration(@hand,@board,@figure)
	end
	def find_figures_postflop()
		@hand.set_label()
		@figure=Figure.find_figure(@hand,@board)
		@figure.compute_score
	end
	def find_figures_postturn()	
		@figure2=Figure.find_figure(@hand,@board)
		@figure2.compute_score
	end
	def find_figures_postriver()	
		@figure3=Figure.find_figure(@hand,@board)
		@figure3.compute_score
	end
	def set_rank_postflop(newrank)
		@rank=newrank
	end
	def set_rank_postturn(newrank)
		@rank2=newrank
	end
	def set_rank_postriver(newrank)
		@rank3=newrank
	end
	def get_figure3
		return @figure3
	end
	def get_score_postflop
		return @figure.get_score
	end
	def get_score_postturn
		return @figure2.get_score
	end
	def get_score_postriver
		return @figure3.get_score
	end
	def get_name
		return @name
	end
	def set_flop_winner(value)
		@flop_winner=value
		#GameData.add_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"flop",@figure,@id)
		#if value==true
		#	GameData.add_winning_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"flop",@figure,@id)
		#end
	end
	def set_turn_winner(value)
		@turn_winner=value
		#GameData.add_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"turn",@figure2,@id)
		#if value==true
		#	GameData.add_winning_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"turn",@figure2,@id)
		#end
	end
	def set_winner(value)
		@winner=value
		#GameData.add_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"river",@figure3,@id)
		#if value==true
		#	GameData.add_winning_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"river",@figure3,@id)
		#end
	end
	def set_flop_tie(value)
		@flop_tie=value
		#GameData.add_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"flop",@figure,@id)
		#GameData.add_tie_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"flop",@figure,@id)
	end
	def set_turn_tie(value)
		@turn_tie=value
		#GameData.add_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"turn",@figure2,@id)
		#GameData.add_tie_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"turn",@figure2,@id)
	end
	def set_river_tie(value)
		@tie=value
		#GameData.add_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"river",@figure3,@id)
		#GameData.add_tie_hand_and_figure(@hand.get_first_card,@hand.get_second_card,"river",@figure3,@id)
	end
	def reset_cards
		@figure=nil
		@figure2=nil
		@figure3=nil
		@hand=Hand.new()
		@board=nil
		@rank=0
		@rank2=0
		@rank3=0
		@preflop_winner=false
		@flop_winner=false
		@turn_winner=false
		@flop_tie=false
		@turn_tie=false
		@tie=false
		@winner=false
	end
	def rank_to_s(rank)
		if rank==1
			return "1er"
		elsif rank>1
			return rank.to_s+"eme"
		end
	end
	def to_s()
		return @name.to_s()+" avec "+@hand.to_s()+"\n\n  "+rank_to_s(@rank)+" "+@figure.to_s+"	"+@amelioration.to_s+"\n  "+rank_to_s(@rank2)+" "+@figure2.to_s+"	"+@amelioration2.to_s+"\n  "+rank_to_s(@rank3)+" "+@figure3.to_s
		'@hasPair.to_s+" "+@hasDoublePair.to_s+" "+@hasBrelan.to_s+" "+@hasQuinte.to_s+" "+@hasCouleur.to_s+" "+@hasFull.to_s+" "+@hasCarre.to_s'
	end
	def to_hash()
		h=Hash.new
		h["hand"]=@hand.to_hash()
		h["flop"]=Hash.new
		h["flop"]["rank"]=@rank
		h["flop"]["winner"]=@flop_winner
		h["flop"]["tie"]=@flop_tie
		h["flop"]["figure"]=@figure.to_hash()
		h["turn"]=Hash.new
		h["turn"]["rank"]=@rank2
		h["turn"]["winner"]=@turn_winner
		h["turn"]["tie"]=@turn_tie
		h["turn"]["figure"]=@figure2.to_hash()
		h["river"]=Hash.new
		h["river"]["rank"]=@rank3
		h["river"]["figure"]=@figure3.to_hash()
		h["winner"]=@winner
		h["tie"]=@tie
		return h
	end
end