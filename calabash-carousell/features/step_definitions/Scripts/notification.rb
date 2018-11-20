class Notification < BasePage

	def initialize(properties)
		@properties = properties
	end

	def notificationAction(action)
		begin
			wait_for(:timeout => 4) { element_exists("* id:'"+@properties[action]+"'") }
			touch("* id:'"+@properties[action]+"'")
		rescue Exception => e
		end
	end

end