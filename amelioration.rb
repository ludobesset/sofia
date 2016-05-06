class Amelioration
	def initialize
		@outList=CardList.new
	end
	def add_out(value,color)
		newcard=Card.new(value,color)
		already=false
		for i in 0..@outList.get_length-1
			if newcard.get_value==@outList.get_card_at(i).get_value and newcard.get_color.get_value==@outList.get_card_at(i).get_color.get_value
				already=true
			end
		end
		if already==false
			@outList.add_card(newcard)
		end
	end
	def add_outs_same_value(value,color)
		for i in 0..3
			if color!=i
				add_out(value,i)	
			end
		end
	end
	def add_overcard(card)
		for i in 0..3
			if card.get_color.get_value!=i
				add_out(card.get_value,i)
			end
		end
	end
	def add_overpair(hand)
		for i in 0..3
			if hand.get_first_card.get_color.get_value!=i and hand.get_second_card.get_color.get_value!=i
				add_out(hand.get_first_card.get_value,i)
			end
		end
	end
	def add_tirage_brelan(pair)
		for i in 0..3
			already=false
			for j in 0..pair.get_length-1
				if pair.get_card_at(j).get_color.get_value==i
					already=true
				end
			end
			if already==false
				add_out(pair.get_first_card.get_value,i)
			end
		end
	end
	def add_tirage_couleur(list)
		for i in 2..14
			already_in_list=false
			for j in 0..list.get_length-1
				if list.get_card_at(j).get_value==i
					already_in_list=true
				end
			end
			if already_in_list==false
				add_out(i,list.get_card_at(0).get_color.get_value)
			end
		end
	end
	def add_tirage_quinte_bouts(list)
		for i in 0..3
			add_out(list.get_first_card.get_value+1,i)
		end
		for i in 0..3
			add_out(list.get_last_card.get_value-1,i)
		end
	end
	def add_tirage_quinte_bas
		for i in 0..3
			add_out(10,i)
		end
	end
	def add_tirage_quinte_haut
		for i in 0..3
			add_out(5,i)
		end
	end
	def add_tirage_quinte_ventral(list1,list2)
		for i in 0..3
			add_out(list1.get_last_card.get_value-1,i)
		end
	end
	def add_tirage_carre(brelan)
		for i in 0..3
			already=false
			for j in 0..brelan.get_length-1
				if brelan.get_card_at(j).get_color.get_value==i
					already=true
				end
			end
			if already==false
				add_out(brelan.get_first_card.get_value,i)
			end
		end
	end
	def Amelioration.find_amelioration(hand,board,figure)
		sortedCard=CardList.new()
		sortedCard.copy(board)
		sortedCard.copy(hand)
		sortedCard.sort_cards_by_value()
		sortedCard2=CardList.new()
		sortedCard2.copy(board)
		sortedCard2.copy(hand)
		sortedCard2.sort_cards_by_value!()
		sortedCard3temp=CardList.new()
		sortedCard3temp.copy(board)
		sortedCard3temp.copy(hand)
		sortedCard3=sortedCard3temp.sort_cards_by_same_value()
		sortedCard4temp=CardList.new()
		sortedCard4temp.copy(board)
		sortedCard4temp.copy(hand)
		sortedCard4=sortedCard4temp.sort_cards_by_same_color()
		sortedCard5temp=CardList.new()
		sortedCard5temp.copy(board)
		sortedCard5temp.copy(hand)
		sortedCard5=sortedCard5temp.sort_cards_by_serie()
		amelioration=Amelioration.new
		if figure.get_order==1
			'hauteur'
			temp=board.get_max_card.get_value
			if hand.get_first_card.get_value>temp
				'overcard'
				amelioration.add_overcard(hand.get_first_card)
			end
			if hand.get_second_card.get_value>temp
				'overcard'
				amelioration.add_overcard(hand.get_second_card)
			end
			for k in 0..sortedCard4.length-1
				if sortedCard4[k].get_length==4
					'tirage couleur'
					amelioration.add_tirage_couleur(sortedCard4[k])
					'tirage quinteflush'
				end
			end
			'tirage quinte'
			for g in 0..sortedCard5.length-1
				if sortedCard5[g].get_length==4
					if sortedCard5[g].get_first_card.get_value!=14 and sortedCard5[g].get_last_card.get_value!=14
						amelioration.add_tirage_quinte_bouts(sortedCard5[g])
					elsif sortedCard5[g].get_first_card.get_value==14
						amelioration.add_tirage_quinte_bas()
					elsif sortedCard5[g].get_last_card.get_value==14
						amelioration.add_tirage_quinte_haut()
					end
				end
				if g<sortedCard5.length-1
					if sortedCard5[g].get_length==2 and sortedCard5[g+1].get_length==2 and sortedCard5[g].get_last_card.get_value==sortedCard5[g+1].get_first_card.get_value+2
						amelioration.add_tirage_quinte_ventral(sortedCard5[g],sortedCard5[g+1])
					end
					if sortedCard5[g].get_length==3 and sortedCard5[g+1].get_length>=1and sortedCard5[g].get_last_card.get_value==sortedCard5[g+1].get_first_card.get_value+2
						amelioration.add_tirage_quinte_ventral(sortedCard5[g],sortedCard5[g+1])
					end
				end
			end
		elsif figure.get_order==2
			'paire'
			temp=board.get_max_card.get_value
			if hand.is_paire==false
				if hand.get_first_card.get_value>temp
					'overcard'
					amelioration.add_overcard(hand.get_first_card)
				end
				if hand.get_second_card.get_value>temp
					'overcard'
					amelioration.add_overcard(hand.get_second_card)
				end
				for k in 0..sortedCard4.length-1
					if sortedCard4[k].get_length==4
						'tirage couleur'
						amelioration.add_tirage_couleur(sortedCard4[k])
						'tirage quinteflush'
					end
				end
				'tirage quinte'
				for g in 0..sortedCard5.length-1
					if sortedCard5[g].get_length==4
						if sortedCard5[g].get_first_card.get_value!=14 and sortedCard5[g].get_last_card.get_value!=14
							amelioration.add_tirage_quinte_bouts(sortedCard5[g])
						elsif sortedCard5[g].get_first_card.get_value==14
							amelioration.add_tirage_quinte_bas()
						elsif sortedCard5[g].get_last_card.get_value==14
							amelioration.add_tirage_quinte_haut()
						end
					end
					if g<sortedCard5.length-1
						if sortedCard5[g].get_length==2 and sortedCard5[g+1].get_length==2 and sortedCard5[g].get_last_card.get_value==sortedCard5[g+1].get_first_card.get_value+2
							amelioration.add_tirage_quinte_ventral(sortedCard5[g],sortedCard5[g+1])
						end
						if sortedCard5[g].get_length==3 and sortedCard5[g+1].get_length>=1and sortedCard5[g].get_last_card.get_value==sortedCard5[g+1].get_first_card.get_value+2
							amelioration.add_tirage_quinte_ventral(sortedCard5[g],sortedCard5[g+1])
						end
					end
				end
				'tirage brelan'
				for i in 2..14
					if sortedCard3[i].get_length==2
						amelioration.add_tirage_brelan(sortedCard3[i])
					end
				end
			else
				if hand.get_first_card.get_value>temp
					'overpair'
					amelioration.add_overpair(hand)
				end
				'tirage quinte'
				for g in 0..sortedCard5.length-1
					if sortedCard5[g].get_length==4
						if sortedCard5[g].get_first_card.get_value!=14 and sortedCard5[g].get_last_card.get_value!=14
							amelioration.add_tirage_quinte_bouts(sortedCard5[g])
						elsif sortedCard5[g].get_first_card.get_value==14
							amelioration.add_tirage_quinte_bas()
						elsif sortedCard5[g].get_last_card.get_value==14
							amelioration.add_tirage_quinte_haut()
						end
					end
					if g<sortedCard5.length-1
						if sortedCard5[g].get_length==2 and sortedCard5[g+1].get_length==2 and sortedCard5[g].get_last_card.get_value==sortedCard5[g+1].get_first_card.get_value+2
							amelioration.add_tirage_quinte_ventral(sortedCard5[g],sortedCard5[g+1])
						end
						if sortedCard5[g].get_length==3 and sortedCard5[g+1].get_length>=1and sortedCard5[g].get_last_card.get_value==sortedCard5[g+1].get_first_card.get_value+2
							amelioration.add_tirage_quinte_ventral(sortedCard5[g],sortedCard5[g+1])
						end
					end
				end
			end
		elsif figure.get_order==3
			'double paire'
			'tirage full'
		elsif figure.get_order==4
			'brelan'
			'tirage full'
			'tirage carre'				
			for k in 2..14
				if sortedCard3[k].get_length==3
					amelioration.add_tirage_carre(sortedCard3[k])
				end
			end
			for k in 0..sortedCard4.length-1
				if sortedCard4[k].get_length==4
					'tirage couleur'
					amelioration.add_tirage_couleur(sortedCard4[k])
					'tirage quinteflush'
				end
			end
		elsif figure.get_order==5
			'quinte'
			for k in 0..sortedCard4.length-1
				if sortedCard4[k].get_length==4
					'tirage couleur'
					amelioration.add_tirage_couleur(sortedCard4[k])
					'tirage quinteflush'
				end
			end
		elsif figure.get_order==6
			'couleur'
			'tirage quinteflush'
		elsif figure.get_order==7
			'full'
			'tirage carre'
		end
		return amelioration
	end
	def count_out
		return @outList.get_length
	end
	def to_s
		return count_out.to_s+" outs "
		'+@outList.to_s'
	end
end