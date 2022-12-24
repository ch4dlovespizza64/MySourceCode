        local UIS = game.UserInputService
        local Camera = game.CurrentCamera

        function getClosest()
            local closestDistance = math.huge
            local closestPlayer = nil
            for i,v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
                    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = v
                    end
                end
            end
        end

        UIS.InputBegan:Connect(function(Input)
            if Input.UserInputService == Enum.UserInputType.MouseButton2 then
                _G.Aim = true
                while wait() do
                    Camera.CFrame = CFrame.new(Camera.Position, getClosest().Head.Position)
                    if _G.Aim == false then return end
                end
            end
        end)

        UIS.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                _G.Aim = false
            end
        end) 
