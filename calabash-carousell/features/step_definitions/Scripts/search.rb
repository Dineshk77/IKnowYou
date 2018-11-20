class Search < BasePage

	def initialize(properties,itemText)
		@properties = properties
		@itemText = itemText
	end

	def searchItem(notificationProps)
		wait_for(:timeout => 4) { element_exists("* id:'"+@properties["id"]+"'") }
		touch("* id:'"+@properties["id"]+"'")
		sleep 1
		notification = Notification.new notificationProps
		notification.notificationAction("skip")
		touch("* id:'"+@properties["textBox"]+"'")
		keyboard_enter_text(@itemText)
		press_user_action_button
	end

	def validateSearch()
		@properties["validate"].each do |key,value|
			if key == "productTitle"
				checkProductTitle(value)
			end
		end
	end

	def checkProductTitle(value)
		wait_for(:timeout => 4) { element_exists("* id:'"+value+"'") }
		titleQuery = query("* id:'text_product'",:text)
		for item in titleQuery
			if not item.downcase.include?(@itemText.downcase)
				raise ("Search validation failed")
			end
		end
	end

end