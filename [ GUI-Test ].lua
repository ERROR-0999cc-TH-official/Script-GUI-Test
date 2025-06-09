local Players = game:GetService("Players") 
local player = Players.LocalPlayer  
local PlayerGui = player:WaitForChild("PlayerGui")  

-- ฟังก์ชันเพิ่มมุมโค้ง  
local function addCorner(parent, radius)  
	local corner = Instance.new("UICorner")  
	corner.CornerRadius = UDim.new(0, radius or 8)  
	corner.Parent = parent  
end  

-- ข้อมูลแจ้งเตือน
local notifications = {    
	{text = "กำลังโหลด script", delay = 2},  
	{text = "โหลด script เสร็จสิ้น", delay = 1},   
	{text = "Anti-AFK-Hub V.1.4", delay = 3},  
}  

local changelogGui  
local toggleButtonGui  
local toggleButton  

for index, notif in ipairs(notifications) do  
	task.wait(notif.delay)  
	pcall(function()  
		game.StarterGui:SetCore("SendNotification", {  
			Title = "[ Anti-AFK-Hud ]",  
			Text = notif.text,  
			Duration = 8  
		})  
	end)  

	if index == 1 then  
		task.delay(2, function()  
			changelogGui = Instance.new("ScreenGui", PlayerGui)    
			changelogGui.Name = "ChangelogGui"    
			changelogGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling    
			changelogGui.ResetOnSpawn = false    
			changelogGui.Enabled = true  

			local frame = Instance.new("Frame", changelogGui)    
			frame.Size = UDim2.new(0, 400, 0, 300)    
			frame.Position = UDim2.new(0.5, -200, 0.5, -150)    
			frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)    
			frame.BorderSizePixel = 0    
			frame.Active = true    
			frame.Draggable = true    
			addCorner(frame)

			local stroke = Instance.new("UIStroke")
			stroke.Color = Color3.fromRGB(0, 0, 0)
			stroke.Thickness = 2
			stroke.Transparency = 0
			stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			stroke.Parent = frame

			local closeButton = Instance.new("TextButton", frame)
			closeButton.Text = "X"
			closeButton.Size = UDim2.new(0, 30, 0, 30)
			closeButton.Position = UDim2.new(1, -35, 0, 5)
			closeButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
			closeButton.TextColor3 = Color3.new(1, 1, 1)
			closeButton.ZIndex = 10
			addCorner(closeButton)
			
			closeButton.MouseButton1Click:Connect(function()
				if PlayerGui:FindFirstChild("ConfirmCloseGui") then return end

				local confirmGui = Instance.new("ScreenGui")
				confirmGui.Name = "ConfirmCloseGui"
				confirmGui.ResetOnSpawn = false
				confirmGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				confirmGui.Parent = PlayerGui

				local frame = Instance.new("Frame")
				frame.Size = UDim2.new(0, 350, 0, 160)
				frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				frame.AnchorPoint = Vector2.new(0.5, 0.5)
				frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				frame.BorderSizePixel = 0
				frame.Parent = confirmGui
				frame.Active = true
				frame.Draggable = true
				addCorner(frame, 16)

				local stroke = Instance.new("UIStroke")
				stroke.Color = Color3.fromRGB(0, 0, 0)
				stroke.Thickness = 2
				stroke.Transparency = 0
				stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				stroke.Parent = frame

				local label = Instance.new("TextLabel")
				label.Size = UDim2.new(1, -40, 0, 100)
				label.Position = UDim2.new(0, 20, 0, 20)
				label.BackgroundTransparency = 1
				label.Text = "คุณต้องการที่จะปิดใช้งานใช่ไหม"
				label.TextColor3 = Color3.new(1, 1, 1)
				label.Font = Enum.Font.SourceSansBold
				label.TextSize = 28
				label.TextWrapped = true
				label.TextYAlignment = Enum.TextYAlignment.Center
				label.Parent = frame

				local okBtn = Instance.new("TextButton")
				okBtn.Size = UDim2.new(0.48, -10, 0, 50)
				okBtn.Position = UDim2.new(0, 20, 1, -70)
				okBtn.Text = "ตกลง"
				okBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				okBtn.TextColor3 = Color3.new(1, 1, 1)
				okBtn.Font = Enum.Font.SourceSans
				okBtn.TextSize = 22
				okBtn.Parent = frame
				addCorner(okBtn, 10)

				local cancelBtn = Instance.new("TextButton")
				cancelBtn.Size = UDim2.new(0.48, -10, 0, 50)
				cancelBtn.Position = UDim2.new(0.52, 0, 1, -70)
				cancelBtn.Text = "ยกเลิก"
				cancelBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				cancelBtn.TextColor3 = Color3.new(1, 1, 1)
				cancelBtn.Font = Enum.Font.SourceSans
				cancelBtn.TextSize = 22
				cancelBtn.Parent = frame
				addCorner(cancelBtn, 10)

				cancelBtn.MouseButton1Click:Connect(function()
					confirmGui:Destroy()
				end)

				okBtn.MouseButton1Click:Connect(function()
					confirmGui:Destroy()
					if changelogGui then changelogGui:Destroy() end
					if toggleButtonGui then toggleButtonGui:Destroy() end
				end)
			end)

