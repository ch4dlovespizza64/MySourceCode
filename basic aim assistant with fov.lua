-- Roblox aim assist for tutorial roblox games

local plrs = game:GetService("Players")
local LocalPlayer = plrs.LocalPlayer
local cam = workspace.CurrentCamera
local runserv = game:GetService("RunService")
local userinputserv = game:GetService("UserInputService")
local tweenserv = game:GetService("TweenService")
local holdin = false -- gangsta lmfao

-- this will be a global setting code for aim assist lol

_G.AimbotAssist = true
_G.TeamCheck = true
_G.AimPart = "Head"
_G.Sensivity = 0 -- IDK why zero but ok

-- fov circle settings ofc

_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 119, 28)
_G.CircleTransparency = 0.7
_G.CircleRadius = 80
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 0

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumberOfSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
	local MaxDistance = _G.CircleRadius
	local target = nil
	
	for _, v in next, plrs:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local spoint = cam:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local vdistance = (Vector2.new(userinputserv:GetMouseLocation().X, userinputserv:GetMouseLocation().Y) - Vector2.new(spoint.X, spoint.Y)).Magnitude
							
							if vdistance < MaxDistance then
								target = v
							end
						end
					end
				end
			end
		else
			if v.Character ~= nil then
				if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
					if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
						local spoint = cam:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
						local vdistance = (Vector2.new(userinputserv:GetMouseLocation().X, userinputserv:GetMouseLocation().Y) - Vector2.new(spoint.X, spoint.Y)).Magnitude
						
						if vdistance < MaxDistance then
							target = v
						end
					end
				end
			end
		end
	end
	
	return target	
end

userinputserv.InputBegan:Connect(function(Input) -- i rarely use caps bruhuh
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		holdin = true -- dang gangsta word hold up
	end
end)

userinputserv.InputEnded:Connect(function(Input) -- yeah fuck caps
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		holdin = false
	end
end)

runserv.RenderStepped:Connect(function()
	FOVCircle.Position = Vector2.new(userinputserv:GetMouseLocation().X, userinputserv:GetMouseLocation().Y)
	FOVCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
	FOVCircle.Radius = _G.CircleRadius
	FOVCircle.Filled = _G.CircleFilled
	FOVCircle.Color = _G.CircleColor
	FOVCircle.Visible = _G.CircleVisible
	FOVCircle.Transparency = _G.CircleTransparency
	FOVCircle.NumberOfSides = _G.CircleSides
	FOVCircle.Thickness = _G.CircleThickness
	
	if holdin == true and _G.AimbotAssist == true then
		tweenserv:Create(cam, TweenInfo.new(_G.Sensivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(cam.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
		
	end
end)
