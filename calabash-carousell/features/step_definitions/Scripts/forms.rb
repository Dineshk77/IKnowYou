class Forms < BasePage
	
	def initialize(properties)
		@properties = properties
	end

	def submitForm(type)
		touch("* text:'"+@properties["tabs"][type]+"'")
		@properties.each do |key,value|
			if key == "text"
				inputText(value)
			elsif key == "chooseItem"
				chooseItem(value)
			end
		end
		wait_for(:timeout => 4) { element_exists("* id:'"+@properties["button"][type]+"'") }
		touch("* id:'"+@properties["button"][type]+"'")
	end

	def inputText(value)
		value.each do |key,value|
			touch("* id:'"+value["id"]+"'")
			sleep 1
			keyboard_enter_text(value["text"])
			hide_soft_keyboard
			sleep 1
		end
	end

	def chooseItem(value)
		value.each do |key,value|
			wait_for(:timeout => 4) { element_exists("* id:'"+value["pageCheckId"]+"'") }
			touch("* id:'"+value["id"]+"'")
			wait_for(:timeout => 4) { element_exists("* id:'"+value["location"]["id"]+"'") }
			touch("* id:'"+value["location"]["id"]+"'")
		end
	end
end