local addon, ns = ...
local cfg = ns.cfg
local E, M = unpack(vCore)
local _G = _G

if cfg.skinPowerAlt and PlayerPowerBarAlt then
	E:Wait(1, function()
		PlayerPowerBarAlt:ClearAllPoints()
		PlayerPowerBarAlt:SetPoint("CENTER", UIParent, "TOP", -1, -159)

		PlayerPowerBarAlt:SetScript("OnShow", function()
			PlayerPowerBarAlt:ClearAllPoints()
			PlayerPowerBarAlt:SetPoint("CENTER", UIParent, "TOP", -1, -159)
		end)
	end)
end

if cfg.skinChat then
	E:SkinFrame(ChatFrame1)
	E:SkinFrame(ChatFrame3)
end

if IsAddOnLoaded("Recount") and cfg.skinRecount then

	local Recount = _G.Recount

	local function SkinFrame(frame)
		if frame.CloseButton then
			frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -3)
		end

		if frame.Title then
			frame.Title:SetPoint('TOPLEFT', frame, 'TOPLEFT', 5, -6)
		end

		E:SkinBackdrop(frame)
	end

	-- Skin frames when they're created
	Recount.CreateFrame_ = Recount.CreateFrame
	Recount.CreateFrame = function(self, Name, Title, Height, Width, ShowFunc, HideFunc)
		local frame = self:CreateFrame_(Name, Title, Height, Width, ShowFunc, HideFunc)
		SkinFrame(frame)
		return frame
	end

	local RecountFrames = {
		--Recount_MainWindow,
		Recount_ConfigWindow,
		Recount_GraphWindow,
		Recount_DetailWindow,
	}

	E:Strip(Recount_MainWindow)

	local backdrop = CreateFrame("Frame", nil, Recount_MainWindow)
	backdrop:SetPoint("TOPLEFT", Recount_MainWindow, "TOPLEFT", -4, -9)
	backdrop:SetPoint("BOTTOMRIGHT", Recount_MainWindow, "BOTTOMRIGHT", 4, -3)
	backdrop:SetFrameLevel(Recount_MainWindow:GetFrameLevel() - 1)
	E:SkinBackdrop(backdrop)

	for _, frame in pairs(RecountFrames) do
		if frame then SkinFrame(frame) end
	end

	local OtherRecountFrames = {
		'Recount_Realtime_!RAID_DAMAGE',
		'Recount_Realtime_!RAID_HEALING',
		'Recount_Realtime_!RAID_HEALINGTAKEN',
		'Recount_Realtime_!RAID_DAMAGETAKEN',
		'Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH',
		'Recount_Realtime_FPS_FPS',
		'Recount_Realtime_Latency_LAG',
		'Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC',
		'Recount_Realtime_Downstream Traffic_UP_TRAFFIC'
	}

	for _, frame in pairs(OtherRecountFrames) do
		if _G[frame] then
			SkinFrame(_G[frame].Window)
		end
	end

	local Recount_Skin = CreateFrame("Frame")
	Recount_Skin:RegisterEvent("PLAYER_ENTERING_WORLD")
	Recount_Skin:SetScript("OnEvent", function(self)
		self:UnregisterAllEvents()
		self = nil
		Recount_MainWindow:ClearAllPoints()
		Recount_MainWindow:SetPoint("TOPRIGHT", ChatFrame1, "TOPLEFT", -30, 13)
		Recount_MainWindow:SetSize(270, 160)
		Recount.db.profile.FrameStrata = "3-MEDIUM"
		Recount.db.profile.Colors["Window"]["Title"] = { r = 0, g = 0, b = 0, a = 0}
		Recount.db.profile.Locked = true
		Recount.db.profile.Font = cfg.font
		Recount.db.profile.BarTexture = "yaUI"
		Recount.db.profile.MainWindow.BarText.NumFormat = 3
		Recount.db.profile.MainWindow.ShowScrollbar = false
	end)
end

local function setSkadaDB(db)
	--db. = ""
end

if IsAddOnLoaded("Skada") and cfg.skinSkada then

	local Skada = _G.Skada

	hooksecurefunc(Skada.displays['bar'], 'ApplySettings', function(self, win)
		local skada = win.bargroup
		skada:SetSpacing(1)
		skada:SetFrameLevel(5)
		skada:SetBackdrop(nil)

		win.db.enabletitle = true

		win.db.barfont = "Roboto"
		win.db.barfontsize = 11
		win.db.barslocked = true

		win.db.title.bordertexture = "None"
		win.db.title.font = "Roboto"
		win.db.title.height = 18
		win.db.title.texture = "vUI"
		win.db.title.color = { r = 0, g = 0, b = 0, a = 0}

		win.db.bartexture = "vUI"
		win.db.barwidth = 270
		win.db.barheight = 14

		win.db.background.texture = "None"
		win.db.background.bordertexture = "None"
		win.db.background.height = 127
	end)

	local Skada_Skin = CreateFrame("Frame")
	Skada_Skin:RegisterEvent("PLAYER_ENTERING_WORLD")
	Skada_Skin:SetScript("OnEvent", function(self)
		self:UnregisterAllEvents()
		self = nil

		Skada.db.profile.onlykeepbosses = false
		Skada.db.profile.reset.join = 2
		Skada.db.profile.reset.instance = 2
		Skada.db.profile.reset.leave = 2

		SkadaBarWindowSkada:ClearAllPoints()
		SkadaBarWindowSkada:SetPoint("TOPRIGHT", ChatFrame1, "TOPLEFT", -15, -20)

		local backdrop = CreateFrame("Frame", nil, SkadaBarWindowSkada)
		backdrop:SetPoint("TOPLEFT", SkadaBarWindowSkada, "TOPLEFT", -4, 24)
		backdrop:SetPoint("BOTTOMRIGHT", SkadaBarWindowSkada, "BOTTOMRIGHT", 4, -3)
		backdrop:SetFrameLevel(SkadaBarWindowSkada:GetFrameLevel() - 1)
		E:SkinBackdrop(backdrop)

		--Skada.db.profile.w = 270
		--Skada.db.profile.FrameStrata = "3-MEDIUM"
		--Skada.db.profile.Colors["Window"]["Title"] = { r = 0, g = 0, b = 0, a = 0}
		--Skada.db.profile.Locked = true
		--Skada.db.profile.Font = cfg.font
		--Skada.db.profile.BarTexture = "yaUI"
		--Skada.db.profile.MainWindow.BarText.NumFormat = 3
		--Skada.db.profile.MainWindow.ShowScrollbar = false
	end)
end
