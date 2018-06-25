local shot = {
	Properties ={
		sound = {default = "", description = "Shooting Sound"},
	},
}

function shot:OnActivate()
	self.FireId = InputEventNotificationId("Fire")
	self.FireBus = InputEventNotificationBus.Connect(self, self.FireId)
end

function shot:OnHeld()
	AudioTriggerComponentRequestBus.Event.ExecuteTrigger(self.entityId, self.Properties.sound )
	Debug.Log("Shooting!")
end

function shot:OnDeactivate()
	self.FireBus:Disconnect()
end

return shot