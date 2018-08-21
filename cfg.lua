local addon, ns = ...
local E, M = unpack(vCore)

local cfg = CreateFrame("Frame")
--------------

cfg.skinRecount = true
cfg.skinSkada = true
cfg.skinOmen = true

cfg.skinChat = IsAddOnLoaded("vChat")
cfg.skinPowerAlt = true
cfg.skinExtraButton = true

cfg.moveFPS = true

cfg.barTexture = M:Fetch("vui", "statusbar")
cfg.dropTexture = M:Fetch("vui", "backdrop")
cfg.dropEdgeTexture = M:Fetch("vui", "backdropEdge")

cfg.font = M:Fetch("font", "Roboto")
cfg.fontSize = M:Fetch("font", "size")
cfg.fontFlag = M:Fetch("font", "outline")

--------------
ns.cfg = cfg
