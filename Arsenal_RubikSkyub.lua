--[[

		Gui2Lua™
		10zOfficial
		Version 1.0.0

]]


-- Instances

local RubiksKyub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Info = Instance.new("TextLabel")
local Aimbot = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local SAim = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local InfHealth = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

-- Properties

RubiksKyub.Name = "RubiksKyub"
RubiksKyub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RubiksKyub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RubiksKyub.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = RubiksKyub
MainFrame.Active = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.Position = UDim2.new(0.24944976, 0, 0.386002898, 0)
MainFrame.Size = UDim2.new(0, 278, 0, 257)

UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, 0, 0.0929368064, 0)
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Font = Enum.Font.FredokaOne
Title.Text = "RubikSkyub UI"
Title.TextColor3 = Color3.new(1, 0, 0)
Title.TextScaled = true
Title.TextSize = 14
Title.TextWrapped = true

Info.Name = "Info"
Info.Parent = MainFrame
Info.AnchorPoint = Vector2.new(0.5, 0.5)
Info.BackgroundColor3 = Color3.new(1, 1, 1)
Info.BackgroundTransparency = 1
Info.Position = UDim2.new(0.5, 0, 0.200743496, 0)
Info.Size = UDim2.new(0, 278, 0, 24)
Info.Font = Enum.Font.FredokaOne
Info.Text = "Arsenal Package"
Info.TextColor3 = Color3.new(1, 0, 0)
Info.TextScaled = true
Info.TextSize = 14
Info.TextWrapped = true

Aimbot.Name = "Aimbot"
Aimbot.Parent = MainFrame
Aimbot.AnchorPoint = Vector2.new(0.5, 0.5)
Aimbot.BackgroundColor3 = Color3.new(1, 1, 1)
Aimbot.Position = UDim2.new(0.498784542, 0, 0.356319606, 0)
Aimbot.Size = UDim2.new(0, 148, 0, 40)
Aimbot.Font = Enum.Font.FredokaOne
Aimbot.Text = "Aimbot"
Aimbot.TextColor3 = Color3.new(1, 0, 0)
Aimbot.TextScaled = true
Aimbot.TextSize = 14
Aimbot.TextWrapped = true

UICorner_2.Parent = Aimbot

SAim.Name = "SAim"
SAim.Parent = MainFrame
SAim.AnchorPoint = Vector2.new(0.5, 0.5)
SAim.BackgroundColor3 = Color3.new(1, 1, 1)
SAim.Position = UDim2.new(0.498784542, 0, 0.603582144, 0)
SAim.Size = UDim2.new(0, 148, 0, 40)
SAim.Font = Enum.Font.FredokaOne
SAim.Text = "Silent Aim"
SAim.TextColor3 = Color3.new(1, 0, 0)
SAim.TextScaled = true
SAim.TextSize = 14
SAim.TextWrapped = true

UICorner_3.Parent = SAim

InfHealth.Name = "InfHealth"
InfHealth.Parent = MainFrame
InfHealth.AnchorPoint = Vector2.new(0.5, 0.5)
InfHealth.BackgroundColor3 = Color3.new(1, 1, 1)
InfHealth.Position = UDim2.new(0.498784542, 0, 0.862344265, 0)
InfHealth.Size = UDim2.new(0, 148, 0, 40)
InfHealth.Font = Enum.Font.FredokaOne
InfHealth.Text = "Inf Health"
InfHealth.TextColor3 = Color3.new(1, 0, 0)
InfHealth.TextScaled = true
InfHealth.TextSize = 14
InfHealth.TextWrapped = true

UICorner_4.Parent = InfHealth

-- Scripts

