##
# Permet la manipulation d'un ensemble de carte, en particulier de tri et de rangement
#   - tri par valeur
#   - rangement par valeur
#   - rangement par couleur
class CardList
	def initialize()
		@list=Array.new()
	end
	def add_card(newcard)
		@list.push(newcard)
	end
	def get_list()
		return @list
	end
	def get_length()
		return @list.length
	end
	def get_card_at(i)
		return @list[i]
	end
	def get_first_card
		return @list[0]
	end
	def get_last_card
		return @list[@list.length-1]
	end
	def copy(newCardList)
		if !newCardList.nil?
			if newCardList.get_length>0
				newCardList.get_list().each{|x| @list.push(x)}
			end
		end
	end
	def sort_cards_by_value()
		aucun_echange=false
		while aucun_echange==false
			aucun_echange=true
			len=@list.length-2
			for i in 0..len
				if @list[i].get_value<@list[i+1].get_value
					temp=@list[i]
					@list[i]=@list[i+1]
					@list[i+1]=temp
					aucun_echange=false
					break
				end
			end
		end
	end
	#tri sans doublon, l'as comptant pour 14
	def sort_cards_by_value!()
		aucun_echange=false
		while aucun_echange==false
			aucun_echange=true
			len=@list.length-2
			for i in 0..len
				if !@list[i].nil? and !@list[i+1].nil?
					if @list[i].get_value<@list[i+1].get_value
						temp=@list[i]
						@list[i]=@list[i+1]
						@list[i+1]=temp
						aucun_echange=false
						break
					elsif @list[i].get_value == @list[i+1].get_value
						@list.delete_at(i)
						aucun_echange=false
						break
					end
				end
			end
		end
	end
	#tri sans doublon, l'as comptant pour 1
	def sort_cards_by_value_bis!()
		aucun_echange=false
		while aucun_echange==false
			aucun_echange=true
			len=@list.length-2
			for i in 0..len
				if !@list[i].nil? and !@list[i+1].nil?
					if @list[i].get_value_bis<@list[i+1].get_value_bis
						temp=@list[i]
						@list[i]=@list[i+1]
						@list[i+1]=temp
						aucun_echange=false
						break
					elsif @list[i].get_value_bis == @list[i+1].get_value_bis
						@list.delete_at(i)
						aucun_echange=false
						break
					end
				end
			end
		end
	end
	# Retourne un nouv eau
	def sort_cards_by_same_value()
		result=Array.new
		for i in 2..14
			result[i]=CardList.new
		end
		@list.each{|x| result[x.get_value].add_card(x)}
		return result
	end
	def sort_cards_by_same_color()
		result=Array.new
		for i in 0..3
			result[i]=CardList.new
		end
		@list.each{|x| result[x.get_color.get_value].add_card(x)}
		return result
	end
	def sort_cards_by_serie()
		sort_cards_by_value!
		result=Array.new
		index=0
		result[index]=CardList.new
		result[index].add_card(@list[0])
		len=@list.length-1
		for i in 1..len
			if @list[i].get_value==@list[i-1].get_value-1
				result[index].add_card(@list[i])
			else
				index+=1
				result[index]=CardList.new
				result[index].add_card(@list[i])
			end
		end
		if @list[0].get_value==14 and @list[@list.length-1].get_value==2
			result[index].add_card(@list[0])
		end
		return result
	end
	def to_s()
		result=""
		@list.each{|x| result=""+result+x.to_s()+", "}
		return result
	end
	def to_hash()
		o=Array.new
		len=@list.length-1
		for i in 0..len
			h=Hash.new
			h["value"] =  @list[i].get_value()
			h["color"] =  @list[i].get_color()
			h["name"] = @list[i].get_name()
			o.push(h)
		end
		return o
	end
end
