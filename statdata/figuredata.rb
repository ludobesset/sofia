class FigureData
	def initialize
		@handcount=Hash.new
		@handtie=Hash.new
		@handwin=Hash.new
		step=["flop","turn","river"]
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		for l in 0..fig.length-1
			@handwin[fig[l]]=Hash.new
			@handtie[fig[l]]=Hash.new				
			@handcount[fig[l]]=Hash.new
			for k in 0..2
				@handwin[fig[l]][step[k]]=0
				@handcount[fig[l]][step[k]]=0
				@handtie[fig[l]][step[k]]=0
			end
		end
	end
	def add_hand(step,figure)
		@handcount[figure.get_name][step]+=1
	end
	def add_winning_hand(step,figure)
		@handwin[figure.get_name][step]+=1
	end
	def add_tie_hand(step,figure)
		@handtie[figure.get_name][step]+=1
	end
	def get_score_win(step,figurename)
		if @handcount[figurename][step]!=0
			return (100*@handwin[figurename][step].to_f/@handcount[figurename][step].to_f).round(1)
			'return @handwin[figurename][step].to_s+":"+@handcount[figurename][step].to_s'
		else
			return 0
		end
	end
	def get_score_tie(step,figurename)
		if @handcount[figurename][step]!=0
			return (100*@handtie[figurename][step].to_f/@handcount[figurename][step].to_f).round(1)
			'return @handtie[figurename][step].to_s+":"+@handcount[figurename][step].to_s'
		else
			return 0
		end
	end
	def get_total_count(step)
		fig=["Hauteur","Paire","DoublePaire","Brelan","Quinte","Couleur","Full","Carré"]
		result=0
		for i in 0..fig.length-1
			result=result+@handcount[fig[i]][step] 
		end
		return result
	end
	def get_figure_repartition(step,figurename)
		'return @handcount[figurename][step].to_s+":"+get_total_count(step).to_s'
		return (100*@handcount[figurename][step].to_f/get_total_count(step).to_f).round(1)
	end
end