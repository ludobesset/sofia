class PlayerData
	def initialize
		@handcount=Hash.new
		@handwin=Hash.new 
		@handtie=Hash.new
	end
	def set_player_liste(playerListe)
		step=["flop","turn","river"]
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		z=playerListe.length-1
		@player_liste=playerListe
		for i in 0..z
			playerid=playerListe[i].id
			@handcount[playerid]=Hash.new
			@handwin[playerid]=Hash.new
			@handtie[playerid]=Hash.new
			for l in 0..fig.length-1				
				@handcount[playerid][fig[l]]=Hash.new
				@handwin[playerid][fig[l]]=Hash.new
				@handtie[playerid][fig[l]]=Hash.new
				for k in 0..2
					@handcount[playerid][fig[l]][step[k]]=0
					@handwin[playerid][fig[l]][step[k]]=0
					@handtie[playerid][fig[l]][step[k]]=0
				end
			end
		end
	end  
	def get_player_liste
		return @player_liste
	end
	def add_hand(step,figure,playerid)
		@handcount[playerid][figure.get_name][step]+=1
	end
	def add_winning_hand(step,figure,playerid)
		@handwin[playerid][figure.get_name][step]+=1
	end
	def add_tie_hand(step,figure,playerid)
		@handtie[playerid][figure.get_name][step]+=1
	end
	def get_total_count(step,playerid)
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		result=0
		for i in 0..fig.length-1
			result=result+@handcount[playerid][fig[i]][step] 
		end
		return result
	end
	def get_total_win(step,playerid)
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		result=0
		for i in 0..fig.length-1
			result=result+@handwin[playerid][fig[i]][step] 
		end
		return result
	end
	def get_total_tie(step,playerid)
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		result=0
		for i in 0..fig.length-1
			result=result+@handtie[playerid][fig[i]][step] 
		end
		return result
	end
	def get_score_win(step,playerid)
		return (100*get_total_win(step,playerid).to_f/get_total_count(step,playerid).to_f).round(1)
			'return @handwin[figurename][step].to_s+":"+@handcount[figurename][step].to_s'
	end
	
	def get_score_tie(step,playerid)
		return (100*get_total_tie(step,playerid).to_f/get_total_count(step,playerid).to_f).round(1)
	end
end