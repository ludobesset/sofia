class Board < CardList
	def initialize()
		super()
	end	
	def get_max_card()
		max=0
		len=@list.length-1
		for i in 0..len
			if @list[i].get_value>max
				max=@list[i].get_value
			end
		end
		for i in 0..len
			if @list[i].get_value==max
				return @list[i]
				break
			end
		end
	end
  def to_hash()
		@o=Hash.new
		@o["cards"]=super()
		@flopboardcopy=CardList.new
		@turnboardcopy=CardList.new
		@riverboardcopy=CardList.new
		len=@list.length-1
		for i in 0..2
			@flopboardcopy.add_card(@list[i])
		end
		for i in 0..3
			@turnboardcopy.add_card(@list[i])
		end
		for i in 0..4
			@riverboardcopy.add_card(@list[i])
		end
		@o["figure flop"]=Figure.find_figure(nil,@flopboardcopy).to_hash()
		@o["figure turn"]=Figure.find_figure(nil,@turnboardcopy).to_hash()
		@o["figure river"]=Figure.find_figure(nil,@riverboardcopy).to_hash()
		return @o
	end
end