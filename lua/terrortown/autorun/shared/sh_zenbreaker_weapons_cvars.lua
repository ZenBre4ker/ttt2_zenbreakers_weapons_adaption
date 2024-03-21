--make sure that the convarutil.lua exists that adds all convars
if SERVER then
    AddCSLuaFile()
    if file.Exists("terrortown/scripts/sh_convarutil_local.lua", "LUA") then
        AddCSLuaFile("terrortown/scripts/sh_convarutil_local.lua")
    end
end

if file.Exists("terrortown/scripts/sh_convarutil_local.lua", "LUA") then
    include("terrortown/scripts/sh_convarutil_local.lua")
    -- Must run before hook.Add
    local shortNameOfAddon = "ZenBase"
    local longNameOfAddon = "ZenBreakers Weapon Base"

    local cg = ConvarGroup(shortNameOfAddon, longNameOfAddon)

    --Convar(ConvarGroup cg , Bool TTT2-Only, String ttt_Addon_Modifier, Bool/Int/Float DefaultValue, Table{} FCVAR_Flags, String Modifier Description, String Datatype ("bool","int","float"), Bool/Int/Float MinValue, Bool/Int/Float MaxValue, Int Decimalpoints)
    --Example:
    --Convar(cg, false, "ttt_asm_shift_speed_modifier", 2, {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, "Movement speed multiplier during the aiming sequence", "float", 0.01, 8, 2)

    Convar(
        cg,
        false,
        "ttt_ZenBase_ShowZenStats",
        1,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Should ZenBreakers Base Stats be shown?",
        "bool",
        0,
        1,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_ShowOnlyZenStats",
        1,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Should only ZenBreakers Base Stats be shown?",
        "bool",
        0,
        1,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_DrawHaloLootColors",
        1,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Should ZenBreakers Base Stats be shown?",
        "bool",
        0,
        1,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_DrawHaloRange",
        300,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Assault Rifle DPS Base Values.",
        "int",
        100,
        1000,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_RandomizeStats",
        1,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Should the Convar Values ZenBreakers Base Stats be randomized?",
        "bool",
        0,
        1,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_UseConVarValues",
        0,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Should the Convar Values be used instead of ZenBreakers Base Stats?",
        "bool",
        0,
        1,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_AssaultRifle_DPS_Base",
        145,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Assault Rifle DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_AssaultRifle_DPS_Range",
        20,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Assault Rifle DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_SubmachineGun_DPS_Base",
        140,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Submachine Gun DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_SubmachineGun_DPS_Range",
        20,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Submachine Gun DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_MachinePistol_DPS_Base",
        135,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Machine Pistol DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_MachinePistol_DPS_Range",
        20,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Machine Pistol DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_LightMachineGun_DPS_Base",
        150,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Light Machine Gun DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_LightMachineGun_DPS_Range",
        20,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Light Machine Gun DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_Pumpgun_DPS_Base",
        110,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Pumpgun DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_Pumpgun_DPS_Range",
        10,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Pumpgun DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_AutoShotgun_DPS_Base",
        115,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Automatic Shotgun DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_AutoShotgun_DPS_Range",
        10,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Automatic Shotgun DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    Convar(
        cg,
        false,
        "ttt_ZenBase_DoubleBarrel_DPS_Base",
        120,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Double Barrel Shotgun DPS Base Values.",
        "int",
        50,
        250,
        0
    )
    Convar(
        cg,
        false,
        "ttt_ZenBase_DoubleBarrel_DPS_Range",
        10,
        { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED },
        "Choose Double Barrel Shotgun DPS Random Range Values.",
        "int",
        0,
        100,
        0
    )

    --

    print(shortNameOfAddon .. " Convars are created.")
end