local function PGRVA_fake_script() -- MainFrame.Functions 
	local script = Instance.new('LocalScript', MainFrame)

	-- RubikSkyub UI --
	-- Made by RTLua1 (random king on YouTube)
	-- Project started in 2019 but was delayed until 2022
	-- Script Version: 0.1
	
	-- Variables
	
	local parent = script.Parent
	local ui = script.Parent.Parent
	local aimbot = script.Parent.Aimbot
	local silent_aim = script.Parent.SAim
	local infhealth = script.Parent.InfHealth
	
	-- Main Functions
	
	-- Draggable
	
	parent.Active = true
	parent.Draggable = true
	
	-- Buttons Functions
	
	aimbot.MouseButton1Click:Connect(function()
		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = Players.LocalPlayer
		local Holding = false
	
		_G.AimbotEnabled = true
		_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
		_G.AimPart = "Head" -- Where the aimbot script would lock at.
		_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
	
		local function GetClosestPlayer()
			local MaximumDistance = math.huge
			local Target = nil
	
			coroutine.wrap(function()
				wait(20); MaximumDistance = math.huge -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
			end)()
	
			for _, v in next, Players:GetPlayers() do
				if v.Name ~= LocalPlayer.Name then
					if _G.TeamCheck == true then
						if v.Team ~= LocalPlayer.Team then
							if v.Character ~= nil then
								if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
									if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
										local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
										local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
	
										if VectorDistance < MaximumDistance then
											Target = v
											MaximumDistance = VectorDistance
										end
									end
								end
							end
						end
					else
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
	
									if VectorDistance < MaximumDistance then
										Target = v
										MaximumDistance = VectorDistance
									end
								end
							end
						end
					end
				end
			end
	
			return Target
		end
	
		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = true
			end
		end)
	
		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = false
			end
		end)
	
		RunService.RenderStepped:Connect(function()
			if Holding == true and _G.AimbotEnabled == true then
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
			end
		end)
	end)
	
	silent_aim.MouseButton1Click:Connect(function()
		-- init
		if not game:IsLoaded() then 
			game.Loaded:Wait()
		end
	
		if not syn or not protectgui then
			getgenv().protectgui = function() end
		end
	
		local SilentAimSettings = {
			Enabled = false,
	
			ClassName = "Universal Silent Aim - Averiias, Stefanuk12, xaxa",
			ToggleKey = "RightAlt",
	
			TeamCheck = false,
			VisibleCheck = false, 
			TargetPart = "HumanoidRootPart",
			SilentAimMethod = "Raycast",
	
			FOVRadius = 130,
			FOVVisible = false,
			ShowSilentAimTarget = false, 
	
			MouseHitPrediction = false,
			MouseHitPredictionAmount = 0.165,
			HitChance = 100
		}
	
		-- variables
		getgenv().SilentAimSettings = Settings
		local MainFileName = "UniversalSilentAim"
		local SelectedFile, FileToSave = "", ""
	
		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local GuiService = game:GetService("GuiService")
		local UserInputService = game:GetService("UserInputService")
		local HttpService = game:GetService("HttpService")
	
		local LocalPlayer = Players.LocalPlayer
		local Mouse = LocalPlayer:GetMouse()
	
		local GetChildren = game.GetChildren
		local GetPlayers = Players.GetPlayers
		local WorldToScreen = Camera.WorldToScreenPoint
		local WorldToViewportPoint = Camera.WorldToViewportPoint
		local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
		local FindFirstChild = game.FindFirstChild
		local RenderStepped = RunService.RenderStepped
		local GuiInset = GuiService.GetGuiInset
		local GetMouseLocation = UserInputService.GetMouseLocation
	
		local resume = coroutine.resume 
		local create = coroutine.create
	
		local ValidTargetParts = {"Head", "HumanoidRootPart"}
		local PredictionAmount = 0.165
	
		local mouse_box = Drawing.new("Square")
		mouse_box.Visible = true 
		mouse_box.ZIndex = 999 
		mouse_box.Color = Color3.fromRGB(54, 57, 241)
		mouse_box.Thickness = 20 
		mouse_box.Size = Vector2.new(20, 20)
		mouse_box.Filled = true 
	
		local fov_circle = Drawing.new("Circle")
		fov_circle.Thickness = 1
		fov_circle.NumSides = 100
		fov_circle.Radius = 180
		fov_circle.Filled = false
		fov_circle.Visible = false
		fov_circle.ZIndex = 999
		fov_circle.Transparency = 1
		fov_circle.Color = Color3.fromRGB(54, 57, 241)
	
		local ExpectedArguments = {
			FindPartOnRayWithIgnoreList = {
				ArgCountRequired = 3,
				Args = {
					"Instance", "Ray", "table", "boolean", "boolean"
				}
			},
			FindPartOnRayWithWhitelist = {
				ArgCountRequired = 3,
				Args = {
					"Instance", "Ray", "table", "boolean"
				}
			},
			FindPartOnRay = {
				ArgCountRequired = 2,
				Args = {
					"Instance", "Ray", "Instance", "boolean", "boolean"
				}
			},
			Raycast = {
				ArgCountRequired = 3,
				Args = {
					"Instance", "Vector3", "Vector3", "RaycastParams"
				}
			}
		}
	
		function CalculateChance(Percentage)
			-- // Floor the percentage
			Percentage = math.floor(Percentage)
	
			-- // Get the chance
			local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
	
			-- // Return
			return chance <= Percentage / 100
		end
	
	
		--[[file handling]] do 
			if not isfolder(MainFileName) then 
				makefolder(MainFileName);
			end
	
			if not isfolder(string.format("%s/%s", MainFileName, tostring(game.PlaceId))) then 
				makefolder(string.format("%s/%s", MainFileName, tostring(game.PlaceId)))
			end
		end
	
		local Files = listfiles(string.format("%s/%s", "UniversalSilentAim", tostring(game.PlaceId)))
	
		-- functions
		local function GetFiles() -- credits to the linoria lib for this function, listfiles returns the files full path and its annoying
			local out = {}
			for i = 1, #Files do
				local file = Files[i]
				if file:sub(-4) == '.lua' then
					-- i hate this but it has to be done ...
	
					local pos = file:find('.lua', 1, true)
					local start = pos
	
					local char = file:sub(pos, pos)
					while char ~= '/' and char ~= '\\' and char ~= '' do
						pos = pos - 1
						char = file:sub(pos, pos)
					end
	
					if char == '/' or char == '\\' then
						table.insert(out, file:sub(pos + 1, start - 1))
					end
				end
			end
	
			return out
		end
	
		local function UpdateFile(FileName)
			assert(FileName or FileName == "string", "oopsies");
			writefile(string.format("%s/%s/%s.lua", MainFileName, tostring(game.PlaceId), FileName), HttpService:JSONEncode(SilentAimSettings))
		end
	
		local function LoadFile(FileName)
			assert(FileName or FileName == "string", "oopsies");
	
			local File = string.format("%s/%s/%s.lua", MainFileName, tostring(game.PlaceId), FileName)
			local ConfigData = HttpService:JSONDecode(readfile(File))
			for Index, Value in next, ConfigData do
				SilentAimSettings[Index] = Value
			end
		end
	
		local function getPositionOnScreen(Vector)
			local Vec3, OnScreen = WorldToScreen(Camera, Vector)
			return Vector2.new(Vec3.X, Vec3.Y), OnScreen
		end
	
		local function ValidateArguments(Args, RayMethod)
			local Matches = 0
			if #Args < RayMethod.ArgCountRequired then
				return false
			end
			for Pos, Argument in next, Args do
				if typeof(Argument) == RayMethod.Args[Pos] then
					Matches = Matches + 1
				end
			end
			return Matches >= RayMethod.ArgCountRequired
		end
	
		local function getDirection(Origin, Position)
			return (Position - Origin).Unit * 1000
		end
	
		local function getMousePosition()
			return GetMouseLocation(UserInputService)
		end
	
		local function IsPlayerVisible(Player)
			local PlayerCharacter = Player.Character
			local LocalPlayerCharacter = LocalPlayer.Character
	
			if not (PlayerCharacter or LocalPlayerCharacter) then return end 
	
			local PlayerRoot = FindFirstChild(PlayerCharacter, Options.TargetPart.Value) or FindFirstChild(PlayerCharacter, "HumanoidRootPart")
	
			if not PlayerRoot then return end 
	
			local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}
			local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)
	
			return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
		end
	
		local function getClosestPlayer()
			if not Options.TargetPart.Value then return end
			local Closest
			local DistanceToMouse
			for _, Player in next, GetPlayers(Players) do
				if Player == LocalPlayer then continue end
				if Toggles.TeamCheck.Value and Player.Team == LocalPlayer.Team then continue end
	
				local Character = Player.Character
				if not Character then continue end
	
				if Toggles.VisibleCheck.Value and not IsPlayerVisible(Player) then continue end
	
				local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
				local Humanoid = FindFirstChild(Character, "Humanoid")
				if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end
	
				local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)
				if not OnScreen then continue end
	
				local Distance = (getMousePosition() - ScreenPosition).Magnitude
				if Distance <= (DistanceToMouse or Options.Radius.Value or 2000) then
					Closest = ((Options.TargetPart.Value == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]]) or Character[Options.TargetPart.Value])
					DistanceToMouse = Distance
				end
			end
			return Closest
		end
	
		-- ui creating & handling
		local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/UI's/Linoria/Source.lua"))()
		Library:SetWatermark("github.com/Averiias")
	
		local Window = Library:CreateWindow("Universal Silent Aim, by Averiias, xaxa, and Stefanuk12")
		local GeneralTab = Window:AddTab("General")
		local MainBOX = GeneralTab:AddLeftTabbox("Main") do
			local Main = MainBOX:AddTab("Main")
	
			Main:AddToggle("aim_Enabled", {Text = "Enabled"}):AddKeyPicker("aim_Enabled_KeyPicker", {Default = "RightAlt", SyncToggleState = true, Mode = "Toggle", Text = "Enabled", NoUI = false});
			Options.aim_Enabled_KeyPicker:OnClick(function()
				SilentAimSettings.Enabled = not SilentAimSettings.Enabled
	
				Toggles.aim_Enabled.Value = SilentAimSettings.Enabled
				Toggles.aim_Enabled:SetValue(SilentAimSettings.Enabled)
	
				mouse_box.Visible = SilentAimSettings.Enabled
			end)
	
			Main:AddToggle("TeamCheck", {Text = "Team Check", Default = SilentAimSettings.TeamCheck}):OnChanged(function()
				SilentAimSettings.TeamCheck = Toggles.TeamCheck.Value
			end)
			Main:AddToggle("VisibleCheck", {Text = "Visible Check", Default = SilentAimSettings.VisibleCheck}):OnChanged(function()
				SilentAimSettings.VisibleCheck = Toggles.VisibleCheck.Value
			end)
			Main:AddDropdown("TargetPart", {Text = "Target Part", Default = SilentAimSettings.TargetPart, Values = {"Head", "HumanoidRootPart", "Random"}}):OnChanged(function()
				SilentAimSettings.TargetPart = Options.TargetPart.Value
			end)
			Main:AddDropdown("Method", {Text = "Silent Aim Method", Default = SilentAimSettings.SilentAimMethod, Values = {
				"Raycast","FindPartOnRay",
				"FindPartOnRayWithWhitelist",
				"FindPartOnRayWithIgnoreList",
				"Mouse.Hit/Target"
			}}):OnChanged(function() 
				SilentAimSettings.SilentAimMethod = Options.Method.Value 
			end)
			Main:AddSlider('HitChance', {
				Text = 'Hit chance',
				Default = 100,
				Min = 0,
				Max = 100,
				Rounding = 1,
	
				Compact = false,
			})
			Options.HitChance:OnChanged(function()
				SilentAimSettings.HitChance = Options.HitChance.Value
			end)
		end
	
		local MiscellaneousBOX = GeneralTab:AddLeftTabbox("Miscellaneous")
		local FieldOfViewBOX = GeneralTab:AddLeftTabbox("Field Of View") do
			local Main = FieldOfViewBOX:AddTab("Visuals")
	
			Main:AddToggle("Visible", {Text = "Show FOV Circle"}):AddColorPicker("Color", {Default = Color3.fromRGB(54, 57, 241)}):OnChanged(function()
				fov_circle.Visible = Toggles.Visible.Value
				SilentAimSettings.FOVVisible = Toggles.Visible.Value
			end)
			Main:AddSlider("Radius", {Text = "FOV Circle Radius", Min = 0, Max = 360, Default = 130, Rounding = 0}):OnChanged(function()
				fov_circle.Radius = Options.Radius.Value
				SilentAimSettings.FOVRadius = Options.Radius.Value
			end)
			Main:AddToggle("MousePosition", {Text = "Show Silent Aim Target"}):AddColorPicker("MouseVisualizeColor", {Default = Color3.fromRGB(54, 57, 241)}):OnChanged(function()
				mouse_box.Visible = Toggles.MousePosition.Value 
				SilentAimSettings.ShowSilentAimTarget = Toggles.MousePosition.Value 
			end)
			local PredictionTab = MiscellaneousBOX:AddTab("Prediction")
			PredictionTab:AddToggle("Prediction", {Text = "Mouse.Hit/Target Prediction"}):OnChanged(function()
				SilentAimSettings.MouseHitPrediction = Toggles.Prediction.Value
			end)
			PredictionTab:AddSlider("Amount", {Text = "Prediction Amount", Min = 0.165, Max = 1, Default = 0.165, Rounding = 3}):OnChanged(function()
				PredictionAmount = Options.Amount.Value
				SilentAimSettings.MouseHitPredictionAmount = Options.Amount.Value
			end)
		end
	
		local CreateConfigurationBOX = GeneralTab:AddRightTabbox("Create Configuration") do 
			local Main = CreateConfigurationBOX:AddTab("Create Configuration")
	
			Main:AddInput("CreateConfigTextBox", {Default = "", Numeric = false, Finished = false, Text = "Create Configuration to Create", Tooltip = "Creates a configuration file containing settings you can save and load", Placeholder = "File Name here"}):OnChanged(function()
				if Options.CreateConfigTextBox.Value and string.len(Options.CreateConfigTextBox.Value) ~= "" then 
					FileToSave = Options.CreateConfigTextBox.Value
				end
			end)
	
			Main:AddButton("Create Configuration File", function()
				if FileToSave ~= "" or FileToSave ~= nil then 
					UpdateFile(FileToSave)
				end
			end)
		end
	
		local SaveConfigurationBOX = GeneralTab:AddRightTabbox("Save Configuration") do 
			local Main = SaveConfigurationBOX:AddTab("Save Configuration")
			Main:AddDropdown("SaveConfigurationDropdown", {Values = GetFiles(), Text = "Choose Configuration to Save"})
			Main:AddButton("Save Configuration", function()
				if Options.SaveConfigurationDropdown.Value then 
					UpdateFile(Options.SaveConfigurationDropdown.Value)
				end
			end)
		end
	
		local LoadConfigurationBOX = GeneralTab:AddRightTabbox("Load Configuration") do 
			local Main = LoadConfigurationBOX:AddTab("Load Configuration")
	
			Main:AddDropdown("LoadConfigurationDropdown", {Values = GetFiles(), Text = "Choose Configuration to Load"})
			Main:AddButton("Load Configuration", function()
				if table.find(GetFiles(), Options.LoadConfigurationDropdown.Value) then
					LoadFile(Options.LoadConfigurationDropdown.Value)
	
					Toggles.TeamCheck:SetValue(SilentAimSettings.TeamCheck)
					Toggles.VisibleCheck:SetValue(SilentAimSettings.VisibleCheck)
					Options.TargetPart:SetValue(SilentAimSettings.TargetPart)
					Options.Method:SetValue(SilentAimSettings.SilentAimMethod)
					Toggles.Visible:SetValue(SilentAimSettings.FOVVisible)
					Options.Radius:SetValue(SilentAimSettings.FOVRadius)
					Toggles.MousePosition:SetValue(SilentAimSettings.ShowSilentAimTarget)
					Toggles.Prediction:SetValue(SilentAimSettings.MouseHitPrediction)
					Options.Amount:SetValue(SilentAimSettings.MouseHitPredictionAmount)
					Options.HitChance:SetValue(SilentAimSettings.HitChance)
				end
			end)
		end
	
		resume(create(function()
			RenderStepped:Connect(function()
				if Toggles.MousePosition.Value and Toggles.aim_Enabled.Value then
					if getClosestPlayer() then 
						local Root = getClosestPlayer().Parent.PrimaryPart or getClosestPlayer()
						local RootToViewportPoint, IsOnScreen = WorldToViewportPoint(Camera, Root.Position);
						-- using PrimaryPart instead because if your Target Part is "Random" it will flicker the square between the Target's Head and HumanoidRootPart (its annoying)
	
						mouse_box.Visible = IsOnScreen
						mouse_box.Position = Vector2.new(RootToViewportPoint.X, RootToViewportPoint.Y)
					else 
						mouse_box.Visible = false 
						mouse_box.Position = Vector2.new()
					end
				end
	
				if Toggles.Visible.Value then 
					fov_circle.Visible = Toggles.Visible.Value
					fov_circle.Color = Options.Color.Value
					fov_circle.Position = getMousePosition()
				end
			end)
		end))
	
		-- hooks
		local oldNamecall
		oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
			local Method = getnamecallmethod()
			local Arguments = {...}
			local self = Arguments[1]
			local chance = CalculateChance(SilentAimSettings.HitChance)
			if Toggles.aim_Enabled.Value and self == workspace and not checkcaller() and chance == true then
				if Method == "FindPartOnRayWithIgnoreList" and Options.Method.Value == Method then
					if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
						local A_Ray = Arguments[2]
	
						local HitPart = getClosestPlayer()
						if HitPart then
							local Origin = A_Ray.Origin
							local Direction = getDirection(Origin, HitPart.Position)
							Arguments[2] = Ray.new(Origin, Direction)
	
							return oldNamecall(unpack(Arguments))
						end
					end
				elseif Method == "FindPartOnRayWithWhitelist" and Options.Method.Value == Method then
					if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
						local A_Ray = Arguments[2]
	
						local HitPart = getClosestPlayer()
						if HitPart then
							local Origin = A_Ray.Origin
							local Direction = getDirection(Origin, HitPart.Position)
							Arguments[2] = Ray.new(Origin, Direction)
	
							return oldNamecall(unpack(Arguments))
						end
					end
				elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and Options.Method.Value:lower() == Method:lower() then
					if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
						local A_Ray = Arguments[2]
	
						local HitPart = getClosestPlayer()
						if HitPart then
							local Origin = A_Ray.Origin
							local Direction = getDirection(Origin, HitPart.Position)
							Arguments[2] = Ray.new(Origin, Direction)
	
							return oldNamecall(unpack(Arguments))
						end
					end
				elseif Method == "Raycast" and Options.Method.Value == Method then
					if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
						local A_Origin = Arguments[2]
	
						local HitPart = getClosestPlayer()
						if HitPart then
							Arguments[3] = getDirection(A_Origin, HitPart.Position)
	
							return oldNamecall(unpack(Arguments))
						end
					end
				end
			end
			return oldNamecall(...)
		end))
	
		local oldIndex = nil 
		oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, Index)
			if self == Mouse and not checkcaller() and Toggles.aim_Enabled.Value and Options.Method.Value == "Mouse.Hit/Target" and getClosestPlayer() then
				local HitPart = getClosestPlayer()
	
				if Index == "Target" or Index == "target" then 
					return HitPart
				elseif Index == "Hit" or Index == "hit" then 
					return ((Toggles.Prediction.Value and (HitPart.CFrame + (HitPart.Velocity * PredictionAmount))) or (not Toggles.Prediction.Value and HitPart.CFrame))
				elseif Index == "X" or Index == "x" then 
					return self.X 
				elseif Index == "Y" or Index == "y" then 
					return self.Y 
				elseif Index == "UnitRay" then 
					return Ray.new(self.Origin, (self.Hit - self.Origin).Unit)
				end
			end
	
			return oldIndex(self, Index)
		end))
	end)
	
	infhealth.MouseButton1Click:Connect(function()
		local player = game.Players.LocalPlayer
		
		player.Character:FindFirstChildOfClass("Humanoid").MaxHealth = 9999999
		player.Character:FindFirstChildOfClass("Humanoid").Health = 9999998 -- indication of health
	end)
	
	-- Extra Functions
	
	ui.ResetOnSpawn = false
	ui.Enabled = true
	ui.IgnoreGuiInset = true
	
	-- Credit Function
	
	print("Made by RTLua1, also known as random king on youtube")
	print("if there are any errors, i will fix them soon, for now enjoy this")
end
coroutine.wrap(PGRVA_fake_script)()
