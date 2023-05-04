print("Start: Once upon a midnight dreary, while I pondered, weak and weary. . . ")
print("Developer consle oooo spoooky oggga boogggaa")
--Variables n stuf
getgenv().autoclick = false;
getgenv().autorebirth = false;
getgenv().autoegg = false;


local ClickBirth = game:GetService("ReplicatedStorage").Events
local Egg = game:GetService("ReplicatedStorage").Functions.Hatch

local isScriptEnabled = true
local vu = game:GetService("VirtualUser")

-- Gui
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Raven's Clicker Master Script", "Midnight")
--Tabs
local Farms = Window:NewTab("Auto Farms")
local Auto = Farms:NewSection("Main")

local Players = Window:NewTab("Player Settings")
local Player = Players:NewSection("Player")

local Miscc = Window:NewTab("Misc")
local Misc = Miscc:NewSection("Misc")
--Toggles
Auto:NewToggle("AutoClick", "Automatically clicks for you at a high speed", function(boolean)
    getgenv().autoclick = boolean
    if boolean then
        doclick();
    end
end)
--Text
Misc:NewDropdown("Info", "...Info...", {"Click F9", "Discord", "Future of script"}, function(currentOption)
    if currentOption == "Click F9" then
        print("If you see this then you listened! Well, click the other two if you want I guess.")
    elseif currentOption == Discord then
        print("link")
    elseif currentOption == "Future of script" then
        print("This script is discontinued. This was my first ever script...so it's really bad. Maybe I'll release the code one day, but this game I dont think many play anyway so...")
    end
end)

--Buttons
Players:NewButton("Anti-AFK", "Prevents Roblox's 20 minute AFK kick", function()
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)
--Drop Downs
Auto:NewDropdown("AutoRebirth", "Automatically rebirths for you", {"Disable", "1", "5", "10", "25", "50", "100", "250", "500", "1000", "2500", "5000", "10000", "25000", "50000", "100000", "250000", "500000", "1000000", "2500000", "5000000", "10000000", "25000000"}, function(rebirthamount)
    if rebirthamount == "Disable" then
        isScriptEnabled = false
    else
        isScriptEnabled = true
        if rebirthamount == "1" then
            autorebirth(1)
        elseif rebirthamount == "5" then
            autorebirth(5)
        elseif rebirthamount == "10" then
            autorebirth(10)
        elseif rebirthamount == "25" then
            autorebirth(25)
        elseif rebirthamount == "500" then
            autorebirth(500)
        elseif rebirthamount == "100" then
            autorebirth(100)
        elseif rebirthamount == "250" then
            autorebirth(250)
        elseif rebirthamount == "500" then
            autorebirth(500)
        elseif rebirthamount == "1000" then
            autorebirth(1000)
        elseif rebirthamount == "2500" then
            autorebirth(2500)
        elseif rebirthamount == "5000" then
            autorebirth(5000)
        elseif rebirthamount == "10000" then
            autorebirth(10000)
        elseif rebirthamount == "25000" then
            autorebirth(25000)
        elseif rebirthamount == "50000" then
            autorebirth(50000)
        elseif rebirthamount == "100000" then
            autorebirth(100000)
        elseif rebirthamount == "250000" then
            autorebirth(250000)
        elseif rebirthamount == "500000" then
            autorebirth(500000)
        elseif rebirthamount == "1000000" then
            autorebirth(1000000)
        elseif rebirthamount == "2500000" then
            autorebirth(2500000)
        elseif rebirthamount == "5000000" then
            autorebirth(5000000)
        elseif rebirthamount == "10000000" then
            autorebirth(10000000)
        elseif rebirthamount == "25000000" then
            autorebirth(25000000)
        end
    end
end)

Auto:NewDropdown("AutoHatch", "Automatically Hatches pets. [ANI DOESNT PLAY!]", {"Disable", "Basic", "Forest", "Beach", "Yeti", "Candy", "Ninja", "Atlantis"}, function(eggtype)
    if eggtype == "Disable" then
        isScriptEnabled = false
    else
        isScriptEnabled = true
        if eggtype == "Basic" then
            buyegg("Basic")
        elseif eggtype == "Forest" then
            buyegg("Forest")
        elseif eggtype == "Beach" then
            buyegg("Beach")
        elseif eggtype == "Yeti" then
            buyegg("Yeti")
        elseif eggtype == "Candy" then
            buyegg("Candy")
        elseif eggtype == "Ninja" then
            buyegg("Ninja")
        elseif eggtype == "Atlantis" then
            buyegg("Atlantis")
        end
     end
end)
--Sliders
Players:NewSlider("WalkSpeed", "Alter how fast or slow your character moves", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

        
-- Scripts
--Auto clicker
function doclick()
    spawn(function ()
        while wait() do
            if not autoclick then break end;
            ClickBirth.Click:FireServer()
            wait()
        end
    end)
end



--Auto rebirth
function autorebirth(rebirthamount)
    while isScriptEnabled do
        local args = {[1] = rebirthamount}
         ClickBirth.Rebirth:FireServer(unpack(args))
        wait()
    end
end

--Auto buy egg
function buyegg(eggtype)
        while isScriptEnabled do
        local args = {[1] = eggtype,[2] = "Single"}
        Egg:InvokeServer(unpack(args))
        end
    end

--Teleports
function getCurrentPlayerPOS()
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.Position;
    end
    return false
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
         plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end
function teleportworld(world)
    if game:GetService("Workspace").Scripted.Portals:FindFirstChild(world) then
       teleportTO (game:GetService("Workspace").Scripted.Portals[world].TriggerPart.CFrame)
    end
end

print("End: And the Raven, never flitting, still is sitting, still is sitting. . .")
