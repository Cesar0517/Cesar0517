Move1 = "Anger Rush"
Move2 = "Meteor Crash"
Move3 = "Deadly Dance"
Move4 = "TS Molotv"
Move5 = "Wolf Fang Fist"
Move6 = "Neo Wolf Fang Fist"
Move7 = "God Slicer"
Move8 = "Spirit Bomb Slicer"
Move0 = "God Wrath"
Move10 = "Blaster Meteor"
Settings = {
    Earth = false, -- determines if you go to earth to queue or queue world
    AntiLeach = false, -- rejoins you if somebody is in your broly
    AutoPunch = true, -- auto punches broly if you run out of ki
    DoubleFreeze = true, -- freezes your double exp, you can transform if this is on
    TeamDamage = false, -- you can kill other auto broliers if they grab broly
    CarryMode = true, -- makes you non invis, and you are only on the first pad
    BrolyCamera = false, -- Makes your camera track broly, kinda buggy
    LateTransform = false, -- for androids, transforms when ki is at 70%
    Promotepls = true, -- just promotes my discord
    forms = false, -- turn this on for forms, turn off for androids
    RejoinTime = 15, -- rejoins in broly if this time is exceeded
    GrabChecker = 12, -- time it takes for broly to be last form, rejoins you if hes not by then
    FirstForm = 9, -- the time it takes for brolies Super Saiyan form, this helps a little bit if you are grabbed
    AnimateFreeze = true, -- Breaks your animator but youre still allowed to attack
    invis = false, -- Determines whether your invisible or not, a good alternitive to carry mode so you dont get queued with a lot of people
    waittime = .15, -- the time it waits after it loads
    SeeStats = true; -- This should show you your stats at all times
    BoostFPS = false; -- This will make the game look ugly, but more fluid

        OutputChange = false, -- changes output when low ki
        Amount = 100 -- the amount will be left doesnt go lower than 5, in intervals of 5 aswell 100, 95, 90, 85, ect...
}

-- [[ Game Load ]]

repeat
    wait()
until game:IsLoaded()
repeat
    wait()
until game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
game.Players.LocalPlayer.Character:WaitForChild("PowerOutput")
wait(Settings.waittime)

-- [[ Variables ]]

game.RunService.Stepped:Connect(
    function()
        if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then
            game:GetService("TeleportService"):Teleport(536102540, LocalPlayer) --536102540
        end
    end
)

local Rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
local Client = game.Players.LocalPlayer
local Ids = {
    536102540, -- Earth
    3565304751, -- Que
    2050207304 -- Broly
}
function Twn(HRP, Place, Length)
    local Twn =
        game:GetService("TweenService"):Create(
        HRP,
        TweenInfo.new(.001, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {CFrame = Place}
    )
    Twn:Play()
    Twn.Completed:Wait()
end
wait()
print("Edited KX")
wait()
print("Broly Loaded")

-- [[ BOOST FPS ]]
if Settings.BoostFPS == true then
repeat wait()
 until game:IsLoaded()
   game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD")

local decalsyeeted = true 
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end
if Settings.BoostFPS == false then
    print("BoostFPS is false!")
end

--[[ Credits ]]
game:GetService("StarterGui"):SetCore(
    "SendNotification",
    {
        Title = "AB",
        Text = "! !",
        Duration = "30"
    }
)
-- [[ Server Promotion and Credits ]]

local Credits =
    coroutine.create(
    function()
        if Settings.Promotepls == true then
            while wait(1) do
                local A_1 = "JOIN | .gg/EV4Qv9mjPp | For more modified scripts like this"
                local A_2 = "All"
                local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                Event:FireServer(A_1, A_2)
            end
        end
    end
)

coroutine.resume(Credits)

-- [[ Whitelist/Blacklist ]]

if loadstring ~= loadstring then
    game:shutdown()
end
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Cake9715/Cake9715/main/Ki%20Broly%20Whitelist", true))()
 
-- [[ See Stats ]]

if Settings.SeeStats == true then
    game.Players.LocalPlayer.PlayerGui.HUD.Bottom.Stats.Visible = true
elseif Settings.SeeStats == false then
    print("SeeStats is false")
end

--[[ Death Checker ]]
local DeathChecker =
    coroutine.create(
    function()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if game:GetService("Workspace").Live[Client.name].Humanoid.Health < .1 then
                    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                end
            end
        )
    end
)
coroutine.resume(DeathChecker)

--[[ Variables ]]
Character = Client.Character or Client.CharacterAdded:Wait()
Workspace = game:GetService("Workspace")

