class HandData
	def initialize
		@handcount=Hash.new
		@handtie=Hash.new
		@handwin=Hash.new
		step=["flop","turn","river"]
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		for i in 2..14
			for j in 2..14
				@handwin[HandTypeArray.get_handtype_by_value(i,j,"offsuited")]=Hash.new
				@handtie[HandTypeArray.get_handtype_by_value(i,j,"offsuited")]=Hash.new				
				@handcount[HandTypeArray.get_handtype_by_value(i,j,"offsuited")]=Hash.new
				@handwin[HandTypeArray.get_handtype_by_value(i,j,"suited")]=Hash.new
				@handtie[HandTypeArray.get_handtype_by_value(i,j,"suited")]=Hash.new
				@handcount[HandTypeArray.get_handtype_by_value(i,j,"suited")]=Hash.new
				for k in 0..2
					@handwin[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]]=Hash.new
					@handtie[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]]=Hash.new
					@handcount[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]]=Hash.new
					@handwin[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]]=Hash.new
					@handtie[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]]=Hash.new
					@handcount[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]]=Hash.new
					@handwin[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]]["total"]=0
					@handtie[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]]["total"]=0
					@handcount[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]]["total"]=0
					@handwin[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]]["total"]=0
					@handtie[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]]["total"]=0
					@handcount[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]]["total"]=0
					for l in 0..fig.length-1
						@handwin[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]][fig[l]]=0
						@handtie[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]][fig[l]]=0
						@handcount[HandTypeArray.get_handtype_by_value(i,j,"offsuited")][step[k]][fig[l]]=0
						@handwin[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]][fig[l]]=0
						@handtie[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]][fig[l]]=0
						@handcount[HandTypeArray.get_handtype_by_value(i,j,"suited")][step[k]][fig[l]]=0
					end
				end
			end
		end
	end
	def add_hand(key,step,figure)
		@handcount[key][step]["total"]+=1
		@handcount[key][step][figure.get_name]+=1
	end
	def add_winning_hand(key,step,figure)
		@handwin[key][step]["total"]+=1
		@handwin[key][step][figure.get_name]+=1
	end
	def add_tie_hand(key,step,figure)
		@handtie[key][step]["total"]+=1
		@handtie[key][step][figure.get_name]+=1
	end
	def get_score_win(key,step,typ)
		if @handcount[key][step][typ]!=0
			return (100*@handwin[key][step][typ].to_f/@handcount[key][step][typ].to_f).round(1)
		else
			return 0
		end
	end
	def get_score_tie(key,step,typ)
		if @handcount[key][step][typ]!=0
			return (100*@handtie[key][step][typ].to_f/@handcount[key][step][typ].to_f).round(1)
		else
			return 0
		end
	end
	def get_figure_repartition(key,step,typ)
		if @handcount[key][step]["total"]!=0
			return (100*@handcount[key][step][typ].to_f/@handcount[key][step]["total"].to_f).round(1)
		else
			return 0
		end
	end
end