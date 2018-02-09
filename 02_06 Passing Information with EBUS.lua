

local movement = {
	Properties = {
		moveSpeed = {default = 3.0, description = "Movement Speed", suffix = "m/s"},
		rotateSpeed = {default = 0.01, desription = "Rotation Speed", suffix = ""},
		},
	}

function movement:OnActivate()
	-- Set key and mouse bindings
	self.forwardId = InputEventNotificationId("Forward")
	self.ForwardBus = InputEventNotificationBus.Connect(self, self.forwardId)
	
	self.backwardId = InputEventNotificationId("Backward")
	self.BackwardBus = InputEventNotificationBus.Connect(self, self.backwardId)

	self.leftId = InputEventNotificationId("Left")
	self.LeftBus = InputEventNotificationBus.Connect(self, self.leftId)	

	self.rightId = InputEventNotificationId("Right")
	self.RightBus = InputEventNotificationBus.Connect(self, self.rightId)
	
	self.mouseXId = InputEventNotificationId("MouseX")
	self.MouseXBus = InputEventNotificationBus.Connect(self, self.mouseXId)
	
	self.mouseYId = InputEventNotificationId("MouseY")
	self.MouseYBus = InputEventNotificationBus.Connect(self, self.mouseYId)	

end



function movement:OnDeactivate()

end

return movement