local API = {} do 
    API.Mouse = game.Players.LocalPlayer:GetMouse()
    API.visualizer = false -- if u wanna see da hitboxes
    function API:Bind(func,k)
        API.Mouse.KeyDown:Connect(function(r)
            if r == k then 
                func()
            end
        end)
    end
    for _,v in pairs(getgenv().FrameworkSettings.Emotes) do 
        local K = _ 
        if string.find(v, "rbxassetid://") then 
            ID = v 
        else
            ID = "rbxassetid://"
                            .. v 
        end
        function EMOTE()
            local Anim = Instance.new("Animation")
            Anim.AnimationId = ID 
            local Track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
            Track:Play();
        end
        API:Bind(EMOTE,K)
    end
    for _,v in pairs(getgenv().FrameworkSettings.Modes) do 
        local val = v.value 
        local keybind = v.kbind
        local toggledf = v.ontoggle 
        API:Bind(function()
            val = not val 
            toggledf(val)
        end,keybind)
    end
    -- Theme tingy -- 
    local Thema = getgenv().FrameworkSettings.Theme
    local enabled = Thema[1]
    local id = Thema[2]
    if enabled then 
        for i,v in pairs(game.Workspace:GetChildren()) do 
            if v:IsA("Sound") then 
                v:Destroy()
            end
        end
        -- bro?
        local s = Instance.new("Sound")
        s.Parent = game.Workspace 
        if getgenv().FrameworkSettings.custom_ahh_audio then -- audio from ogg file or mp3 idk 
            local Idting = getsynasset(getgenv().FrameworkSettings.custom_ahh_audio_file_name)
            s.SoundId = Idting
        else
            s.SoundId = id 
        end
        -- nigga balls 
    end
    function API:Init()
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        game.ReplicatedStorage.Remotes.Functions:InvokeServer({getrenv()._G.Pass,"ChangeSetting","MorphEnabled",false})
        game.Players.LocalPlayer.PlayerGui.CharacterSelection.Character.Value = "Chara"
        
        wait(1)
        
        game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar"):Destroy()
        game.Players.LocalPlayer.Backpack:WaitForChild("Main").CharaMoves.Animations.Walk.AnimationId = "rbxassetid://4370512420"
        game.Players.LocalPlayer.Backpack:WaitForChild("Main").CharaMoves.Animations.Idle.AnimationId = "rbxassetid://4900761581"
        game.Players.LocalPlayer.Backpack:WaitForChild("Main").CharaMoves.Animations.Run.AnimationId = "rbxassetid://4576074471"
        game.Players.LocalPlayer.Backpack:WaitForChild("Main").CharaMoves.Animations.Block.AnimationId = "rbxassetid://5657245133"
        wait(5)
        game.Workspace.ServerEffects.ServerCooldown:Destroy()
        game.Players.LocalPlayer.Backpack.Main.WalkSpeed.Value = "65"
        local player = game:GetService("Players").LocalPlayer
        game.Players.LocalPlayer.PlayerGui.UI.Ui.ManaBar.Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        game.Players.LocalPlayer.PlayerGui.UI.Ui.StaminaBar.Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        game.Players.LocalPlayer.Character.Head.Voice.SoundId = "rbxassetid://6656148225"
        game.Players.LocalPlayer.Character.HeartLocket:Destroy()
        game.Players.LocalPlayer.Character.LockOn:Destroy()
        game.Players.LocalPlayer.Character.HateArm:Destroy()
        
        local Mouse=game.Players.LocalPlayer:GetMouse()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local humrp = char.HumanoidRootPart
        local lv = humrp.CFrame.LookVector
        
        script = Instance.new("LocalScript", game.Players.LocalPlayer.Backpack.Main)
        for i,v in pairs(game.Players.LocalPlayer.Backpack.Main.CharaMoves:GetChildren()) do
            v.Parent = script
        end
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Idle.AnimationId = "rbxassetid://4495592637"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Walk.AnimationId = "rbxassetid://5079260989"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Run.AnimationId = "rbxassetid://5079265988"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Light1.AnimationId = "rbxassetid://7018872815"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Light2.AnimationId = "rbxassetid://7018884919"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Light3.AnimationId = "rbxassetid://7018893827"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Yellow1.AnimationId = "rbxassetid://7018901376"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Yellow2.AnimationId = "rbxassetid://7018905078"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Yellow3.AnimationId = "rbxassetid://7019288804"
        game.Players.LocalPlayer.Backpack.Main.LocalScript.Animations.Block.AnimationId = "rbxassetid://7817430473"
        local bypass = Instance.new("BoolValue")
        bypass.Name = "Battling"
        bypass.Parent = game.Players.LocalPlayer.Character
        
        game.Players.LocalPlayer.Backpack.Main.RunSpeed.Value = 169
        game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                game.Players.LocalPlayer.Character.Humanoid.Health = 1
            end
        end)
    end
    function API:Chat(Chat, Prefix, RGB)
        -- your mum 
        if not Prefix then 
            local A_1 = 
            {
                [1] = getrenv()._G.Pass, 
                [2] = "Chatted", 
                [3] = Chat,
                [4] = Color3.fromRGB(RGB.R, RGB.G, RGB.B)
            }
            local Event = game:GetService("ReplicatedStorage").Remotes.Events
            Event:FireServer(A_1)
        else
            local A_1 = 
            {
                [1] = getrenv()._G.Pass, 
                [2] = "Chatted", 
                [3] = "[" .. Prefix .. "]\n" .. Chat,
                [4] = Color3.fromRGB(RGB.R, RGB.G, RGB.B)
            }
            local Event = game:GetService("ReplicatedStorage").Remotes.Events
            Event:FireServer(A_1)
        end
    end
    function API:KnifeColor(RGB)
        local args = {
            [1] = {
                [1] = getrenv()._G.Pass,
                [2] = "KnifeColor",
                [3] = "ChangeColor",
                [4] = Color3.fromRGB(RGB.R,RGB.G,RGB.B), --[[Color3]]
                [5] = 0.3,
            }
        }
            
        game:GetService("ReplicatedStorage").Remotes.CharaMoves:InvokeServer(unpack(args))
    end 
    function API:Damage(KNOCKBACK, DMG, HITEFFECT, HITTIME, TYPE, HITBOX)
        if not HITBOX then 
            -- 696969
            local args = {
                [1] = getrenv()._G.Pass,
                [2] = game:service("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value,
                [3] = {
                    ["HitTime"] = HITTIME, 
                    ["Type"] = TYPE, 
                    ["HitEffect"] = HITEFFECT, 
                    ["CombatInv"] = true,
                    ["HurtAnimation"] = game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1, 
                    ["Velocity"] = KNOCKBACK, 
                    ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Punch,
                    ["Damage"] = DMG,
                    ["SpecialKey"] = "91203"
                }
            }
            
            game:GetService("ReplicatedStorage").Remotes.Damage:InvokeServer(unpack(args))
        else 
            function __hitbox(Size,Position,Funct)
                local p=Position
                local s=Size
                local h=Region3.new(p-(s/2),p+(s/2))
                local w=game.Workspace
                local prts=w:FindPartsInRegion3(h)
                if API.visualizer then 
                  local V = Instance.new("Part", workspace)
                  V.CFrame = h.CFrame 
                  V.Size = h.Size 
                  V.Transparency = 0.7 
                  V.Color = Color3.fromRGB(255,255,255)
                  V.Anchored = true 
                  V.CanCollide = false
                end
                local TaggedCS = {}
                for i =1,#prts do 
                  local p = prts[i]
                  if p.Parent.Name ~= game.Players.LocalPlayer.Name then 
                    local c = p.Parent 
                    if TaggedCS[c] ~= true then 
                      TaggedCS[c] = true 
                      Funct(c)
                    end
                  end
                end
            end
            __hitbox(Vector3.new(5,5,5),game.Players.LocalPlayer.Character.HumanoidRootPart.Position,function(t)
                local args = {
                    [1] = getrenv()._G.Pass,
                    [2] = t,
                    [3] = {
                        ["HitTime"] = HITTIME, 
                        ["Type"] = TYPE, 
                        ["HitEffect"] = KNOCKBACK, 
                        ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Punch,
                        ["Damage"] = DMG,
                        ["SpecialKey"] = "91203"
                    }
                }
                
                game:GetService("ReplicatedStorage").Remotes.Damage:InvokeServer(unpack(args))
            end)
        end 
    end
    if getgenv().FrameworkSettings.CustomM1.Enabled then
        local Animations = getgenv().FrameworkSettings.CustomM1.Animations
        local MaxCombo = getgenv().FrameworkSettings.CustomM1.MaxCombo
        local TimeTillReset = getgenv().FrameworkSettings.CustomM1.TimeTillComboReset
        local Player = game.Players.LocalPlayer
        local Character = Players.Character 
        local Mouse = Player:GetMouse()
        local Combo = 0
        local Attacking = false
        Mouse.Button1Down:Connect(function()
            if Attacking == false then
                if CD == true then return end
                CD = true
                Attacking = true
                Combo = Combo + 1
                local thiscombo = Combo
                Stamina = Stamina - 5 -- baby gworl
                local Animation = "rbxassetid://" .. Animations[Combo][1]
                local AnimationObject = Instance.new("Animation")
                AnimationObject.AnimationId = Animation 
                local Track = Character.Humanoid:LoadAnimation(AnimationObject) -- real!!! 
                Track:Play()
                wait(Track.Length/.5)
                API:Damage(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector*170,10,"HeavyHitEffect",1,"Normal",true)
                spawn(function()
                    wait(TimeTillReset)
                    if Combo == thiscombo then 
                        Combo = 0
                    end
                end)
                Attacking = false
                if Combo == MaxCombo then 
                    wait(3)
                    CD = false
                else
                    wait(.3)
                    CD = false 
                end
            end
        end)
    end
end
return API
