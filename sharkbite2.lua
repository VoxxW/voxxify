local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Voxxify V2",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://voxxify.v2"
}

GUI:Credit{
	Name = "Voxx",
	Description = "Developer & Maintainer of Voxxify V2",
	Discord = "imvoxx"
}

GUI:Notification{
	Title = "Welcome to Voxxify V2!",
	Text = "Feel free to report any bugs to our discord! discord.gg/voxxify",
	Duration = 8,
	Callback = function() end
}

local lplayer = game.Players.LocalPlayer
local AutofarmT = GUI:Tab{
	Name = "AutoFarm",
	Icon = "rbxassetid://6022668883" 
}

local SafteyT = GUI:Tab{
	Name = "Saftey",
	Icon = "rbxassetid://6022668961" 
}

local PlayerT = GUI:Tab{
	Name = "Player",
	Icon = "rbxassetid://6022668887"
}

local GunModsT = GUI:Tab{
	Name = "Gun Mods",
	Icon = "rbxassetid://6031215991"
}

local BoatT = GUI:Tab{
	Name = "Boats",
	Icon = "rbxassetid://6034754442"
}

local EspT = GUI:Tab{
	Name = "ESP",
	Icon = "rbxassetid://6031154875"
}

local TeleportT = GUI:Tab{
	Name = "Teleports",
	Icon = "rbxassetid://6034754448"
}

local WebookT = GUI:Tab{
	Name = "Webhook",
	Icon = "rbxassetid://6026671234"
}


local OthersT = GUI:Tab{
	Name = "Others",
	Icon = "rbxassetid://6031090999"
}




local autofarmSettings = {
    quitatamt = false;
    quitamtval = nil;

  
}

SafteyT:Textbox{
	Name = "Teeth To Stop At",
Callback = function(ted) 
		if tonumber(ted) then
			autofarmSettings.quitamtval = ted
		end
	end
}







SafteyT:Toggle{
	Name = "Enabled",
	StartingState = false,
	Description = "Stops at a teeth amount.",
	Callback = function(state) 

		autofarmSettings.quitatamt = state
 
	end
   
}

spawn(function()
	while task.wait() do
        if autofarmSettings.quitatamt == true then
            if tonumber(game.Players.LocalPlayer.PlayerGui.HUD.Currency.TeethContainer.TextLabel.Text) > tonumber(autofarmSettings.quitamtval) and tonumber(autofarmSettings.quitamtval) ~= nil then
                game:shutdown()
            end
        end
    end
end)

GunModsT:Toggle{
	Name = "Shark Aimbot",
	StartingState = false,
	Description = "Sets your camera onto the shark.",
	Callback = function(state) 
		getgenv().Value = state
        while getgenv().Value do
            wait()
        function lookAt(pos)
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,pos)
            end
        
            if workspace.Sharks:FindFirstChild("GreatWhite") ~= nil then
                           
                lookAt(game.Workspace.Sharks.GreatWhite.SharkMain.Ball.Position)
            end
        
            if workspace.Sharks:FindFirstChild("BullShark") ~= nil then
               
                lookAt(game.Workspace.Sharks.BullShark.SharkMain.Ball.Position)
            end
        
            if workspace.Sharks:FindFirstChild("Hammerhead") ~= nil then
               
                lookAt(game.Workspace.Sharks.Hammerhead.SharkMain.Ball.Position)
            end
        
            if workspace.Sharks:FindFirstChild("Orca") ~= nil then
                
                lookAt(game.Workspace.Sharks.Orca.SharkMain.Ball.Position)
            end
        
            if workspace.Sharks:FindFirstChild("Mako") ~= nil then
                lookAt(game.Workspace.Sharks.Mako.SharkMain.Ball.Position)
           
            end
        end
	
 
	end
   
}



GunModsT:Slider{
	Name = "Firate",
	Default = 0,
	Min = 0,
	Max = 5000,
	Callback = function(state) 
	
		for i,v in pairs(require(game.ReplicatedStorage.Projectiles.ProjectileStatsModule).get()) do 
			v.ReloadTime = 1e-123
			v.Mode = 2
			v.Recoil = Vector3.zero
			v.FireRate = state
		end  
	end
}


GunModsT:Slider{
	Name = "Max Ammo",
	Default = 0,
	Min = 0,
	Max = 5000,
	Callback = function(state) 
		
		for i,v in pairs(require(game.ReplicatedStorage.Projectiles.ProjectileStatsModule).get()) do 
			v.MagSize = state
			end
	end

}