--[[ Earth Sequence ]]
if Settings.Earth == true and game.PlaceId == Ids[1] then
    game:GetService("Workspace").Live[Client.name].PowerOutput:Destroy()
    wait(.2)
    Rootpart.CFrame =
        CFrame.new(
        -2273.84326,
        55.506794,
        -7352.45947,
        -0.999128878,
        0,
        0.0417326503,
        0,
        1,
        -0,
        -0.041732654,
        0,
        -0.999128759
    )
    wait(.2)
    Client.Character.LowerTorso:Destroy()
    wait(.1)
    Rootpart.CFrame =
        CFrame.new(
        2751.73364,
        3944.85986,
        -2272.65967,
        0.999996364,
        0,
        -0.00272208848,
        -0,
        1.00000012,
        -0,
        0.00272208848,
        0,
        0.999996364
    )
    wait(.2)
    Rootpart.Anchored = true
    wait(45)
    game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
end

--[[Queue Sequence]]
if Settings.Earth == false and Settings.CarryMode == false then
    if game.PlaceId == Ids[2] then
        game:GetService("Workspace").Live[Client.name].PowerOutput:Destroy()
        wait(.1)
        if Settings.invis == true then
            Rootpart.CFrame =
                CFrame.new(
                3400.90845,
                238,
                -2582.83447,
                -0.753878355,
                0,
                0.657014072,
                0,
                1,
                -0,
                -0.657014072,
                0,
                -0.753878355
            )
            wait(.2)
            Client.Character.LowerTorso:Destroy()
            wait(.1)
        end
        local Pads = {}
        for i, v in pairs(game:WaitForChild("Workspace"):GetChildren()) do
            if v.Name:find("BrolyTeleport") then
                table.insert(Pads, v)
            end
        end
        local pad = Pads[math.random(1, 7)]
        print(pad.Name)
        Twn(Rootpart, pad.PrimaryPart.CFrame, 1)
        wait(.2)
        Rootpart.Anchored = true
        wait(30)
        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
    end
end
if game.PlaceId == Ids[1] then
    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
end
--[[ Carry Mode ]]
if Settings.CarryMode == true then
    if game.PlaceId == Ids[2] then
        game:GetService("Workspace").Live[Client.name].PowerOutput:Destroy()
        local teleportLoop =
            coroutine.create(
            function()
                game:GetService("RunService").Stepped:Connect(
                    function()
                        Rootpart.CFrame =
                            CFrame.new(
                            -25.1735096,
                            238.054749,
                            -148.494934,
                            0.999986291,
                            0,
                            -0.00523946295,
                            -0,
                            1,
                            -0,
                            0.00523946295,
                            0,
                            0.999986291
                        )
                    end
                )
            end
        )
        coroutine.resume(teleportLoop)
        wait(1)
        game.Players.LocalPlayer.Backpack.ServerTraits.Transform:FireServer("g")
        wait(25)
        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
    end
end
if game.PlaceId == Ids[1] then
    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
