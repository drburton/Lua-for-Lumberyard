local utility = require "scripts/utility"
local cam = {
	Properties = {
			rotateSpeed = {default = 0.01, description = "Rotation speed of camera", suffix = "" },
	},
}

function cam:OnActivate()
	self.MouseXId = InputEventNotificationId("MouseX")
	self.XInputBus = InputEventNotificationBus.Connect(self, self.MouseXId)	
	
	self.MouseYId = InputEventNotificationId("MouseY")
	self.YInputBus = InputEventNotificationBus.Connect(self, self.MouseYId)	
	
	Debug.Log("Number of Properties " .. utility.count(cam.Properties.rotateSpeed)
end


function cam:OnHeld(Inputvalue)

	
end

function cam:OnDeactivate()
	self.XInputBus:Disconnect()
	self.YInputBus:Disconnect()
end

return cam