-- เส้นกั้น
local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -20, 0, 2)
Line.Position = UDim2.new(0, 10, 0, 40)
Line.BackgroundColor3 = Color3.fromRGB(0,0,0)
Line.BorderSizePixel = 0
Line.Parent = Frame

			local topLeftText = Instance.new("TextLabel", frame)    
			topLeftText.Text = "Anti-AFK-Hub V.1.4"    
			topLeftText.Font = Enum.Font.SourceSans    
			topLeftText.TextSize = 14    
			topLeftText.TextColor3 = Color3.fromRGB(180, 180, 180)    
			topLeftText.BackgroundTransparency = 1    
			topLeftText.Position = UDim2.new(0, 10, 0, 10)    
			topLeftText.Size = UDim2.new(0, 200, 0, 20)    
			topLeftText.TextXAlignment = Enum.TextXAlignment.Left    
			topLeftText.ZIndex = 10    
			addCorner(topLeftText)  

			local bottomRightText = Instance.new("TextLabel", frame)    
			bottomRightText.Text = "by [ERROR 0999cc] TH [official]"    
			bottomRightText.Font = Enum.Font.SourceSansItalic    
			bottomRightText.TextSize = 14    
			bottomRightText.TextColor3 = Color3.fromRGB(200, 200, 200)    
			bottomRightText.BackgroundTransparency = 1    
			bottomRightText.Position = UDim2.new(1, -200, 1, -20)    
			bottomRightText.Size = UDim2.new(0, 190, 0, 20)    
			bottomRightText.TextXAlignment = Enum.TextXAlignment.Right    
			bottomRightText.ZIndex = 10    
			addCorner(bottomRightText)

			task.delay(1, function()
				toggleButtonGui = Instance.new("ScreenGui", PlayerGui)  
				toggleButtonGui.Name = "ToggleButtonGui"  
				toggleButtonGui.ResetOnSpawn = false  
				toggleButtonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  

				toggleButton = Instance.new("TextButton", toggleButtonGui)  
				toggleButton.Size = UDim2.new(0, 40, 0, 40)  
				toggleButton.Position = UDim2.new(0, 10, 0, 10)  
				toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
				toggleButton.Text = "A"  
				toggleButton.TextColor3 = Color3.new(1, 1, 1)  
				toggleButton.Font = Enum.Font.SourceSansBold  
				toggleButton.TextSize = 24  
				toggleButton.ZIndex = 20  
				toggleButton.Active = true  
				toggleButton.Draggable = true  
				addCorner(toggleButton, 10)

				local stroke = Instance.new("UIStroke")
				stroke.Color = Color3.fromRGB(0, 0, 0)
				stroke.Thickness = 2
				stroke.Transparency = 0
				stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				stroke.Parent = toggleButton

				toggleButton.MouseButton1Click:Connect(function()  
					if changelogGui then  
						changelogGui.Enabled = not changelogGui.Enabled  
					end  
				end)  
			end)
		end)
	end

	task.wait(1)
end