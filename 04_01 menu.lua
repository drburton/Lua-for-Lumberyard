Menu = { }

function Menu:OnActivate()
	Debug.Log("Hello from Main Menu Lua Loader!")
	self.canvasEntityId = UiCanvasManagerBus.Broadcast.LoadCanvas("UI/Canvases/UiMainMenuLuaSample/MainMenu.uicanvas")

	LyShineLua.ShowMouseCursor(true)
	local canvasId = UiCanvasAssetRefBus.Event.LoadCanvas(self.entityId)
	self.canvasNotificationHandler = UiCanvasNotificationBus.Connect(self, self.canvasEntityId)

end

function Menu:OnAction(entityID, actionName)
	Debug.Log("OnAction Called")
	if (actionName == "PlayGame") then
		UiCanvasManagerBus.Broadcast.UnloadCanvas(self.canvasEntityId)
		LyShineLua.ShowMouseCursor(false)
	elseif (actionName == "ShowOptions") then
	-- we will add this later
	elseif (actionName == "Quit") then
		ConsoleRequestBus.Broadcast.ExecuteConsoleCommand("Quit")
	end
end


function Menu:OnDeactivate()
	self.canvasNotificationHandler:Disconnect()
end

return Menu
