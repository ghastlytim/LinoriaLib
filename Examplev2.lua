Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/modules/main/linoriaedit.lua'))();

local LocalPlayer = game.Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Fonts = {};
for Font, _ in next, Drawing.Fonts do
	table.insert(Fonts, Font);
end;

local TestWindow = Library:CreateWindow('SomaHook');
Library:SetWatermark('SomaHook | Tester | Version: 1.0.0');
Library:Notify('Loading UI...');

local LegitTab = TestWindow:AddTab('Legit');
local LegitTabbox1 = LegitTab:AddLeftTabbox('Aimbot');
local lAimbot1 = LegitTabbox1:AddTab('Aimbot');
lAimbot1:AddToggle('Aimbot', { Text = 'Aimbot' }):AddKeyPicker('Test', { Text = 'Aimbot', Default = 'X' });
lAimbot1:AddToggle('CheckTeam', { Text = 'Team Check' });
lAimbot1:AddToggle('CheckVis', { Text = 'Visibility Check' });
lAimbot1:AddToggle('VisPriority', { Text = 'Prioritize Visibles' });
lAimbot1:AddToggle('IgnoreFOV', { Text = 'Ignore FOV' });
lAimbot1:AddSlider('FOV', { Text = 'Aimbot FOV', Default = 10, Min = 0, Max = 10, Rounding = 1 });
lAimbot1:AddSlider('SwitchDelay', { Text = 'Switch Delay', Default = 0, Min = 0, Max = 1000, Rounding = 0, Suffix = 'ms' });
lAimbot1:AddSlider('HeadshotPercent', { Text = 'Headshot %', Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = '%' });

local lAimbot2 = LegitTabbox1:AddTab('Silent Aim');
lAimbot2:AddLabel('Nothing here :)');

local lAimbotSettings = LegitTab:AddRightTabbox();

local LegitSettings = lAimbotSettings:AddTab('Aimbot Settings');
LegitSettings:AddSlider('AimTime', { Text = 'Smoothing', Default = 0, Min = 0, Max = 2000, Rounding = 0, Suffix = 'ms' });
LegitSettings:AddToggle('AimbotClosest', { Text = 'Aim at Closest Part' });

local VisualsTab = TestWindow:AddTab('Visuals');

local ESP = VisualsTab:AddLeftTabbox();
local EnemyESP = ESP:AddTab('Enemy ESP');
EnemyESP:AddToggle('Nametags', { Text = 'Nametags' }):AddColorPicker('nColor', { Default = Color3.new(1, 1, 1) });
EnemyESP:AddToggle('Distance', { Text = 'Display Distance' });
EnemyESP:AddToggle('Boxes', { Text = 'Boxes' }):AddColorPicker('vbColor', { Default = Color3.new(0, 1, 0) }):AddColorPicker('nvbColor', { Default = Color3.new(1, 0, 0) });
EnemyESP:AddToggle('Healthbar', { Text = 'Healthbars' }):AddColorPicker('hColor', { Default = Color3.new(0, 1, 0) });

local ESPSettings = ESP:AddTab('ESP Settings');
ESPSettings:AddSlider('FontSize', { Text = 'Font Size', Default = 14, Min = 8, Max = 24, Rounding = 0 });
ESPSettings:AddDropdown('SelectedFont', { Text = 'ESP Font', Default = 1, Values = Fonts });

local SettingsTab = TestWindow:AddTab('Settings');

local function UpdateTheme()
    Library.BackgroundColor = Flags.BackgroundColor.Value;
    Library.MainColor = Flags.MainColor.Value;
    Library.AccentColor = Flags.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Flags.OutlineColor.Value;
    Library.FontColor = Flags.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local cheatthemes = {"Default","TokyoNight","NekoRed","NekoBlue","Fatality","GameSense","Twitch"}

local function SetThemes()
if Flags.Selectedtheme.Value == "Default" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(0,0,0));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(0,0,0));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(0,0,255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "TokyoNight" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(24,25,37));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(22,22,31));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(103,89,179));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "NekoRed" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(23,23,23));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(18,18,18));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(226, 30, 112));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(60, 60, 60));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "NekoBlue" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(23,23,23));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(18,18,18));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(0, 247, 255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(60, 60, 60));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "Fatality" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(29,23,66));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(25,19,53));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(197,7,83));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(29,23,66));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "GameSense" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(35,35,35));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(17,17,17));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(147,184,26));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(47,47,47));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "Twitch" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(24,24,27));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(14,14,14));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(169,112,255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(45,45,45));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
end
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default =  Color3.fromRGB(0,0,0) });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default =  Color3.fromRGB(0,0,0) });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default =  Color3.fromRGB(0,0,255) });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default =  Color3.fromRGB(50, 50, 50) });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddDropdown('Selectedtheme', { Text = 'Theme', Default = 1, Values = cheatthemes }):OnChanged(function()
   SetThemes(); 
end);
Theme:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
    Library.KeybindFrame.Visible = Flags.Keybinds.Value;
end);
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Flags.Watermark.Value);
end);

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Flags.Rainbow.Value then
            local Registry = TestWindow.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;
    end;
end);

Flags.Rainbow:OnChanged(function()
    if not Flags.Rainbow.Value then
        UpdateTheme();
    end;
end);

Flags.BackgroundColor:OnChanged(UpdateTheme);
Flags.MainColor:OnChanged(UpdateTheme);
Flags.AccentColor:OnChanged(UpdateTheme);
Flags.OutlineColor:OnChanged(UpdateTheme);
Flags.FontColor:OnChanged(UpdateTheme);

Library:Notify('Loaded UI!');

--quick example on using flags

local fovcircle = Drawing.new("Circle")
game:GetService("RunService").RenderStepped:Connect(function()
    fovcircle.Visible = Flags.Fov_Enabled.Value
fovcircle.Thickness = 1
fovcircle.Color = Color3.fromRGB(255, 255, 255)
fovcircle.NumSides = 90
fovcircle.Radius = Flags.Fov_Radius.Value
fovcircle.Filled = Flags.Fov_filled.Value
fovcircle.Position = Vector2.new(Mouse.X, Mouse.Y)
end)