end
--[[ Broly Sequence ]]
if game.PlaceId == Ids[3] then
    if Settings.AntiLeach == true then
        if #game.Players:GetChildren() > 1 then
            game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
        elseif Settings.AntiLeach == false then
            print("AntiLeach is false")
        end
    end

    if Settings.forms == true then
        wait(.2)
        Client.Backpack.ServerTraits.Input:FireServer({"x"}, CFrame.new())
        wait(3.6)
        Client.Backpack.ServerTraits.Transform:FireServer("h")
        wait(1)
        Client.Backpack.ServerTraits.Input:FireServer({"xoff"}, CFrame.new())
    end

    local track =
        coroutine.create(
        function()
            Target = "broly br"
            for i, w in pairs(game.Workspace.Live:GetChildren()) do
                if string.match(string.lower(w.Name), string.lower(Target)) then
                    _G.Track = true
                    while _G.Track and game:GetService("RunService").Heartbeat:wait() do
                        w:WaitForChild("HumanoidRootPart")
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                                v.CFrame = w.HumanoidRootPart.CFrame
                            end
                        end
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                                v.CFrame = w.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end
        end
    )

    coroutine.resume(track)

    local CameraFollow =
        coroutine.create(
        function()
            if Settings.BrolyCamera == true then
                game:GetService("RunService").Stepped:Connect(
                    function()
                        game.Workspace.CurrentCamera.CFrame =
                            CFrame.new(
                            Client.Character.HumanoidRootPart.Position,
                            game:GetService("Workspace").Live["Broly BR"].HumanoidRootPart.Position
                        ) * CFrame.new(0, 2, 20)
                    end
                )
                if Settings.BrolyCamera == false then
                    print("Broly Camera is false")
                end
            end
        end
    )
    local DamageChecker =
        coroutine.create(
        function()
            repeat
                wait()
            until game:GetService("Workspace").DistributedGameTime >= Settings.GrabChecker
            if game:GetService("Workspace").Live["Broly BR"].Stats["Health-Max"].Value < 53589 then
                game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
            end
        end
    )

    coroutine.resume(DamageChecker)
    coroutine.resume(CameraFollow)

    local GoGod =
        coroutine.create(
        function()
            local God = true
            while God == true do
                wait()
                if
                    game.Workspace.Live[Client.Name].Humanoid.Health <= Client.Character.Humanoid.MaxHealth * .2 and
                        game.Workspace.Live[Client.Name].Ki.Value <= Workspace.Live[Client.Name].Ki.MaxValue * .2
                 then
                    Client.Backpack.ServerTraits.Transform:FireServer("g")
                    wait()
                    Client.Backpack.ServerTraits.Transform:FireServer("h")
                    wait()
                    Client.Backpack.ServerTraits.Transform:FireServer("g")
                end
            end
        end
    )

    coroutine.resume(GoGod)

    local brolyhealthDisplay =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:connect(
                function()
                    game:GetService("Players")[Client.name].PlayerGui.HUD.Bottom.SP.Visible = true
                    Client.PlayerGui.HUD.Bottom.SP.Text = "Kx | Level : " .. Client.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text .. " | Time : " .. math.floor(Workspace.DistributedGameTime) .. " / " .. Settings.RejoinTime .. " | Broly Health : " .. math.floor(Workspace.Live["Broly BR"].Humanoid.Health)
		    Client.PlayerGui.HUD.Bottom.SP.BackgroundColor3 = Color3.new(0, 0, 0)
                end
            )
        end
    )
    coroutine.resume(brolyhealthDisplay)

    local frameLoop = coroutine.create(function()
        game:GetService("RunService").RenderStepped:connect(function()
            Rootpart.CFrame = CFrame.new(-15.7652674, -126.684319, -10.7393866, 0.989255607, 0, 0.146196648, -0, 1.00000012, -0, -0.146196648, 0, 0.989255607)
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            game:GetService("Workspace").Camera.FieldOfView = 300
        end)
    end)
    
    coroutine.resume(frameLoop)

    local AutoHit =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if Settings.AutoPunch == true and game.Workspace.Live[Client.name].Ki.Value < 36 then
                        Client.Backpack.ServerTraits.Input:FireServer({"m2"}, CFrame.new())
                    end
                end
            )
        end
    )
    local LateTransform =
        coroutine.create(
        function()
            if Settings.LateTransform == true then
                repeat
                    wait()
                until Workspace.Live[Client.name].Ki.Value <= Workspace.Live[Client.name].Ki.MaxValue * .7
                Client.Backpack.ServerTraits.Transform:FireServer("g")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("g")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("g")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("g")
            elseif LateTrasform == false then
                Client.Backpack.ServerTraits.Transform:FireServer("g")
            end
        end
    )

    coroutine.resume(LateTransform)

    if Settings.AutoPunch == false then
        print("AutoPunch is false")
    end
    if Settings.DoubleFreeze == true then
        if game.Players.LocalPlayer.Character:FindFirstChild("True") then
            game.Players.LocalPlayer.Character:FindFirstChild("True"):Destroy()
        elseif Setting.DoubleFreeze == false then
            print("DoubleFreeze is false")
        end
    end
    if Settings.TeamDamage == true then
        game:GetService("Workspace").Live[Client.name]:FindFirstChild("team damage"):Destroy()
    elseif Settings.TeamDamage == false then
        print("TeamDamage is false")
    end
	wait(.2)
	Character.HumanoidRootPart.Anchored = true
    Client.Backpack:WaitForChild("Dragon Crush")
    Client.Backpack["Dragon Crush"].Activator:WaitForChild("Flip")
    wait()
    if (Client.Backpack:FindFirstChild("Dragon Crush")) then
        repeat
            wait()
            Character:FindFirstChildOfClass("Humanoid"):EquipTool(Client.Backpack["Dragon Crush"])
        until Client.Character:FindFirstChild("Dragon Crush")

        repeat
            wait()
            Character["Dragon Crush"]:Activate()
        until Character.Ki.Value < Character.Ki.MaxValue
    end

    local GrabCheck =
        coroutine.create(
        function()
            wait(.5)
            if not game.Workspace.Live["Broly BR"]:FindFirstChild("Override") then
                game:GetService("TeleportService"):Teleport(Ids[2])
            end
        end
    )

    coroutine.resume(GrabCheck)
	
    repeat
        wait()
        Character["Dragon Crush"].Activator:FindFirstChild("Flip"):Destroy()
    until not Character["Dragon Crush"].Activator:FindFirstChild("Flip")

    coroutine.resume(AutoHit)
    local RejoinTime =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if game:GetService("Workspace").DistributedGameTime >= Settings.RejoinTime then
                        game:GetService("TeleportService"):Teleport(Ids[2])
                    end
                end
            )
        end
    )
    coroutine.resume(RejoinTime)

    local runService = game:GetService("RunService")
    local debuffs = {
        "Look",
        "xx",
        "Action",
        "SuperAction",
        "Attacking",
        "Using",
        "heavy",
        "hyper",
        "Hyper",
        "Tele",
        "tele",
        "Slow",
        "Killed",
        "KiBlasted",
        "MoveStart",
        "Hyper",
        "Dodging",
        "KiBlasting",
        "BStun",
        "creator",
        "KnockBacked",
        "NotHardBack"
    }

    local function onCharacterAdded(character)
        if (not character) then
            return
        end

        character.ChildAdded:Connect(
            function(child)
                runService.RenderStepped:Wait()
                if (table.find(debuffs, child.Name)) then
                    child:Destroy()
                end
            end
        )
    end

    onCharacterAdded(Client.Character)
    Client.CharacterAdded:Connect(onCharacterAdded)

    if (Client.Character) then
        for i, v in next, Client.Character:GetChildren() do
            if (table.find(debuffs, v.Name)) then
                runService.RenderStepped:Wait()
                v:Destroy()
            end
        end
    end
   local ExplosiveWaveEZ =
        coroutine.create(
        function()
            game:GetService("RunService").Stepped:Connect(
                function()
                    local Detection = {"ExplosiveWave"}

                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if table.find(Detection, v.Name) then
                            wait()
                            Client.Character:FindFirstChild("Humanoid"):EquipTool(Client.Backpack["Flash Strike"])
                            Client.Character["Flash Strike"]:Activate()
                            Client.Character["Flash Strike"]:Deactivate()
                            wait(.2)
                            if Client.Character["Flash Strike"] then
                                Client.Character["Flash Strike"].Parent = Client.Backpack
                            end
                        end
                    end
                end
            )
        end
        )

    coroutine.resume(ExplosiveWaveEZ)

    if Settings.AnimateFreeze == true then
        game.Players.LocalPlayer.Character.Humanoid.Animator.Parent = game.Workspace.Live["Broly BR"].Humanoid
        wait(.2)
        game.Workspace.Live["Broly BR"].Humanoid.Animator:Destroy()
        wait(.1)
        game.Workspace.Live["Broly BR"].Humanoid.Animator:Destroy()
    elseif Settings.AnimateFreeze == false then
        print("Animation is Running")
    end
    local GrabLol =
        coroutine.create(
        function()
		local animtracks = Workspace.Live["Broly BR"].Humanoid:GetPlayingAnimationTracks()
		for i,v in pairs(animtracks) do
    			if v.Name ~= "Idle" and Character.Ki.Value ~= Character.Ki.MaxValue then
          			print("Grabbed!")
			elseif v.Name == "Idle" and Character.Ki.Value ~= Character.Ki.MaxValue then
				Client:Kick('Broly was not grabbed')
    			end
		end
	end
)

    coroutine.resume(GrabLol)

