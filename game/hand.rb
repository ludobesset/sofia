class Hand < CardList
	def initialize()
		super()
		@label=""
	end
	def is_paire()
		return @list[0].get_name()==@list[1].get_name()
	end
	def get_first_card
		return @list[0]
	end
	def get_second_card
		return @list[1]
	end
  def is_suited()
		return @list[0].get_color().get_value()==@list[1].get_color().get_value()
	end
	def set_label()
		@label=to_s()
	end
  def get_type()
		o=Hash.new
		if(is_paire())
			o["paire"]=true
		else
			o["paire"]=false
		end
		if(@list[0].get_value()==@list[1].get_value()+1 or @list[0].get_value()==@list[1].get_value()-1)
			o["connecteur"]=true
		else
			o["connecteur"]=false
		end
		if(@list[0].get_value()==@list[1].get_value()+2 or @list[0].get_value()==@list[1].get_value()-2)
			o["connecteur+1"]=true
		else
			o["connecteur+1"]=false
		end
		if(@list[0].get_value()==@list[1].get_value()+3 or @list[0].get_value()==@list[1].get_value()-3)
			o["connecteur+2"]=true
		else
			o["connecteur+2"]=false
		end
		if(@list[0].get_value()==@list[1].get_value()+4 or @list[0].get_value()==@list[1].get_value()-4)
			o["connecteur+3"]=true
		else
			o["connecteur+3"]=false
		end
		if(is_suited())
			o["suited"]=true
		else
			o["suited"]=false
		end
		if(@list[0].get_value()>=10 and @list[1].get_value()>=10)
			o["broadway"]=true
		else
			o["broadway"]=false
		end
		return o
	end
	def to_hash()
		o=Hash.new
		h=Hash.new
		h["value"] =  @list[0].get_value()
		h["color"] =  @list[0].get_color().get_value()
		h["name"] = @list[0].get_name()
		o["premiere carte"]=h
		g=Hash.new
		g["value"] =  @list[1].get_value()
		g["color"] =  @list[1].get_color().get_value()
		g["name"] = @list[1].get_name()
		o["seconde carte"]=g
		o["type"]=get_type()
		o["label"]=to_s()
		return o
	end
end