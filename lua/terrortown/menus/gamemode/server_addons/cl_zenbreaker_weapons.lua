CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "zenbreaker_weapons_addon_info"

function CLGAMEMODESUBMENU:Populate(parent)
	local form = vgui.CreateTTT2Form(parent, "zenbreaker_weapons_addon_header")

	form:MakeHelp({
		label = "zenbreaker_weapons_addon_help_menu"
	})

    form:MakeCheckBox({
		label = "ttt_ZenBase_ShowZenStats",
		serverConvar = "ttt_ZenBase_ShowZenStats"
	})
	
    form:MakeCheckBox({
		label = "ttt_ZenBase_ShowOnlyZenStats",
		serverConvar = "ttt_ZenBase_ShowOnlyZenStats"
	})

    form:MakeCheckBox({
		label = "ttt_ZenBase_DrawHaloLootColors",
		serverConvar = "ttt_ZenBase_DrawHaloLootColors"
	})

    form:MakeSlider({
		label = "ttt_ZenBase_DrawHaloRange",
		serverConvar = "ttt_ZenBase_DrawHaloRange",
		min = 100,
		max = 1000,
		decimal = 0
	})

    form:MakeCheckBox({
		label = "ttt_ZenBase_RandomizeStats",
		serverConvar = "ttt_ZenBase_RandomizeStats"
	})

    form:MakeCheckBox({
		label = "ttt_ZenBase_UseConVarValues",
		serverConvar = "ttt_ZenBase_UseConVarValues"
	})

    form:MakeSlider({
		label = "ttt_ZenBase_AssaultRifle_DPS_Base",
		serverConvar = "ttt_ZenBase_AssaultRifle_DPS_Base",
		min = 50,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_AssaultRifle_DPS_Range",
		serverConvar = "ttt_ZenBase_AssaultRifle_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_SubmachineGun_DPS_Base",
		serverConvar = "ttt_ZenBase_SubmachineGun_DPS_Base",
		min = 50,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_SubmachineGun_DPS_Range",
		serverConvar = "ttt_ZenBase_SubmachineGun_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_MachinePistol_DPS_Base",
		serverConvar = "ttt_ZenBase_MachinePistol_DPS_Base",
		min = 50,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_MachinePistol_DPS_Range",
		serverConvar = "ttt_ZenBase_MachinePistol_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_LightMachineGun_DPS_Base",
		serverConvar = "ttt_ZenBase_LightMachineGun_DPS_Base",
		min = 50,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_LightMachineGun_DPS_Range",
		serverConvar = "ttt_ZenBase_LightMachineGun_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_Pumpgun_DPS_Base",
		serverConvar = "ttt_ZenBase_Pumpgun_DPS_Base",
		min = 50,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_Pumpgun_DPS_Range",
		serverConvar = "ttt_ZenBase_Pumpgun_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})
    
    form:MakeSlider({
		label = "ttt_ZenBase_AutoShotgun_DPS_Base",
		serverConvar = "ttt_ZenBase_AutoShotgun_DPS_Base",
		min = 50,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_AutoShotgun_DPS_Range",
		serverConvar = "ttt_ZenBase_AutoShotgun_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_DoubleBarrel_DPS_Base",
		serverConvar = "ttt_ZenBase_DoubleBarrel_DPS_Base",
		min = 20,
		max = 250,
		decimal = 0
	})

    form:MakeSlider({
		label = "ttt_ZenBase_DoubleBarrel_DPS_Range",
		serverConvar = "ttt_ZenBase_DoubleBarrel_DPS_Range",
		min = 0,
		max = 100,
		decimal = 0
	})
end
