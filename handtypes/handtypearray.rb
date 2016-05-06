class HandTypeArray
	def HandTypeArray.create
		@@list=Array.new
		@@sortedlist_post_river=Array.new
		for i in 2..14
			for j in i..14
				if i!=j
					@@list.push(HandType.new(i,j,"offsuited"))
					@@list.push(HandType.new(i,j,"suited"))
					@@sortedlist_post_river.push(HandType.new(i,j,"offsuited"))
					@@sortedlist_post_river.push(HandType.new(i,j,"suited"))
				else
					@@list.push(HandType.new(i,j,"offsuited"))
					@@sortedlist_post_river.push(HandType.new(i,j,"offsuited"))
				end
			end
		end
	end
	def HandTypeArray.get_handtype_by_value(value1,value2,type)
		if value1<value2
			for i in 0..@@list.length-1
				if @@list[i].get_value1==value1 and @@list[i].get_value2==value2 and @@list[i].get_type==type
					return @@list[i]
				end
			end
		else
			for i in 0..@@list.length-1
				if @@list[i].get_value1==value2 and @@list[i].get_value2==value1 and @@list[i].get_type==type
					return @@list[i]
				end
			end
		end
	end
	def HandTypeArray.get_handtype_by_cards(card1,card2)
		if card1.get_value<card2.get_value
			temp1=card1.get_value
			temp2=card2.get_value
		else
			temp1=card2.get_value
			temp2=card1.get_value
		end
		if card1.get_color.get_value==card2.get_color.get_value
			typ="suited"
		else
			typ="offsuited"
		end
		for i in 0..@@list.length-1
			if @@list[i].get_value1==temp1 and @@list[i].get_value2==temp2 and @@list[i].get_type==typ
				return @@list[i]
			end
		end
	end
	
	def HandTypeArray.sort_handtypes_by_score_postriver
		aucun_echange=false
		len=@@sortedlist_post_river.length-2
		while aucun_echange==false
			aucun_echange=true
			for i in 0..len
					key1=HandTypeArray.get_handtype_by_value(@@sortedlist_post_river[i].get_value1,@@sortedlist_post_river[i].get_value2,@@sortedlist_post_river[i].get_type)
					key2=HandTypeArray.get_handtype_by_value(@@sortedlist_post_river[i+1].get_value1,@@sortedlist_post_river[i+1].get_value2,@@sortedlist_post_river[i+1].get_type)
					score1=GameData.get_hand_score(key1,"river")
					score2=GameData.get_hand_score(key2,"river")
					if score1<score2
						temp=@@sortedlist_post_river[i]
						@@sortedlist_post_river[i]=@@sortedlist_post_river[i+1]
						@@sortedlist_post_river[i+1]=temp
						aucun_echange=false
					end
			end
		end
		return @@sortedlist_post_river
	end
end