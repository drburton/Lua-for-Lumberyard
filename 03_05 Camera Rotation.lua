local cam = {
	Properties = {
			rotateSpeed = {default = 0.01, description = "Rotation speed " },
	},
}


function cam:OnActivate()
	self.MouseXId = InputEventNotificationId("MouseX")
	self.XInputBus = InputEventNotificationBus.Connect(self, self.MouseXId)
end

function cam:OnHeld(input)
	if (InputEventNotificationBus.GetCurrentBusId() == self.MouseXId) then
		TransformBus.Event.RotateAroundLocalZ(self.entityId, -input *self.Properties.rotateSpeed)
--		Debug.Log("Moved Mouse Left/Right")
	end
end

function cam:OnDeactivate()
	self.XInputBus:Disconnect()
end


return cam