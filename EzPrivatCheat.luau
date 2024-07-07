local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local window = OrionLib:MakeWindow({Name = "Gans Privat Cheat", HidePremium = false, SaveConfig = false,IntroEnabled = true, IntroText = "EzWin - Privat Cheat - Gans"})

local MainTab = window:MakeTab({
    Name = "Main",

})


local Aim = window:MakeTab({
    Name = "Aim",
    
})


local visuals = window:MakeTab({
    Name = "Visuals",
    
})


local misc = window:MakeTab({
    Name = "Misc",
    
})

local extra = window:MakeTab({
    Name = "Extra",
    
})


--------------------------------------------------------------------------------- AIM SECTIONS ---------------------------------------------


---------------------------------------------------------------------------------VISUALS SECTIONS--------------------------------------------


---------------------------------------------------------------------------------MISC SECTIONS-----------------------------------------------



--------------------------------------------------------------------------------EXTRA SETTINGS----------------------------------------------

local EUF = extra:AddSection({
    Name = "Unload"
})


EUF:AddButton({
    Name = "Unload",
    Callback =  function()
        OrionLib:Destroy()
    end
})

local ESC = extra:AddSection({
    Name = "Credits"
})
ESC:AddLabel("Discord: Gans_term")
ESC:AddLabel("TikTok: praytomasn")
ESC:AddLabel("Insta: pray2masn")



OrionLib:Init()