local shoot = {
	Properties ={
		sound = {default = "", description = "Shooting Sound"},
	},
}

function shoot:OnActivate()
	self.FireId = InputEventNotificationId("Fire")
	self.FireBus = InputEventNotificationBus.Connect(self, self.FireId)
end

function shoot:OnPressed()
	SpawnerComponentRequestBus.Event.Spawn(self.entityId)
	AudioTriggerComponentRequestBus.Event.ExecuteTrigger(self.entityId, self.Properties.sound )
	
end

function shoot:OnDeactivate()
	self.FireBus:Disconnect()
end

return shoot



	
