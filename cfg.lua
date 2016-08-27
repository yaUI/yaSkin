local addon, ns = ...
local E, M = unpack(yaCore)

local cfg = CreateFrame("Frame")
--------------

cfg.skinRecount = true
cfg.skinSkada = true
cfg.skinOmen = true

cfg.skinChat = true
if IsAddOnLoaded("yaChat") then
	cfg.skinChat = false
end
cfg.skinPowerAlt = true
cfg.skinExtraButton = true

cfg.moveFPS = true

cfg.barTexture = M:Fetch("yaui", "statusbar")
cfg.dropTexture = M:Fetch("yaui", "backdrop")
cfg.dropEdgeTexture = M:Fetch("yaui", "backdropEdge")

cfg.font = M:Fetch("font", "Roboto")
cfg.fontSize = M:Fetch("font", "size")
cfg.fontFlag = M:Fetch("font", "outline")

--------------
ns.cfg = cfg