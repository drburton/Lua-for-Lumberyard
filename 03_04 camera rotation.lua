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
	
	Debug.Log("Number of Properties " .. utility.count(cam.Properties.rotateSpeed))
	utility.showTable(cam.Properties.rotateSpeed)
end


function cam:OnHeld(Inputvalue)
	local rSpeed = self.Properties.rotateSpeed
	-- Handle Mouse Input	
	if (InputEventNotificationBus.GetCurrentBusId() == self.MouseXId) then

		TransformBus.Event.RotateAroundLocalZ(self.entityId, -Inputvalue * rSpeed)
		local temp = TransformBus.Event.GetWorldRotation(self.entityId)
--		Debug.Log("Moved Mouse Left/Right".. temp.z)

		
	elseif (InputEventNotificationBus.GetCurrentBusId() == self.MouseYId) then
		TransformBus.Event.RotateAroundLocalX(self.entityId, -Inputvalue * rSpeed)
		local temp = TransformBus.Event.GetWorldRotation(self.entityId)
--		Debug.Log("Moved Mouse Up/Down ".. temp.x)

	end
	
end

function cam:OnDeactivate()
	self.XInputBus:Disconnect()
	self.YInputBus:Disconnect()
end

return cam