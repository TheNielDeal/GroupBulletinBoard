local _, GBB = GroupBulletinBoard_Loader.Main()

local function getSeasonalDungeons()
  local events = {}

  for eventName, eventData in pairs( GBB.Seasonal ) do
    table.insert( events, eventName )
    if GBB.Tool.InDateRange( eventData.startDate, eventData.endDate ) then
      GBB.SeasonalActiveEvents[ eventName ] = true
    end
  end
  return events
end

function GBB.GetDungeonNames()
  local DefaultEnGB = {
    [ "RFC" ] = "Ragefire Chasm",
    [ "DM" ] = "The Deadmines",
    [ "WC" ] = "Wailing Caverns",
    [ "SFK" ] = "Shadowfang Keep",
    [ "STOCKS" ] = "The Stockade",
    [ "BFD" ] = "Blackfathom Deeps",
    [ "GNOMER" ] = "Gnomeregan",
    [ "RFK" ] = "Razorfen Kraul",
    [ "SM2" ] = "Scarlet Monastery",
    [ "GY" ] = "Scarlet Monastery: Graveyard",
    [ "LIB" ] = "Scarlet Monastery: Library",
    [ "ARMS" ] = "Scarlet Monastery: Armory",
    [ "CATH" ] = "Scarlet Monastery: Cathedral",
    [ "GMM" ] = "Glittermurk Mines",
    [ "RFD" ] = "Razorfen Downs",
    [ "ULDA" ] = "Uldaman",
    [ "ZF" ] = "Zul'Farrak",
    [ "MARA" ] = "Maraudon",
    [ "ST" ] = "The Sunken Temple",
    [ "BRD" ] = "Blackrock Depths",
    [ "BH" ] = "Baradin Hold",
    [ "SP" ] = "Stonetalon Peak",
    [ "SC" ] = "Stonetalon Caverns",
    [ "DM2" ] = "Dire Maul",
    [ "DME" ] = "Dire Maul: East",
    [ "DMN" ] = "Dire Maul: North",
    [ "DMW" ] = "Dire Maul: West",
    [ "STRAT" ] = "Stratholme",
    [ "SCHOLO" ] = "Scholomance",
    [ "LBRS" ] = "Lower Blackrock Spire",
    [ "UBRS" ] = "Upper Blackrock Spire",
    [ "ONY" ] = "Onyxia's Lair (25)",
    [ "MC" ] = "Molten Core (25)",
    [ "ULDUM" ] = "Uldum (25)",
    [ "ZG" ] = "Zul'Gurub (10)",
    [ "AQ10" ] = "Ruins of Ahn'Qiraj (10)",
    [ "BWL" ] = "Blackwing Lair (25)",
    [ "AQ25" ] = "Temple of Ahn'Qiraj (25)",
    [ "NAXX" ] = "Naxxramas (25)",
    [ "WSG" ] = "Warsong Gulch (PvP)",
    [ "AB" ] = "Arathi Basin (PvP)",
    [ "AV" ] = "Alterac Valley (PvP)",
    [ "GI" ] = "Gillijim's Isle (PvP)",
    [ "ARENA" ] = "Arena (PvP)",
    [ "MISC" ] = "Miscellaneous",
    [ "TRADE" ] = "Trade",
    [ "DEBUG" ] = "DEBUG INFO",
    [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
    [ "BREW" ] = "Brewfest - Coren Direbrew",
    [ "HOLLOW" ] = "Hallow's End - Headless Horseman",
  }

  local dungeonNamesLocales = {
    deDE = {
      [ "RFC" ] = "Ragefire Chasm",
      [ "DM" ] = "The Deadmines",
      [ "WC" ] = "Wailing Caverns",
      [ "SFK" ] = "Shadowfang Keep",
      [ "STOCKS" ] = "The Stockade",
      [ "BFD" ] = "Blackfathom Deeps",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Razorfen Kraul",
      [ "SM2" ] = "Scarlet Monastery",
      [ "GY" ] = "Scarlet Monastery: Graveyard",
      [ "LIB" ] = "Scarlet Monastery: Library",
      [ "ARMS" ] = "Scarlet Monastery: Armory",
      [ "CATH" ] = "Scarlet Monastery: Cathedral",
      [ "GMM" ] = "Glittermurk Mines",
      [ "RFD" ] = "Razorfen Downs",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "The Sunken Temple",
      [ "BRD" ] = "Blackrock Depths",
      [ "BH" ] = "Baradin Hold",
      [ "SP" ] = "Stonetalon Peak",
      [ "SC" ] = "Stonetalon Caverns",
      [ "DM2" ] = "Dire Maul",
      [ "DME" ] = "Dire Maul: East",
      [ "DMN" ] = "Dire Maul: North",
      [ "DMW" ] = "Dire Maul: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Lower Blackrock Spire",
      [ "UBRS" ] = "Upper Blackrock Spire",
      [ "ONY" ] = "Onyxia's Lair (25)",
      [ "MC" ] = "Molten Core (25)",
      [ "ULDUM" ] = "Uldum (25)",
      [ "ZG" ] = "Zul'Gurub (10)",
      [ "AQ10" ] = "Ruins of Ahn'Qiraj (10)",
      [ "BWL" ] = "Blackwing Lair (25)",
      [ "AQ25" ] = "Temple of Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "WSG" ] = "Warsong Gulch (PvP)",
      [ "AB" ] = "Arathi Basin (PvP)",
      [ "AV" ] = "Alterac Valley (PvP)",
      [ "GI" ] = "Gillijim's Isle (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "MISC" ] = "Miscellaneous",
      [ "TRADE" ] = "Trade",
      [ "DEBUG" ] = "DEBUG INFO",
      [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
      [ "BREW" ] = "Brewfest - Coren Direbrew",
      [ "HOLLOW" ] = "Hallow's End - Headless Horseman",

    },
    frFR = {
      [ "RFC" ] = "Ragefire Chasm",
      [ "DM" ] = "The Deadmines",
      [ "WC" ] = "Wailing Caverns",
      [ "SFK" ] = "Shadowfang Keep",
      [ "STOCKS" ] = "The Stockade",
      [ "BFD" ] = "Blackfathom Deeps",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Razorfen Kraul",
      [ "SM2" ] = "Scarlet Monastery",
      [ "GY" ] = "Scarlet Monastery: Graveyard",
      [ "LIB" ] = "Scarlet Monastery: Library",
      [ "ARMS" ] = "Scarlet Monastery: Armory",
      [ "CATH" ] = "Scarlet Monastery: Cathedral",
      [ "GMM" ] = "Glittermurk Mines",
      [ "RFD" ] = "Razorfen Downs",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "The Sunken Temple",
      [ "BRD" ] = "Blackrock Depths",
      [ "BH" ] = "Baradin Hold",
      [ "SP" ] = "Stonetalon Peak",
      [ "SC" ] = "Stonetalon Caverns",
      [ "DM2" ] = "Dire Maul",
      [ "DME" ] = "Dire Maul: East",
      [ "DMN" ] = "Dire Maul: North",
      [ "DMW" ] = "Dire Maul: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Lower Blackrock Spire",
      [ "UBRS" ] = "Upper Blackrock Spire",
      [ "ONY" ] = "Onyxia's Lair (25)",
      [ "MC" ] = "Molten Core (25)",
      [ "ULDUM" ] = "Uldum (25)",
      [ "ZG" ] = "Zul'Gurub (10)",
      [ "AQ10" ] = "Ruins of Ahn'Qiraj (10)",
      [ "BWL" ] = "Blackwing Lair (25)",
      [ "AQ25" ] = "Temple of Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "WSG" ] = "Warsong Gulch (PvP)",
      [ "AB" ] = "Arathi Basin (PvP)",
      [ "AV" ] = "Alterac Valley (PvP)",
      [ "GI" ] = "Gillijim's Isle (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "MISC" ] = "Miscellaneous",
      [ "TRADE" ] = "Trade",
      [ "DEBUG" ] = "DEBUG INFO",
      [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
      [ "BREW" ] = "Brewfest - Coren Direbrew",
      [ "HOLLOW" ] = "Hallow's End - Headless Horseman",
    },
    esMX = {
      [ "RFC" ] = "Ragefire Chasm",
      [ "DM" ] = "The Deadmines",
      [ "WC" ] = "Wailing Caverns",
      [ "SFK" ] = "Shadowfang Keep",
      [ "STOCKS" ] = "The Stockade",
      [ "BFD" ] = "Blackfathom Deeps",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Razorfen Kraul",
      [ "SM2" ] = "Scarlet Monastery",
      [ "GY" ] = "Scarlet Monastery: Graveyard",
      [ "LIB" ] = "Scarlet Monastery: Library",
      [ "ARMS" ] = "Scarlet Monastery: Armory",
      [ "CATH" ] = "Scarlet Monastery: Cathedral",
      [ "GMM" ] = "Glittermurk Mines",
      [ "RFD" ] = "Razorfen Downs",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "The Sunken Temple",
      [ "BRD" ] = "Blackrock Depths",
      [ "BH" ] = "Baradin Hold",
      [ "SP" ] = "Stonetalon Peak",
      [ "SC" ] = "Stonetalon Caverns",
      [ "DM2" ] = "Dire Maul",
      [ "DME" ] = "Dire Maul: East",
      [ "DMN" ] = "Dire Maul: North",
      [ "DMW" ] = "Dire Maul: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Lower Blackrock Spire",
      [ "UBRS" ] = "Upper Blackrock Spire",
      [ "ONY" ] = "Onyxia's Lair (25)",
      [ "MC" ] = "Molten Core (25)",
      [ "ULDUM" ] = "Uldum (25)",
      [ "ZG" ] = "Zul'Gurub (10)",
      [ "AQ10" ] = "Ruins of Ahn'Qiraj (10)",
      [ "BWL" ] = "Blackwing Lair (25)",
      [ "AQ25" ] = "Temple of Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "WSG" ] = "Warsong Gulch (PvP)",
      [ "AB" ] = "Arathi Basin (PvP)",
      [ "AV" ] = "Alterac Valley (PvP)",
      [ "GI" ] = "Gillijim's Isle (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "MISC" ] = "Miscellaneous",
      [ "TRADE" ] = "Trade",
      [ "DEBUG" ] = "DEBUG INFO",
      [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
      [ "BREW" ] = "Brewfest - Coren Direbrew",
      [ "HOLLOW" ] = "Hallow's End - Headless Horseman",

    },
    ruRU = {
      [ "RFC" ] = "Ragefire Chasm",
      [ "DM" ] = "The Deadmines",
      [ "WC" ] = "Wailing Caverns",
      [ "SFK" ] = "Shadowfang Keep",
      [ "STOCKS" ] = "The Stockade",
      [ "BFD" ] = "Blackfathom Deeps",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Razorfen Kraul",
      [ "SM2" ] = "Scarlet Monastery",
      [ "GY" ] = "Scarlet Monastery: Graveyard",
      [ "LIB" ] = "Scarlet Monastery: Library",
      [ "ARMS" ] = "Scarlet Monastery: Armory",
      [ "CATH" ] = "Scarlet Monastery: Cathedral",
      [ "GMM" ] = "Glittermurk Mines",
      [ "RFD" ] = "Razorfen Downs",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "The Sunken Temple",
      [ "BRD" ] = "Blackrock Depths",
      [ "BH" ] = "Baradin Hold",
      [ "SP" ] = "Stonetalon Peak",
      [ "SC" ] = "Stonetalon Caverns",
      [ "DM2" ] = "Dire Maul",
      [ "DME" ] = "Dire Maul: East",
      [ "DMN" ] = "Dire Maul: North",
      [ "DMW" ] = "Dire Maul: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Lower Blackrock Spire",
      [ "UBRS" ] = "Upper Blackrock Spire",
      [ "ONY" ] = "Onyxia's Lair (25)",
      [ "MC" ] = "Molten Core (25)",
      [ "ULDUM" ] = "Uldum (25)",
      [ "ZG" ] = "Zul'Gurub (10)",
      [ "AQ10" ] = "Ruins of Ahn'Qiraj (10)",
      [ "BWL" ] = "Blackwing Lair (25)",
      [ "AQ25" ] = "Temple of Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "WSG" ] = "Warsong Gulch (PvP)",
      [ "AB" ] = "Arathi Basin (PvP)",
      [ "AV" ] = "Alterac Valley (PvP)",
      [ "GI" ] = "Gillijim's Isle (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "MISC" ] = "Miscellaneous",
      [ "TRADE" ] = "Trade",
      [ "DEBUG" ] = "DEBUG INFO",
      [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
      [ "BREW" ] = "Brewfest - Coren Direbrew",
      [ "HOLLOW" ] = "Hallow's End - Headless Horseman",
    },
    zhTW = {
      [ "RFC" ] = "Ragefire Chasm",
      [ "DM" ] = "The Deadmines",
      [ "WC" ] = "Wailing Caverns",
      [ "SFK" ] = "Shadowfang Keep",
      [ "STOCKS" ] = "The Stockade",
      [ "BFD" ] = "Blackfathom Deeps",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Razorfen Kraul",
      [ "SM2" ] = "Scarlet Monastery",
      [ "GY" ] = "Scarlet Monastery: Graveyard",
      [ "LIB" ] = "Scarlet Monastery: Library",
      [ "ARMS" ] = "Scarlet Monastery: Armory",
      [ "CATH" ] = "Scarlet Monastery: Cathedral",
      [ "GMM" ] = "Glittermurk Mines",
      [ "RFD" ] = "Razorfen Downs",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "The Sunken Temple",
      [ "BRD" ] = "Blackrock Depths",
      [ "BH" ] = "Baradin Hold",
      [ "SP" ] = "Stonetalon Peak",
      [ "SC" ] = "Stonetalon Caverns",
      [ "DM2" ] = "Dire Maul",
      [ "DME" ] = "Dire Maul: East",
      [ "DMN" ] = "Dire Maul: North",
      [ "DMW" ] = "Dire Maul: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Lower Blackrock Spire",
      [ "UBRS" ] = "Upper Blackrock Spire",
      [ "ONY" ] = "Onyxia's Lair (25)",
      [ "MC" ] = "Molten Core (25)",
      [ "ULDUM" ] = "Uldum (25)",
      [ "ZG" ] = "Zul'Gurub (10)",
      [ "AQ10" ] = "Ruins of Ahn'Qiraj (10)",
      [ "BWL" ] = "Blackwing Lair (25)",
      [ "AQ25" ] = "Temple of Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "WSG" ] = "Warsong Gulch (PvP)",
      [ "AB" ] = "Arathi Basin (PvP)",
      [ "AV" ] = "Alterac Valley (PvP)",
      [ "GI" ] = "Gillijim's Isle (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "MISC" ] = "Miscellaneous",
      [ "TRADE" ] = "Trade",
      [ "DEBUG" ] = "DEBUG INFO",
      [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
      [ "BREW" ] = "Brewfest - Coren Direbrew",
      [ "HOLLOW" ] = "Hallow's End - Headless Horseman",
    },
  }



  local dungeonNames = dungeonNamesLocales[ GetLocale() ] or {}

  if GroupBulletinBoardDB and GroupBulletinBoardDB.CustomLocalesDungeon and type( GroupBulletinBoardDB.CustomLocalesDungeon ) == "table" then
    for key, value in pairs( GroupBulletinBoardDB.CustomLocalesDungeon ) do
      if value ~= nil and value ~= "" then
        dungeonNames[ key .. "_org" ] = dungeonNames[ key ] or DefaultEnGB[ key ]
        dungeonNames[ key ] = value
      end
    end
  end


  setmetatable( dungeonNames, { __index = DefaultEnGB } )

  dungeonNames[ "DEADMINES" ] = dungeonNames[ "DM" ]

  return dungeonNames
end

local function Union( a, b )
  local result = {}
  for k, v in pairs( a ) do
    result[ k ] = v
  end
  for k, v in pairs( b ) do
    result[ k ] = v
  end
  return result
end

GBB.VanillaDungeonLevels = {
  [ "RFC" ] = { 13, 18 },
  [ "DM" ] = { 18, 23 },
  [ "WC" ] = { 15, 25 },
  [ "SFK" ] = { 22, 30 },
  [ "STOCKS" ] = { 22, 30 },
  [ "BFD" ] = { 24, 32 },
  [ "GNOMER" ] = { 29, 38 },
  [ "RFK" ] = { 30, 40 },
  [ "GY" ] = { 28, 38 },
  [ "LIB" ] = { 29, 39 },
  [ "ARMS" ] = { 32, 42 },
  [ "CATH" ] = { 35, 45 },
  [ "GMM" ] = { 39, 44 },
  [ "RFD" ] = { 40, 50 },
  [ "ULDA" ] = { 42, 52 },
  [ "ZF" ] = { 44, 54 },
  [ "MARA" ] = { 46, 55 },
  [ "ST" ] = { 50, 60 },
  [ "BRD" ] = { 52, 60 },
  [ "BH" ] = { 57, 60 },
  [ "SP" ] = { 57, 60 },
  [ "SC" ] = { 57, 60 },
  [ "LBRS" ] = { 55, 60 },
  [ "DME" ] = { 58, 60 },
  [ "DMN" ] = { 58, 60 },
  [ "DMW" ] = { 58, 60 },
  [ "STRAT" ] = { 58, 60 },
  [ "SCHOLO" ] = { 58, 60 },
  [ "UBRS" ] = { 58, 60 },
  [ "ONY" ] = { 60, 60 },
  [ "MC" ] = { 60, 60 },
  [ "ULDUM" ] = { 60, 60 },
  [ "ZG" ] = { 60, 60 },
  [ "AQ10" ] = { 60, 60 },
  [ "BWL" ] = { 60, 60 },
  [ "AQ25" ] = { 60, 60 },
  [ "NAXX" ] = { 60, 60 },
  [ "WSG" ] = { 10, 70 },
  [ "AB" ] = { 20, 70 },
  [ "AV" ] = { 51, 70 },
  [ "MISC" ] = { 0, 100 },
  [ "DEBUG" ] = { 0, 100 },
  [ "BAD" ] = { 0, 100 },
  [ "TRADE" ] = { 0, 100 },
  [ "SM2" ] = { 28, 42 },
  [ "DM2" ] = { 58, 60 },
  [ "DEADMINES" ] = { 18, 23 },
}

--GBB.TbcDungeonNames      = {
--  "RAMPS", "BF", "SHH", "MAGS", "SP", "UB", "SV", "SSC", "MT", "AC",
--  "SH", "SL", "OHF", "BM", "MECHA", "BOTA", "ARCA", "EYE", "MGT", "KARA",
--  "GRUULS", "ZA", "HYJAL", "BT", "SWP",
--}

GBB.VanillDungeonNames   = {
  "RFC", "WC", "DM", "SFK", "STOCKS", "BFD", "GNOMER",
  "RFK", "GY", "LIB", "ARMS", "CATH", "GMM", "RFD", "ULDA",
  "ZF", "MARA", "ST", "BRD", "BH", "SP", "SC", "LBRS", "DME", "DMN",
  "DMW", "STRAT", "SCHOLO", "UBRS", "ONY", "MC", "ULDUM", "ZG",
  "AQ10", "BWL", "AQ25", "NAXX",
}


GBB.PvpNames = {
  "WSG", "AB", "AV", "GI", "ARENA",
}

GBB.Misc = { "MISC", "TRADE", }

GBB.DebugNames = {
  "DEBUG", "BAD", "NIL",
}

GBB.Raids = {
  "ONY", "MC", "UDLUM", "ZG", "AQ10", "BWL", "AQ25", "NAXX",
  "ARENA", "WSG", "AV", "AB", "GI",
  "BREW", "HOLLOW",
}

GBB.Seasonal = {
  [ "BREW" ] = { startDate = "09/19", endDate = "10/07" },
  [ "HOLLOW" ] = { startDate = "10/16", endDate = "11/01" }
}

GBB.SeasonalActiveEvents = {}
GBB.Events = getSeasonalDungeons()

function GBB.GetRaids()
  local arr = {}
  for _, v in pairs( GBB.Raids ) do
    arr[ v ] = 1
  end
  return arr
end

-- Needed because Lua sucks, Blizzard switch to Python please <- LMFAO
-- Takes in a list of dungeon lists, it will then concatenate the lists into a single list
-- it will put the dungeons in an order and give them a value incremental value that can be used for sorting later
-- ie one list "Foo" which contains "Bar" and "FooBar" and a second list "BarFoo" which contains "BarBar"
-- the output would be single list with "Bar" = 1, "FooBar" = 2, "BarFoo" = 3, "BarBar" = 4
local function ConcatenateLists( Names )
  local result = {}
  local index = 1
  for k, nameLists in pairs( Names ) do
    for _, v in pairs( nameLists ) do
      result[ v ] = index
      index = index + 1
    end
  end
  return result, index
end

function GBB.GetDungeonSort()
  --for eventName, eventData in pairs( GBB.Seasonal ) do
  --  if GBB.Tool.InDateRange( eventData.startDate, eventData.endDate ) then
  --    table.insert( GBB.TbcDungeonNames, 1, eventName )
  --  else
  --    table.insert( GBB.DebugNames, 1, eventName )
  --  end
  --end

  local dungeonOrder = { GBB.VanillDungeonNames, GBB.PvpNames, GBB.Misc, GBB.DebugNames }

  -- Why does Lua not having a fucking size function
  local vanillaDungeonSize = 0
  for _, _ in pairs( GBB.VanillDungeonNames ) do
    vanillaDungeonSize = vanillaDungeonSize + 1
  end

  local debugSize = 0
  for _, _ in pairs( GBB.DebugNames ) do
    debugSize = debugSize + 1
  end

  GBB.TBCDUNGEONSTART = vanillaDungeonSize + 1
  GBB.MAXDUNGEON = vanillaDungeonSize

  local tmp_dsort, concatenatedSize = ConcatenateLists( dungeonOrder )
  local dungeonSort = {}

  GBB.TBCMAXDUNGEON = concatenatedSize - debugSize - 1

  for dungeon, nb in pairs( tmp_dsort ) do
    dungeonSort[ nb ] = dungeon
    dungeonSort[ dungeon ] = nb
  end

  -- Need to do this because I don't know I am too lazy to debug the use of SM2, DM2, and DEADMINES
  dungeonSort[ "SM2" ] = 10.5
  dungeonSort[ "DM2" ] = 19.5
  dungeonSort[ "DEADMINES" ] = 99

  return dungeonSort
end

GBB.dungeonLevel = GBB.VanillaDungeonLevels
