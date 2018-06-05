local rotate = {
	Properties ={
		Rotation = {default = Vector3(0, 0, 90), description = "Amount of rotation to apply", suffix = " degrees/sec"},
	},
}

function rotate:OnActivate()
	self.tickBusHandler = TickBus.Connect(self)
	self.rotationRadians = self.Properties.Rotation
	self.rotationRadians.x = Math.DegToRad(self.rotationRadians.x)
	self.rotationRadians.y = Math.DegToRad(self.rotationRadians.y)
	self.rotationRadians.z = Math.DegToRad(self.rotationRadians.z)
	

end

function rotate:OnTick(deltaTime, timePoint)
	TransformBus.Event.RotateAroundLocalX(self.entityId, self.rotationRadians.x * deltaTime)
	TransformBus.Event.RotateAroundLocalY(self.entityId, self.rotationRadians.y * deltaTime)
	TransformBus.Event.RotateAroundLocalZ(self.entityId, self.rotationRadians.z * deltaTime)
end


function rotate:OnDeactivate()
	self.tickBusHandler:Disconnect()
end


return rotate