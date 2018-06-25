local shot = {
		Properties = {
			force = {default = 1000.0, description = "force applied to shot"},
			timer = {default = 3.0, description = "timer for projectile"},
		},
}

function shot:OnActivate()
	local shotDir = TransformBus.Event.GetWorldTM(self.entityId)
	local forwardV = shotDir:GetColumn(1)
	
	PhysicsComponentRequestBus.Event.SetVelocity(self.entityId, forwardV * self.Properties.force)
	self.tickBusHandler = TickBus.Connect(self)
	self.timer = self.Properties.timer
end

function shot:OnTick(deltaTime)
	if self.timer > 0.0 then
		self.timer = self.timer - deltaTime
	else
		-- remove projectile
		GameEntityContextRequestBus.Broadcast.DestroyDynamicSliceByEntity(self.entityId)
	end		
end

function shot:OnDeactivate()
	self.tickBusHandler:Disconnect()
end

return shot