GunModsT:Slider{
	Name = "Turret Fire Rate",
	Default = 0,
	Min = 0,
	Max = 100,
	Callback = function(state) 
	
		for i,v in pairs(require(game.ReplicatedStorage.Projectiles.TurretStatsModule).get()) do 
			v.ReloadTime = 1e-123
			v.Mode = 2
			v.Recoil = Vector3.zero
			v.FireRate = state
		end  
	end
}
webhook = nil
WebookT:Textbox{
	Name = "Webhook",
	Callback = function(ted) 
		webhook = ted
	end
}

local httprequest = request or (syn and syn.request) or (http and http.request)
WebookT:Toggle{
	Name = "Enabled",
	StartingState = false,
	Description = "Sends Webhook notis",
	Callback = function(state) 
        getgenv().Value = state
		while getgenv().Value do
            wait()
wait(1)

local status = nil
  
if game.Players.LocalPlayer.Team.Name == "Survivor" then
	status = "Autofarming shark.."
end

	if game.Players.LocalPlayer.Team.Name == "Shark" then
	status = "AFK as shark.."
	end
	
	   if game.Players.LocalPlayer.Team.Name == "Spectator" then
	status = "In lobby..."
	end



	local lp = game.Players.LocalPlayer
  
	local data = {
	
	["content"] = " ", 
	["embeds"] = {{
		["title"] = "Voxxify V2", 
		["color"] = 0xffffff,
		["footer"] = { -- Again, has to be stored as a table.
			 ["text"] = "Voxxify V2";
		 
		 },
		["fields"] = {
		   { -- now make a new one for each field you wish to add
				 ["name"] = "`🦷 | Total Shark Teeth`";
				 ["value"] = "```"..game.Players.LocalPlayer.PlayerGui.HUD.Currency.TeethContainer.TextLabel.Text.."```"; -- The text,value or information under the title of the field aka name.
				 ["inline"] = true; -- means that its either inline with others, from left to right or if it is set to false, from up to down.
			 },
		 
		  {
				 ["name"] = "`🦈 | Status`";
				 ["value"] = "```"..status.."```";
				
			 }
	
		}}
	}
	}
	
	
	
	 httprequest(
		 {
			 Url = webhook,  -- This website helps debug HTTP requests
			 Method = "POST",
			 Headers = {
				 ["Content-Type"] = "application/json"  -- When sending JSON, set this!
			 },
			 Body = game:GetService("HttpService"):JSONEncode(data)
		 }
	 )
     
		end
	end
   
}
-- scripts --

AutofarmT:Toggle{
	Name = "Afk Farm",
	StartingState = false,
	Description = "Teleports you to the island",
	Callback = function(state) 
        getgenv().Value = state
		while getgenv().Value do
            wait()


 
       
			lplayer.Character.Humanoid.Jump = true
            task.wait(3)
			lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1495, 12, 410)	
        end
	
	end
   
}

