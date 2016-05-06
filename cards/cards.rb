##
# Paquet de 52 cartes mélangées aléatoirement
class Cards
	def initialize()
		i=14
		@list=Array.new()
		while i>1
			@list.push(Card.new(i,0))
			@list.push(Card.new(i,1))
			@list.push(Card.new(i,2))
			@list.push(Card.new(i,3))
			i-=1
		end
		'@list.to_a.sort_by{rand(2)-1}'
		j=200
		while j>0
			@list.push(@list.slice!(rand @list.length))
			j-=1
		end
	end
	def slice!(i)
		@list.slice!(i)
	end	
	def to_s()
		result=""
		@list.each{|x| result=""+result+x.to_s()+" "+"\n"}
		return result
	end
end