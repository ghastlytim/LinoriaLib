Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/LinoriaLib/main/linorialibedited.lua'))();

local Fonts = {};
for Font, _ in next, Drawing.Fonts do
	table.insert(Fonts, Font);
end;

local TestWindow = Library:CreateWindow('window title');
Library:SetWatermark('watermark!!! (hi)');
Library:Notify('Loading UI...');

local LegitTab = TestWindow:AddTab('Example');
local LegitTabbox1 = LegitTab:AddLeftTabbox('Fov');
local lAimbot1 = LegitTabbox1:AddTab('Fov');
lAimbot1:AddToggle('Fov_Enabled', { Text = 'Enable fov' });
lAimbot1:AddToggle('Fov_filled', { Text = 'Fov Filled' });
lAimbot1:AddSlider('Fov_Radius', { Text = 'Fov Radius', Default = 0, Min = 0, Max = 300, Rounding = 0, Suffix = '' });

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

local function SetDefault()
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(28, 28, 28));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(20, 20, 20));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(0, 85, 255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Flags.Rainbow:SetValue(false);

    UpdateTheme();
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default = Library.BackgroundColor });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default = Library.MainColor });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default = Library.AccentColor });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default = Library.OutlineColor });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddButton('Default Theme', SetDefault);
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
fovcircle.Visible = Flags.Fov_Enabled.Value
fovcircle.Thickness = 1
fovcircle.Color = Color3.fromRGB(255, 255, 255)
fovcircle.NumSides = 90
fovcircle.Radius = Flags.Fov_Radius.Value
fovcircle.Filled = Flags.Fov_filled.Value
fovcircle.Position = Vector2.new(Mouse.X, Mouse.Y)