AutofarmT:Toggle{
	Name = "Shark AutoFarm",
	StartingState = false,
	Description = "Kills the shark",
	Callback = function(state) 
		if state then
			GUI:Notification{
				Title = "Alert",
				Text = "Shark Auto Kill is on..",
				Duration = 3,
				Callback = function() end
			}
		end
        getgenv().Value = state
        while getgenv().Value do

          wait()
          for i,v in pairs(require(game.ReplicatedStorage.Projectiles.ProjectileStatsModule).get()) do 
			v.Range = 9e9
			v.MagSize = 9e9
			v.ReloadTime = 1e-123
			v.Mode = 2
			v.Recoil = Vector3.zero
			v.FireRate = 900000000000000000000000000000000000000000000000000000000000
		end    
	
	
		
		function lookAt(pos)
			workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,pos)
			end
	
	
			for i,v in pairs(require(game.ReplicatedStorage.Projectiles.ProjectileStatsModule).get()) do 
				v.Range = 9e9
				v.MagSize = 9e9
				v.ReloadTime = 1e-123
				v.Mode = 2
				v.Recoil = Vector3.zero
				v.FireRate = 90000000000000000000000000000000000000000000000000000000
			end    
	
	
	
	 
	
	
	   
	   
			
			
					local shark = workspace.Sharks:GetChildren()[1]
					if lplayer.Team.Name ~= "Shark" and lplayer.Team.Name ~= "Spectator" then
						if shark ~= nil then
			
							
	
	
	
                            
	
							game.Players.LocalPlayer.Character.Humanoid.Jump = true
							
							
							if lplayer.Backpack:GetChildren()[1] ~= nil then
								lplayer.Backpack:GetChildren()[1].Parent = lplayer.Character
							end
			
							
							function lookAt(pos)
								workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,pos)
								end
			
						   
								local vu = game:GetService("VirtualUser")
	
								vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
								wait(0.1)
								vu:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	
								vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
								wait(0.1)
								vu:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	
								vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
								wait(0.1)
								vu:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

                                game.Players.LocalPlayer.Character.Humanoid.HipHeight = 8
			
			
			
							if workspace.Sharks:FindFirstChild("GreatWhite") ~= nil then
								lookAt(game.Workspace.Sharks.GreatWhite.SharkMain.Ball.Position)
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Sharks.GreatWhite.SharkMain.Ball.Position)
								
							end
			
							if workspace.Sharks:FindFirstChild("BullShark") ~= nil then
								lookAt(game.Workspace.Sharks.BullShark.SharkMain.Ball.Position)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Sharks.BullShark.SharkMain.Ball.Position)
							end
			
							if workspace.Sharks:FindFirstChild("Hammerhead") ~= nil then
								lookAt(game.Workspace.Sharks.Hammerhead.SharkMain.Ball.Position)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Sharks.Hammerhead.SharkMain.Ball.Position)
							end
			
							if workspace.Sharks:FindFirstChild("Orca") ~= nil then
								lookAt(game.Workspace.Sharks.Orca.SharkMain.Ball.Position)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Sharks.Orca.SharkMain.Ball.Position)
							end
			
							if workspace.Sharks:FindFirstChild("Mako") ~= nil then
								lookAt(game.Workspace.Sharks.Mako.SharkMain.Ball.Position)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Sharks.Mako.SharkMain.Ball.Position)
							end
			
							mouse1click()
							
			
						
			 
						 
						   
							
						end
					end
                
                  
		 
	end
	end
}






AutofarmT:Toggle{
	Name = "Golden Vases Farm",
	StartingState = false,
	Description = "Auto gets Vases",
	Callback = function(state)
        getgenv().Value = state
        while getgenv().Value do

          wait()
          
			for i,v in pairs(workspace.Vases:GetChildren()) do 
				lplayer.Character.HumanoidRootPart.CFrame = v.Vase.CFrame
			end
		end
	end
}


AutofarmT:Toggle{
	Name = "Present Auto Farm",
	StartingState = false,
	Description = "Auto gets Vases",
	Callback = function(state)




        getgenv().Value = state
		while getgenv().Value do
			wait()

				if game.Players.LocalPlayer.Team.Name == "Survivor" then
					game.Players.LocalPlayer.Character.Humanoid.Jump = true
					
					if workspace.Christmas.Gifts:FindFirstChild("Gift" or "Sack") ~= nil then
				task.wait(3)
						
						if workspace.Christmas.Specials:FindFirstChild("Sack") ~= nil then
		
			
					
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Christmas.Specials.Sack.Part.Position)
						
						end

						if workspace.Christmas.Gifts:FindFirstChild("Gift") ~= nil then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Christmas.Gifts.Gift.Position)
						




						
					
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(613, 35, 1415)
					end
					




					
				
				end	
		   end
		end
	end
}

