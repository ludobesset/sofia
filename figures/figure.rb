class Figure
	def initialize()
		@score=0	
		@value=0	
		@kickerList=Array.new
		@orderbase=1000000000000
	end
	def get_score
		return @score
	end
	def set_value(newvalue)
		@value=newvalue
	end
	def compute_score
		@score=0
	end
	def add_kicker(newvalue)
		@kickerList.push(newvalue)
	end
	def Figure.find_figure(hand,board)
		hasHauteur=false
		hasPair=false
		hasDoublePair=false
		hasBrelan=false
		hasCouleur=false
		hasQuinte=false
		hasFull=false
		hasCarre=false
		hasQuinteFlush=false
		#liste des cartes hand + board triées par valeurs
		sortedCard=CardList.new()
		sortedCard.copy(board)
		sortedCard.copy(hand)
		sortedCard.sort_cards_by_value()
		#liste des cartes hand + board triées par valeurs sans doublette ni triplette
		sortedCard2=CardList.new()
		sortedCard2.copy(board)
		sortedCard2.copy(hand)
		sortedCard2.sort_cards_by_value!()
		#liste des cartes hand + board triées par valeurs sans doublette ni triplette, l'as comptant pour 1
		sortedCard2bis=CardList.new()
		sortedCard2bis.copy(board)
		sortedCard2bis.copy(hand)
		sortedCard2bis.sort_cards_by_value_bis!()
		#liste des cartes hand + board rangées par valeurs
		sortedCard3temp=CardList.new()
		sortedCard3temp.copy(board)
		sortedCard3temp.copy(hand)
		sortedCard3=sortedCard3temp.sort_cards_by_same_value()
		#liste des cartes hand + board rangées par couleurs
		sortedCard4temp=CardList.new()
		sortedCard4temp.copy(board)
		sortedCard4temp.copy(hand)
		sortedCard4=sortedCard4temp.sort_cards_by_same_color()
		#Detection de la figure obtenue
		if sortedCard.get_length==sortedCard2.get_length
			hasHauteur=true
		elsif sortedCard.get_length==sortedCard2.get_length+1
			hasPair=true
		elsif sortedCard.get_length==sortedCard2.get_length+2
			#une double paire ou un brelan
			for i in 2..14
				if sortedCard3[i].get_length==2
					hasDoublePair=true
					break
				elsif sortedCard3[i].get_length==3
					hasBrelan=true
					break
				end
			end
		elsif sortedCard.get_length==sortedCard2.get_length+3
			#un full ou un carré ou 3 paires
			for i in 2..14
				if sortedCard3[i].get_length==3
					hasFull=true
					break
				elsif sortedCard3[i].get_length==4
					hasCarre=true
					break
				end
			end 
			if hasFull==false and hasCarre==false
				hasDoublePair=true
			end
		elsif sortedCard.get_length==sortedCard2.get_length+4
			# deux brelans ou un carre et une paire ou un full et une paire
			for i in 2..14
				if sortedCard3[i].get_length==3
					hasFull=true
					break
				elsif sortedCard3[i].get_length==4
					hasCarre=true
					break
				end
			end 
		elsif sortedCard.get_length==sortedCard2.get_length+5
			# un carre et un brelan
			hasCarre=true
		end
		for j in 0..3
			if sortedCard4[j].get_length>=5
				hasCouleur=true
				break
			end
		end
		for k in 0..sortedCard2.get_length-5
			hasQuinte=true
			for m in 1..4
				if sortedCard2.get_list()[k+m].get_value!=sortedCard2.get_list()[k].get_value-m
					hasQuinte=false
					break
				end 
			end
			'if hasQuinte==true
				break
			end'
			for m in 1..4
				if sortedCard2bis.get_list()[k+m].get_value_bis!=sortedCard2bis.get_list()[k].get_value_bis-m
					hasQuinte=false
					break
				end 
			end
			if hasQuinte==true
				break
			end
		end
		#Creation de la figure
		if hasCarre==true
			figure=Carre.new
			temp=CardList.new
			if sortedCard.get_length==sortedCard2.get_length+3 or sortedCard.get_length==sortedCard2.get_length+4
				for i in 2..14
					if sortedCard3[i].get_length==4
						figure.set_value(sortedCard3[i].get_card_at(0).get_value)
					else
						temp.copy(sortedCard3[i])
					end
				end
			elsif sortedCard.get_length==sortedCard2.get_length+5
				for i in 2..14
					if sortedCard3[i].get_length==4
						figure.set_value(sortedCard3[i].get_card_at(0).get_value)
					else
						temp.copy(sortedCard3[i])
					end
				end
			end
			temp.get_list.each{|x| figure.add_kicker(x.get_value)}
		elsif hasFull==true
			figure=Full.new
			if sortedCard.get_length==sortedCard2.get_length+3
				for i in 2..14
					if sortedCard3[i].get_length==3
						figure.set_value(sortedCard3[i].get_card_at(0).get_value)
					elsif sortedCard3[i].get_length==2
						figure.set_value2(sortedCard3[i].get_card_at(0).get_value)
					end
				end
			elsif sortedCard.get_length==sortedCard2.get_length+4
				for i in 2..14
					if sortedCard3[i].get_length==3
						figure.set_value(sortedCard3[i].get_card_at(0).get_value)
					elsif sortedCard3[i].get_length==2
						figure.set_value2(sortedCard3[i].get_card_at(0).get_value)
					end
				end
			end
		elsif hasCouleur==true
			figure=Couleur.new
			temp=CardList.new
			for j in 0..3
				if sortedCard4[j].get_length>=5
					temp.copy(sortedCard4[j])
					temp.sort_cards_by_value()
					figure.set_value(temp.get_card_at(0).get_value)
					temp.get_list().delete_at(0)
					break
				end
			end
			temp.get_list.each{|x| figure.add_kicker(x.get_value)}
		elsif hasQuinte==true
			figure=Quinte.new
			for k in 0..sortedCard2.get_length-5
				hasQuinte=true
				for m in 1..4
					if sortedCard2.get_card_at(k+m).get_value!=sortedCard2.get_card_at(k).get_value-m
						hasQuinte=false
					end 
				end
				if hasQuinte==true
					figure.set_value(sortedCard2.get_card_at(k).get_value)
					break
				end
				for m in 1..4
					if sortedCard2bis.get_card_at(k+m).get_value_bis!=sortedCard2bis.get_card_at(k).get_value_bis-m
						hasQuinte=false
					end 
				end
				if hasQuinte==true
					figure.set_value(sortedCard2bis.get_card_at(k).get_value)
					break
				end
			end
		elsif hasBrelan==true
			figure=Brelan.new
			for i in 2..14
				if sortedCard3[16-i].get_length==3
					figure.set_value(sortedCard3[16-i].get_card_at(0).get_value)
					sortedCard3.delete_at(16-i)
					break
				end
			end
			temp=CardList.new
			sortedCard3.each{|x| temp.copy(x)}
			temp.get_list.each{|x| figure.add_kicker(x.get_value)}
		elsif hasDoublePair==true
			figure=DoublePair.new
			indexTab=Array.new
			for i in 2..14
				if sortedCard3[16-i].get_length==2
					figure.set_value(sortedCard3[16-i].get_card_at(0).get_value)
					indexTab.push(16-i)
				end
			end
			sortedCard3.delete_at(indexTab[0])
			sortedCard3.delete_at(indexTab[1])
			temp=CardList.new
			sortedCard3.each{|x| temp.copy(x)}
			temp.get_list.each{|x| figure.add_kicker(x.get_value)}
		elsif hasPair==true
			figure=Pair.new
			for i in 2..14
				if sortedCard3[i].get_length==2
					figure.set_value(sortedCard3[i].get_card_at(0).get_value)
					sortedCard3.delete_at(i)
					break
				end
			end	
			temp=CardList.new
			sortedCard3.each{|x| temp.copy(x)}
			temp.get_list.each{|x| figure.add_kicker(x.get_value)}
		elsif hasHauteur==true
			figure=Hauteur.new
			temp=CardList.new
			sortedCard3.each{|x| temp.copy(x)}
			temp.get_list.each{|x| figure.add_kicker(x.get_value)}
		end
		return figure
	end
	def get_order
		return @order 
	end
	def Figure.kickerlist_to_s(list)
		s=""
		for i in 0..list.length-1
			if i==0
				s=s+Card.value_to_name(list[i])
			else
				s=s+", "+Card.value_to_name(list[i])
			end
		end
		return s
	end
	def to_hash()
		h=Hash.new
		h["score"]=@score
		h["name"]=get_name()
		h["value"]=@value
		if @value2!=nil
			h["value2"]=@value2
		end
		h["kickers"]=@kickerList
		return h
	end
end
