class GameData
	def GameData.create
		@@hand_data=HandData.new
		@@figure_data=FigureData.new
		@@player_data=PlayerData.new
		@@count=0
	end
	def GameData.initialize_player_liste(liste)
		@@player_data.set_player_liste(liste)
	end
	def GameData.add_hand_and_figure(card1,card2,step,figure,playerid)
		key=HandTypeArray.get_handtype_by_cards(card1,card2)
		@@hand_data.add_hand(key,step,figure)
		@@figure_data.add_hand(step,figure)
		@@player_data.add_hand(step,figure,playerid)
		@@count+=1
	end
	def GameData.add_winning_hand_and_figure(card1,card2,step,figure,playerid)
		key=HandTypeArray.get_handtype_by_cards(card1,card2)
		@@hand_data.add_winning_hand(key,step,figure)
		@@figure_data.add_winning_hand(step,figure)
		@@player_data.add_winning_hand(step,figure,playerid)
	end
	def GameData.add_tie_hand_and_figure(card1,card2,step,figure,playerid)
		key=HandTypeArray.get_handtype_by_cards(card1,card2)
		@@hand_data.add_tie_hand(key,step,figure)
		@@figure_data.add_tie_hand(step,figure)
		@@player_data.add_tie_hand(step,figure,playerid)
	end
	def GameData.get_hand_score(key,step)
		return @@hand_data.get_score_win(key,step,"total")
	end
	def GameData.to_array()
		result=""
		temp=0
		for i in 2..14
			for j in 2..i
				'result=result+"  "+(16-j).to_s+"/"+(16-i).to_s'
				'temp=temp+@@handcount[HandTypeArray.get_handtype_by_value((16-j),(16-i),"offsuited")]'
				key=HandTypeArray.get_handtype_by_value((16-j),(16-i),"offsuited")
				result=result+"  "+@@hand_data.get_score_win(key,"river","total").to_s+"%"
			end
			for j in i..14
				if i!=j
					'result=result+"  "+(16-i).to_s+"/"+(16-j).to_s'
					'temp=temp+@@handcount[HandTypeArray.get_handtype_by_value((16-i),(16-j),"suited")]'
					key=HandTypeArray.get_handtype_by_value((16-i),(16-j),"suited")
					result=result+"  "+@@hand_data.get_score_win(key,"river","total").to_s+"%"
				end
			end
			result=result+"\n"
		end		
		return result
	end		
	def GameData.to_full_liste()
		result=""
		sortedlist=HandTypeArray.sort_handtypes_by_score_postriver
		len=sortedlist.length-1
		for i in 0..len
				key=HandTypeArray.get_handtype_by_value(sortedlist[i].get_value1,sortedlist[i].get_value2,sortedlist[i].get_type)    
				result=result+i.to_s+":  "+key.to_s+" gagne "+@@hand_data.get_score_win(key,"river","total").to_s+"%, partage "+@@hand_data.get_score_tie(key,"river","total").to_s+"%\n"
				result=result+"      - Hauteur : "+@@hand_data.get_figure_repartition(key,"flop","Hauteur").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Hauteur").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Hauteur").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Hauteur").to_s+"% "+@@hand_data.get_score_win(key,"turn","Hauteur").to_s+"% "+@@hand_data.get_score_win(key,"river","Hauteur").to_s+"% "+"des cas\n"
				result=result+"      - Paire : "+@@hand_data.get_figure_repartition(key,"flop","Paire").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Paire").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Paire").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Paire").to_s+"% "+@@hand_data.get_score_win(key,"turn","Paire").to_s+"% "+@@hand_data.get_score_win(key,"river","Paire").to_s+"% "+"des cas\n"
				result=result+"      - DoublePaire : "+@@hand_data.get_figure_repartition(key,"flop","DoublePaire").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","DoublePaire").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","DoublePaire").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","DoublePaire").to_s+"% "+@@hand_data.get_score_win(key,"turn","DoublePaire").to_s+"% "+@@hand_data.get_score_win(key,"river","DoublePaire").to_s+"% "+"des cas\n"
				result=result+"      - Brelan : "+@@hand_data.get_figure_repartition(key,"flop","Brelan").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Brelan").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Brelan").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Brelan").to_s+"% "+@@hand_data.get_score_win(key,"turn","Brelan").to_s+"% "+@@hand_data.get_score_win(key,"river","Brelan").to_s+"% "+"des cas\n"
				result=result+"      - Quinte : "+@@hand_data.get_figure_repartition(key,"flop","Quinte").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Quinte").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Quinte").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Quinte").to_s+"% "+@@hand_data.get_score_win(key,"turn","Quinte").to_s+"% "+@@hand_data.get_score_win(key,"river","Quinte").to_s+"% "+"des cas\n"
				result=result+"      - Couleur : "+@@hand_data.get_figure_repartition(key,"flop","Couleur").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Couleur").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Couleur").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Couleur").to_s+"% "+@@hand_data.get_score_win(key,"turn","Couleur").to_s+"% "+@@hand_data.get_score_win(key,"river","Couleur").to_s+"% "+"des cas\n"
				result=result+"      - Full : "+@@hand_data.get_figure_repartition(key,"flop","Full").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Full").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Full").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Full").to_s+"% "+@@hand_data.get_score_win(key,"turn","Full").to_s+"% "+@@hand_data.get_score_win(key,"river","Full").to_s+"% "+"des cas\n"
				result=result+"      - Carré : "+@@hand_data.get_figure_repartition(key,"flop","Carré").to_s+"% "+@@hand_data.get_figure_repartition(key,"turn","Carré").to_s+"% "+@@hand_data.get_figure_repartition(key,"river","Carré").to_s+"% "+", est devant dans "+@@hand_data.get_score_win(key,"flop","Carré").to_s+"% "+@@hand_data.get_score_win(key,"turn","Carré").to_s+"% "+@@hand_data.get_score_win(key,"river","Carré").to_s+"% "+"des cas\n"
		end		
		return result
	end
	def GameData.to_simple_liste()
		result=""
		sortedlist=HandTypeArray.sort_handtypes_by_score_postriver
		len=sortedlist.length-1
		for i in 0..len
				key=HandTypeArray.get_handtype_by_value(sortedlist[i].get_value1,sortedlist[i].get_value2,sortedlist[i].get_type)    
				result=result+i.to_s+":  "+key.to_s+" gagne "+@@hand_data.get_score_win(key,"river","total").to_s+"%, partage "+@@hand_data.get_score_tie(key,"river","total").to_s+"%\n"
		end		
		return result
	end
	def GameData.figure_to_liste()
		result=""
		result=result+"Hauteur : "+@@figure_data.get_figure_repartition("flop","Hauteur").to_s+"% "+@@figure_data.get_figure_repartition("turn","Hauteur").to_s+"% "+@@figure_data.get_figure_repartition("river","Hauteur").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Hauteur").to_s+"% "+@@figure_data.get_score_win("turn","Hauteur").to_s+"% "+@@figure_data.get_score_win("river","Hauteur").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Hauteur").to_s+"% "+@@figure_data.get_score_tie("turn","Hauteur").to_s+"% "+@@figure_data.get_score_tie("river","Hauteur").to_s+"% "+"des cas\n"
		result=result+"Paire : "+@@figure_data.get_figure_repartition("flop","Paire").to_s+"% "+@@figure_data.get_figure_repartition("turn","Paire").to_s+"% "+@@figure_data.get_figure_repartition("river","Paire").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Paire").to_s+"% "+@@figure_data.get_score_win("turn","Paire").to_s+"% "+@@figure_data.get_score_win("river","Paire").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Paire").to_s+"% "+@@figure_data.get_score_tie("turn","Paire").to_s+"% "+@@figure_data.get_score_tie("river","Paire").to_s+"% "+"des cas\n"
		result=result+"DoublePaire : "+@@figure_data.get_figure_repartition("flop","DoublePaire").to_s+"% "+@@figure_data.get_figure_repartition("turn","DoublePaire").to_s+"% "+@@figure_data.get_figure_repartition("river","DoublePaire").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","DoublePaire").to_s+"% "+@@figure_data.get_score_win("turn","DoublePaire").to_s+"% "+@@figure_data.get_score_win("river","DoublePaire").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","DoublePaire").to_s+"% "+@@figure_data.get_score_tie("turn","DoublePaire").to_s+"% "+@@figure_data.get_score_tie("river","DoublePaire").to_s+"% "+"des cas\n"
		result=result+"Brelan : "+@@figure_data.get_figure_repartition("flop","Brelan").to_s+"% "+@@figure_data.get_figure_repartition("turn","Brelan").to_s+"% "+@@figure_data.get_figure_repartition("river","Brelan").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Brelan").to_s+"% "+@@figure_data.get_score_win("turn","Brelan").to_s+"% "+@@figure_data.get_score_win("river","Brelan").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Brelan").to_s+"% "+@@figure_data.get_score_tie("turn","Brelan").to_s+"% "+@@figure_data.get_score_tie("river","Brelan").to_s+"% "+"des cas\n"
		result=result+"Quinte : "+@@figure_data.get_figure_repartition("flop","Quinte").to_s+"% "+@@figure_data.get_figure_repartition("turn","Quinte").to_s+"% "+@@figure_data.get_figure_repartition("river","Quinte").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Quinte").to_s+"% "+@@figure_data.get_score_win("turn","Quinte").to_s+"% "+@@figure_data.get_score_win("river","Quinte").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Quinte").to_s+"% "+@@figure_data.get_score_tie("turn","Quinte").to_s+"% "+@@figure_data.get_score_tie("river","Quinte").to_s+"% "+"des cas\n"
		result=result+"Couleur : "+@@figure_data.get_figure_repartition("flop","Couleur").to_s+"% "+@@figure_data.get_figure_repartition("turn","Couleur").to_s+"% "+@@figure_data.get_figure_repartition("river","Couleur").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Couleur").to_s+"% "+@@figure_data.get_score_win("turn","Couleur").to_s+"% "+@@figure_data.get_score_win("river","Couleur").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Couleur").to_s+"% "+@@figure_data.get_score_tie("turn","Couleur").to_s+"% "+@@figure_data.get_score_tie("river","Couleur").to_s+"% "+"des cas\n"
		result=result+"Full : "+@@figure_data.get_figure_repartition("flop","Full").to_s+"% "+@@figure_data.get_figure_repartition("turn","Full").to_s+"% "+@@figure_data.get_figure_repartition("river","Full").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Full").to_s+"% "+@@figure_data.get_score_win("turn","Full").to_s+"% "+@@figure_data.get_score_win("river","Full").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Full").to_s+"% "+@@figure_data.get_score_tie("turn","Full").to_s+"% "+@@figure_data.get_score_tie("river","Full").to_s+"% "+"des cas\n"
		result=result+"Carré : "+@@figure_data.get_figure_repartition("flop","Carré").to_s+"% "+@@figure_data.get_figure_repartition("turn","Carré").to_s+"% "+@@figure_data.get_figure_repartition("river","Carré").to_s+"% "+", est devant dans "+@@figure_data.get_score_win("flop","Carré").to_s+"% "+@@figure_data.get_score_win("turn","Carré").to_s+"% "+@@figure_data.get_score_win("river","Carré").to_s+"% "+"des cas"+", et partage dans "+@@figure_data.get_score_tie("flop","Carré").to_s+"% "+@@figure_data.get_score_tie("turn","Carré").to_s+"% "+@@figure_data.get_score_tie("river","Carré").to_s+"% "+"des cas\n"
		return result	
	end
	def GameData.player_to_liste()
		result=""
		liste=@@player_data.get_player_liste
		len=liste.length-1
		for i in 0..len
			result=result+liste[i].id.to_s+" : gagne "+@@player_data.get_score_win("flop",liste[i].id).to_s+"% "+@@player_data.get_score_win("turn",liste[i].id).to_s+"% "+@@player_data.get_score_win("river",liste[i].id).to_s+"% , partage "+@@player_data.get_score_tie("river",liste[i].id).to_s+"%\n"
		end
		return result
	end			
end