PlayerT:Slider({
    Name = "Speed",
	Default = 50,
	Min = 0,
	Max = 500,
	Callback = function(Value)
		lplayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerT:Button{
	Name = "Fly (E toggle)",
	Description = "",
	Callback = function() 
    -- Press E to toggle

repeat wait()
until lplayer and lplayer.Character and lplayer.Character:findFirstChild("UpperTorso") and lplayer.Character:findFirstChild("Humanoid")
local mouse = lplayer:GetMouse()
repeat wait() until mouse
local plr = lplayer
local UpperTorso = plr.Character.UpperTorso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0

function Fly()
local bg = Instance.new("BodyGyro", UpperTorso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = UpperTorso.CFrame
local bv = Instance.new("BodyVelocity", UpperTorso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "e" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
    end
}


EspT:Toggle{
	Name = "Player Chams",
	StartingState = false,
	Description = "Shows where playes are..",
	Callback = function(state) 
		local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()

		Sense.teamSettings.Enemy.enabled = state
		Sense.teamSettings.Enemy.boxEnabled = state
		Sense.teamSettings.Enemy.boxOutline = state

		Sense.teamSettings.Friendly.enabled = state
		Sense.teamSettings.Friendly.boxEnabled = state
		Sense.teamSettings.Friendly.boxOutline = state
		 
		Sense.Load()
	end
   
}


EspT:Button{
	Name = "Shark ESP",
	Description = "Outlines where the shark is..",
	Callback = function() 
		for _,v in pairs(game.workspace.Sharks:GetChildren()) do
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.fromRGB(109, 0, 242)
			Highlight.Parent = v
			Highlight.OutlineTransparency = 1
			Highlight.FillTransparency = 0.2
		end
		 
		local function OnAdded(Shark)
			repeat task.wait() until Shark:IsA("Model")
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.fromRGB(109, 0, 242)
			Highlight.Parent = Shark
			Highlight.OutlineTransparency = 1
			Highlight.FillTransparency = 0.2
		end
		 
		workspace.Sharks.ChildAdded:Connect(function(Shark)
			OnAdded(Shark)
		end)
    end
}

EspT:Button{
	Name = "Present ESP",
	Description = "Outlines where the gifts is..",
	Callback = function() 
		for _,v in pairs(game.workspace.Christmas.Gifts:GetChildren()) do
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.fromRGB(109, 0, 242)
			Highlight.Parent = v
			Highlight.OutlineTransparency = 1
			Highlight.FillTransparency = 0.2
		end
		 
		local function OnAdded(Shark)
			repeat task.wait() until Shark:IsA("Part")
			local Highlight = Instance.new("Highlight")
			Highlight.FillColor = Color3.fromRGB(109, 0, 242)
			Highlight.Parent = Shark
			Highlight.OutlineTransparency = 1
			Highlight.FillTransparency = 0.2
		end
		 
		workspace.Christmas.Gifts.ChildAdded:Connect(function(Shark)
			OnAdded(Shark)
		end)
    end
}





TeleportT:Button{
	Name = "Teleport to shark",
	Description = "",
	Callback = function() 
        lplayer.Character.HumanoidRootPart.CFrame = game.Workspace.Sharks.GreatWhite.SharkMain.Ball.CFrame
    end
}

OthersT:Toggle{
	Name = "Auto Invite all",
	StartingState = false,
	Description = "Auto invites the lobby to your boat..",
	Callback = function(state)
        getgenv().INVITE = state
        while getgenv().INVITE do task.wait()
			for _,player in ipairs(game.Players:GetPlayers()) do
				game.ReplicatedStorage.EventsFolder.BoatSelection.InviteGuestRF:InvokeServer(player.Name)
			end
	    end
    end
}

local text = nil

TeleportT:Textbox{
	Name = "Player Name",
	Callback = function(ted) 
		text = ted
	end
}


TeleportT:Button{
	Name = "Teleport to Player",
	Description = "",
	Callback = function() 
		lplayer.Character.HumanoidRootPart.CFrame = game.Players[text].HumanoidRootPart.CFrame
    end
}

OthersT:Toggle{
	Name = "Transparent Water",
	StartingState = false,
	Description = "Makes the water see through",
	Callback = function(state)
		if state == true then 
			game.Workspace.Terrain.WaterTransparency = 1
		else	
			game.Workspace.Terrain.WaterTransparency = 0.3
		end
    end
}

local vu = game:GetService("VirtualUser")
OthersT:Toggle{
	Name = "Anti AFK",
	StartingState = false,
	Description = "No kick for being afk...",
	Callback = function(state) 
        getgenv().INVITE = state
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		
				vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				task.wait(1)
				vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			

            if game.Players.LocalPlayer.PlayerGui.AFK.Enabled == true then

				for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.AFK.Page.YesButton.MouseButton1Click)) do
				   v:Fire()
				end
				
				end

		end)
    end
}


BoatT:Dropdown{
	Name = "Select Boat",
	StartingText = "Select...",
	Description = nil,
	Items = {
		{"Military Submarine", "MilitarySubmarine"},
		{"Marlin", "Marlin"},
		{"Snowmobile", "Snowmobile"},
		{"Combat Boat", "CombatBoat"},
		{"Stealth Boat", "StealthBoat"},
	},
	Callback = function(item)  
		local args = {
            [1] = item
        }
        
        game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(unpack(args))
	end
}