-- [[ Output Change ]]

    coroutine.resume(
        coroutine.create(
            function()
                while Settings.OutputChange == true do
		     if Client.Character.LowerTorso:FindFirstChild('Ui3') and Client.PlayerGui.HUD.Bottom.SideMenu.Output.Perc.Text ~= "100%" then
                     print("increasing")
                     Client.Backpack.ServerTraits.Input:FireServer({"increase"}, true)
                  end
                  wait(.2)
                  if Client.Character.Ki.Value <= Client.Character.Ki.MaxValue * .09 then
                       if Client.PlayerGui.HUD.Bottom.SideMenu.Output.Perc.Text ~= Settings.Amount .. "%" then
                            Client.Backpack.ServerTraits.Input:FireServer({"decrease"}, true)
                            print("Decreasing")
                         end
                  end
             end
end))
    
    coroutine.resume(coroutine.create(function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            while wait() do
                v.CanCollide = false
            end
        end
    end
    )
)

    while true do
        for i, v in pairs(Client.Backpack:GetChildren()) do
            if
                v.Name == Move1 or v.Name == Move2 or v.Name == Move3 or v.Name == Move4 or v.Name == Move5 or
                    v.Name == Move6 or
                    v.Name == Move7 or
                    v.Name == Move8 or
                    v.Name == Move9 or
                    v.Name == Move0 or
                    v.Name == Move10 or
                    v.Name == Move11 or
                    v.Name == Move12 or 
                    v.Name == Move13
             then
                v.Parent = Client.Character
                v:Activate()
                v:Deactivate()
                wait(0.000000000000000)
                v.Parent = Client.Backpack
                Client.Backpack.ServerTraits.EatSenzu:FireServer(
                    "snake sucks dick nigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger nigger"
                )
                if game.Workspace.Live["Broly BR"].Humanoid.Health < .1 then
                    if Settings.Earth == true then
                        game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
                    elseif Settings.Earth == false then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    end
                end
            end
        end
    end
end
