-- movement

local movement = {
	Properties = {
		moveSpeed = {default = 3.0, description = "Movement Speed", suffix = "m/s"},
		rotateSpeed = {default = 0.01, desription = "Rotation Speed", suffix = ""},
		jumpForce = { default = 50.0, description = "The force to jump with." },
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
	
	self.jumpId = InputEventNotificationId("Jump")
	self.JumpBus = InputEventNotificationBus.Connect(self, self.jumpId)					

end

function movement:OnHeld(inputValue)
	local mSpeed = self.Properties.moveSpeed
	local playerDir = TransformBus.Event.GetWorldTM(self.entityId)
	local forwardV = playerDir:GetColumn(1)  --returns direction facing
	local sideV = playerDir:GetColumn(0) -- returns side (right) direction
	local upV = playerDir:GetColumn(2) -- returns up vector for ship
	local rSpeed = self.Properties.rotateSpeed
	
	
	--Handle input
	if (InputEventNotificationBus.GetCurrentBusId() == self.forwardId) then
		TransformBus.Event.MoveEntity(self.entityId, forwardV * mSpeed * inputValue)	
--		Debug.Log("Moved the object Forward")
		
	elseif (InputEventNotificationBus.GetCurrentBusId() == self.backwardId) then
		TransformBus.Event.MoveEntity(self.entityId, -forwardV * mSpeed * inputValue)
--		Debug.Log("Moved the object Backward")
			
	elseif (InputEventNotificationBus.GetCurrentBusId() == self.rightId) then
		TransformBus.Event.MoveEntity(self.entityId, sideV * mSpeed * inputValue)
--		Debug.Log("Moved the object Right")
		
	elseif (InputEventNotificationBus.GetCurrentBusId() == self.leftId) then
		TransformBus.Event.MoveEntity(self.entityId, -sideV * mSpeed * inputValue)
--		Debug.Log("Moved the object Left")		
	
	end
	
--[[	if (InputEventNotificationBus.GetCurrentBusId() == self.mouseXId) then
		TransformBus.Event.RotateAroundLocalX(self.entityId, -inputValue * rSpeed)
		Debug.Log("Moved Mouse Up/Down")
	end]]
	
	if (InputEventNotificationBus.GetCurrentBusId() == self.mouseYId) then
		TransformBus.Event.RotateAroundLocalZ(self.entityId, -inputValue * rSpeed)
--		Debug.Log("Moved Mouse Left/Right")
	end
	
	if (InputEventNotificationBus.GetCurrentBusId() == self.jumpId) then

		PhysicsComponentRequestBus.Event.EnablePhysics(self.entityId)
		local jumpMag =  Vector3(0.0, 0.0, self.Properties.jumpForce)
		PhysicsComponentRequestBus.Event.AddImpulse(self.entityId, jumpMag)
		Debug.Log("Jump!")
	
	end
	
end




function movement:OnDeactivate()
	self.ForwardBus:Disconnect()
	self.BackwardBus:Disconnect()
	self.LeftBus:Disconnect()
	self.RightBus:Disconnect()
	self.MouseXBus:Disconnect()
	self.MouseYBus:Disconnect()
	self.JumpBus:Disconnect()
end

return movement
		
