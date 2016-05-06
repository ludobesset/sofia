class DBLogSession
	def initialize
		@db = CouchRest.database!("http://127.0.0.1:5984/poker-hands")
	end
	def on_event(o)
		if(o.get_name=="showdown")
			response = @db.save_doc(o.get_message)
		end
	end
end
