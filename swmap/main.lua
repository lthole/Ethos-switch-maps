-- **************************************************************************************
-- ***.        Switch Mapping Widget.                                                 ***
-- *** Based on earlier versions by ronron, Static, and Benno                         ***
-- *** With help from Bertrand Songis and strgaltdel (Udo Nowakowski)                 ***
-- **************************************************************************************
-- 2025-06-25 v0.2 remove unnecessary wakeup() and automate X20 Pro detetcion
-- 2025-06-28 v0.3 add color selection, supoort for X20R/RS, moved the sliders and Si/SJ, only show relevant elements in config form
-- 2025-07-09 v0.4 add file io for config storage due to widget.write memory limitations
-- 2025-07-10 v0.5 ehancements per @Alex00101: move model.filename(); use 'SCRIPTS:/swmap/...' in paths; add localization; make STR local.
-- 2026-02-25 v1.0 enhancements from @flyingeek:
--   decoupled the code from radio definition files
--   added X18RS
--   changed trim on X20R and X20RS (horizontal)
--   added focus border
--   fix Pot S2 placement
--   added bold switch names and dashed lines
--   added multiple resolutions compatibility per radio to allow full screen and non full screen
--   in simulator, only handles evt_touch category to still allow the use of other controls
--   revised template loading implemented
--   write routine is now quote safe (if case you tape a quote in the switch description)
--   write routine now write colors like this: "lcd.RGB(0xf8, 0xc0, 0x00)", config file using the old syntax are still valid.
--   moved switches inside a panel on the configure page
--   added widget version in configure page
--   no more focus border on full screen, instead the widget information (bottom right) is shown in the focus color
--   light mode theme support
-- 2026-02-26 v1.0.1 Some radios not working (Discussion #6)
-- 2026-02-28 v1.0.2 fix the configuration form when first launched from Screens page
-- 2026-03-10 v1.1.0 enha
--   fix: wakeup only run when widget is visible
--   fix: added XE radio switches to the list of supported switches
--   fix: text color on light theme
--   feature: changed focus hint
--   feature: enhanced graphic representation (still using draw)
--   feature: configuration file includes script version, colors shown as hex and decimals
--   feature: improved debug_mode
--   feature: possibility to create custom radio definition file to override buttons or whatever (see radios/custom/readme.txt)
--   feature: in full screen mode you can add up to two notes, and display the model name
-- 2026-03-28 added a custom switch map for XE radios (Thanks to @Helischorsch).
-- 2026-03-29 in xe.lua reverse text direction for the switches to avoid early overlaps
--
-- **************************************************************************************
-- ***         widget startup code                                                    ***
-- *** The code that is outside of the handlers will be executed on the 1st script    ***
-- *** load (radio start).                                                            ***
-- **************************************************************************************

local version="1.1.2"
local build -- defined here as configure needs it
-- Get information for Transmitter
local sys = system.getVersion()

local debug_mode=false -- sys.simulation or true or false only
local ANSI_BLACK = "\27[1;30m"
local ANSI_RED = "\27[1;31m"
local ANSI_GREEN = "\27[1;32m"
local ANSI_YELLOW = "\27[1;33m"
local ANSI_CYAN = "\27[0;36m"
local function log(text, ansiColor)
    if not ansiColor then ansiColor = ANSI_CYAN end -- black is unreadable on ethos.studio1247.com
    local ANSI_RESET = "\27[0m"
    print(ansiColor.."[swmap] "..tostring(text)..ANSI_RESET)
end
if debug_mode then log("SWMAP Debug MODE ON") end

local defaultTextColorDark = lcd.RGB(0, 0xFF, 0xFF)
local defaultTextColorLight = lcd.RGB(0x58, 0x5C, 0x58)
local getDefaultTextColor = function() return lcd.darkMode() and defaultTextColorDark or defaultTextColorLight end

-- Colors used to mimic Hardware Checks Page
local GRAY_DARK = lcd.RGB(0x31, 0x31, 0x31)
local GRAY_LIGHT = lcd.RGB(0x52, 0x51, 0x52)
local inactiveSwitchColor -- depends on theme (light/dark) set in build

local configurationPath="SCRIPTS:/swmap/models/"

-- supported switches in display order
local radioSwitches = {
    "SA", "SB", "SC", "SD", "SE", "SF", "SG", "SH", "SI", "SJ", "SK", "SL",
    "LS", "RS", "L1", "L2",
    "S1", "S2", "S3", "S4",
    "T1", "T2", "T3", "T4", "T5", "T6",
    "FS1", "FS2", "FS3", "FS4", "FS5", "FS6"
}

local function isFullScreen(w, h)
    return w == sys.lcdWidth and h == sys.lcdHeight
end

--- copy a config into a widget
--- @param widget table
--- @param config table
local function applyConfig(widget, config)
    for k,v in pairs(config) do
        widget[k] =  v
    end
end

--- returns the configuration pathname
---@param basename nil|(string) the filename without path or nil
---@return string the pathname to the model's configuration or the pathname for basename
local function getConfigurationFilePath(basename)
    if basename then
        return configurationPath .. basename
    end
    -- for backward compatibility, do not change regex
    return configurationPath .. string.gsub(model.name(),'[^%w_-]', '-') .. ".lua"
end


---returns our own radio identification string
---@param board (string) a board returned by sys.board
---@return string our identification used to find the radio definitions
local function getRadioId(board)
    -- do return 'X18RS' end
    if board:sub(1,6)=="X20PRO" then return 'X20PRO'
    elseif board:sub(1,2)=="XE" then return 'XE'
    elseif board:sub(1,5)=="X20RS" then return 'X20R' -- explicitly show X20RS support
    elseif board:sub(1,4)=="X20R" then return 'X20R'
    elseif board:sub(1,4)=="X18R" then return 'X18RS'
    elseif board == "TWXLITERII" then return 'TWXLITERII'
    elseif board:sub(1,3) == "X14" then return 'X14RS'
    else return 'X20' end
end

--define function for retrieving translations from translation files
local i18n = assert(loadfile("i18n/i18n.lua"))()
local STR = i18n.translate


-- **************************************************************************************
-- ***		     read widget	 	   		                                          ***
-- *** The parameters written by the write handler should, of course, also be loaded  ***
-- *** when the model is loaded (or otherwise). This is done by the read handler.     ***
-- **************************************************************************************
-- we do not use the read method, the reason is that the standard workflow in Ethos is:
-- existing widget -> create -> read -> build -> paint
-- new widget -> create -> write -> build -> paint
-- as we use a permanent storage we need to call the read equivalent from create


---read a configuration file
---@param basename string|nil filename of the file without path if nil, reads the model's configuration
---@return table<string, string|integer|boolean>|nil
local function readConfiguration(basename)
    local config = {}
    if debug_mode then log("Reading configuration from file: "..getConfigurationFilePath(basename)) end
    local chunk = loadfile(getConfigurationFilePath(basename), "bt", {lcd=lcd})-- load the config file passing only the lcd global variable
    if chunk then
        local data = chunk()
        if data.DisplayAll ~= nil then config.DisplayAll = data.DisplayAll end
        if data.DisplaySwitchNames ~= nil then config.DisplaySwitchNames = data.DisplaySwitchNames end
        if data.TextColor ~= nil then config.TextColor = data.TextColor end
        if data.DisplayVersion ~= nil then config.DisplayVersion = data.DisplayVersion end
        if data.DisplayModelName ~= nil then config.DisplayModelName = data.DisplayModelName end
        if data.Note1 ~= nil then config.Note1 = data.Note1 end
        if data.Note2 ~= nil then config.Note2 = data.Note2 end
        if data.NoteColor ~= nil then config.NoteColor = data.NoteColor end
        for _, key in pairs(radioSwitches) do
            if data[key.."text"] ~= nil then config[key] = data[key.."text"] end
        end
        return config
    else
        -- might be normal for a new model
        log(string.format("could not load %s", getConfigurationFilePath(basename)), ANSI_YELLOW)
    end
    return nil
end

-- **************************************************************************************
-- ***		     name widget					                                      ***
-- **************************************************************************************

local function name()		-- name script, appears in widget selection list
  return STR("ScriptName")
end


-- **************************************************************************************
-- ***		    startup (onetime) handler		                                      ***
-- ***	         returns widget vars			                                      ***
-- *** The create handler is executed the first time the script is called, for        ***
-- *** example, when the screen of a widget is activated for the first time.          ***
-- *** time. In the create handler, the "central data structure" or an array is       ***
-- *** typically defined, which can be passed to other handlers.                      ***
-- *** This data structure must be defined as the return value of the handler.        ***
-- **************************************************************************************

-- also used in configure to load example/template
local function defaultConfig()
    local widget = {
        DisplayAll=true,
        DisplaySwitchNames=true,
        TextColor=nil,
        DisplayVersion=true,
        DisplayModelName=true,
        Note1="",
        Note2="",
        NoteColor=nil,
    }
    for _, k in pairs(radioSwitches) do
        widget[k] = ""
    end
    if sys.simulation then
        widget.curposx = 0
        widget.curposy = 0
    end
    return widget
end

local function create()
    if debug_mode then log("create called") end
    local widget = defaultConfig()
    -- see in the code under the read method why we do not use it and instead readConfiguration here
    local config = readConfiguration()
    -- Note fields to read must be defined in readConfiguration (white list)
    if config then
        applyConfig(widget, config)
    end
    return widget
end

-- **************************************************************************************
-- ***                               WakeUp handler                                   ***
-- **************************************************************************************
-- not used, we prefer build


-- **************************************************************************************
-- ***		     "display handler"					                                  ***
-- *** The paint handler is responsible for graphical representations in a script,    ***
-- *** therefore only necessary in scripts that display something on the screen.      ***
-- **************************************************************************************
--
local function paint(widget)
    local timestamp = os.clock()
    local w, h = lcd.getWindowSize()

    -- hide focus color
    lcd.color(lcd.darkMode() and lcd.RGB(0x10, 0x10, 0x10) or lcd.RGB(0xd6, 0xd2, 0xd6)) -- mimics Hardware Checks Page
    lcd.drawFilledRectangle(0, 0, w, h)

    -- alert if non supported definition
    if widget.radio == false then
        if lcd.isConfiguring and lcd.isConfiguring() then
            lcd.color(lcd.themeColor(THEME_DEFAULT_COLOR))
            lcd.font(FONT_XL)
            local text = "Switch Maps"
            local tw, th = lcd.getTextSize(text)
            lcd.drawText( w/2, h/2 - th/2, text, TEXT_CENTERED)
            lcd.font(FONT_S)
            lcd.drawText( w/2, h/2 + th/2, "lthole edition", TEXT_CENTERED)
        elseif not lcd.isConfiguring or not lcd.isConfiguring() then
            lcd.color(lcd.themeColor(THEME_DEFAULT_COLOR))
            lcd.drawText( 5, 30, string.format("%sx%s : unsupported widget size for %s", w, h, sys.board))
            if not isFullScreen(w, h) then
                local _, lineHeight = lcd.getTextSize("")
                lcd.drawText(5, 30 + lineHeight, "Try Full Screen")
            end
        end
        return
    end

    lcd.font(FONT_S)
    local _, textOffsetY = lcd.getTextSize("") -- the legend is by default textOffset above the line
    local function addLegend(label, prefix, lines, align, offset)
        if widget.DisplayAll or label ~= "" then
            local x = lines[1][1]
            local y = lines[1][2]
            if not align and x < w/2 then align = TEXT_LEFT end
            if not align and x >= w/2 then align = TEXT_RIGHT end
            local labelOffsetX = 0
            if widget.DisplaySwitchNames and prefix and prefix ~= "" then
                lcd.font(FONT_S_BOLD and FONT_S_BOLD or FONT_S)
                local pw = lcd.getTextSize(prefix .." ")
                if align == TEXT_RIGHT then
                    lcd.drawText(x, y - (offset and offset or textOffsetY), prefix, align)
                    labelOffsetX =  pw
                elseif align == TEXT_CENTERED then
                    local lw = lcd.getTextSize(label) -- not UTF8 compatible on ethos < 1.7 but acceptable for one or two accentuated chars (slight misplacement)
                    lcd.drawText(x - pw/4 -lw/2, y - (offset and offset or textOffsetY), prefix, align)
                    labelOffsetX = -pw/2
                else
                    lcd.drawText(x, y - (offset and offset or textOffsetY), prefix, align)
                    labelOffsetX = -pw
                end
            end
            lcd.font(FONT_S)
            lcd.drawText(x - labelOffsetX, y - (offset and offset or textOffsetY), label, align)

            for _,rect in pairs(lines) do
                lcd.pen(PEN_DASHED)
                lcd.drawLine(rect[1], rect[2], rect[3], rect[4])
                lcd.pen(PEN_SOLID)
            end
        end
    end
    -- first draw controls
    for _, specs in pairs(widget.radio) do
        if type(specs["draw"]) == "function" then specs["draw"]() end
    end
    -- next legends (on top)
    for id, specs in pairs(widget.radio) do
        lcd.color(widget.TextColor or getDefaultTextColor())
        if specs["lines"] then addLegend(widget[id] or "", id, specs["lines"], specs["align"], specs["offset"]) end
    end

    --
    -- display some goodies
    --
    if sys.simulation==true and debug_mode then
        lcd.font(FONT_S_BOLD and FONT_S_BOLD or FONT_S)
        lcd.color(lcd.themeColor(THEME_DEFAULT_COLOR))
        if isFullScreen(w, h) then
            lcd.drawText(18, 5,widget.curposx..", "..widget.curposy)
        else
            lcd.color(lcd.GREY(5, 0.7))
            lcd.drawFilledRectangle(0, 0, 70, 15)
            lcd.color(lcd.themeColor(THEME_DEFAULT_COLOR))
            lcd.drawText(0, 0,widget.curposx..", "..widget.curposy)
        end
    end
    if isFullScreen(w, h) then
        if widget.DisplayModelName then
            lcd.font(FONT_L_BOLD and FONT_L_BOLD or FONT_BOLD)
            lcd.color(widget.TextColor or getDefaultTextColor())
            lcd.drawText(18, 21, model.name())
        end
        if widget.DisplayVersion then
            -- show widget information on Full Screen, color based on lcd.hasFocus
            lcd.font(FONT_XS)
            lcd.color(lcd.hasFocus() and lcd.themeColor(THEME_FOCUS_COLOR) or lcd.themeColor(14)) -- 14 is the theme color for widget titles
            lcd.drawText(w - 10, 10, STR("ScriptName")..' v'..version, TEXT_RIGHT)
        end
        lcd.color(widget.NoteColor or getDefaultTextColor())
        lcd.font(FONT_S)
        if widget.Note1 and widget.Note1 ~= "" then
            addLegend(widget.Note1, "", {{5,h-30,select(1, lcd.getTextSize(widget.Note1)) + 5,h-30}})
        end
        if widget.Note2 and widget.Note2 ~= "" then
            addLegend(widget.Note2, "", {{5,h-10,select(1, lcd.getTextSize(widget.Note2)) + 5,h-10}})
        end
    elseif lcd.hasFocus() then
        -- when not in full screen, displays simply FOCUS to give a hint
        lcd.font(FONT_BOLD)
        lcd.color(lcd.themeColor(THEME_FOCUS_COLOR))
        lcd.drawText(w/2, h - select(2, lcd.getTextSize("")) - 2, STR("Focus"), TEXT_CENTERED)
    end
    if debug_mode then log(string.format("paint time %sms", (os.clock() - timestamp) * 1000)) end
end

-- **************************************************************************************
-- ***		     monitor events		 	   		                                      ***
-- *** This handler is used to process "external events," usually user interventions. ***
-- *** For example, touching a screen, pressing control buttons (Page Up/Down),       ***
-- *** scroll wheel, etc.                                                             ***
-- **************************************************************************************
--
-- If using the simulator with debug mode on, clicking the mouse pointer on the screen
-- will cause the cursor position to be returned to assist with working out line coordinates.
local function event(widget, category, value, x, y)
    if sys.simulation==true and debug_mode then
        if category == EVT_TOUCH and value ~= TOUCH_MOVE then
            if value == TOUCH_START then
                widget.curposx=x
                widget.curposy=y
                lcd.invalidate()
            end
            return true
        end
        return false
    end
end


-- **************************************************************************************
-- ***		     configure widget	 	   		                                      ***
-- *** Clicking the widget configure option triggers this handler.                    ***
-- **************************************************************************************
--
local function configure(widget)
    if widget.radio == nil then
        -- happens when configuring widget from screen without having displayed it first
        build(widget)
    end
    local function _checkIfEmpty()
        for _, k in pairs(radioSwitches) do
            if widget[k] ~= "" then
                return false
            end
        end
        return true
    end
    local isEmpty = _checkIfEmpty() -- cache

    local function loadTemplate(basename)
        -- reset all to default
        local config = defaultConfig()
        applyConfig(widget, config)
        -- then load
        if basename then
            local config = readConfiguration(basename)
            if config then
                applyConfig(widget, config)
            end
        end
    end
    local function loadExample()
        local config = defaultConfig()
        config["SA"] = "Stab"
        config["SB"] = "Call telem"
        config["SE"] = "FMode"
        config["SG"] = "Thr arm"
        config["SH"] = "Thr cancel + SGdn"
        config["T2"] = "Flap comp/Motor comp"
        config["T4"] = "Ail diff"
        config["LS"] = "Thermal camber"
        config["RS"] = "Throttle"
        config["S1"] = "Stab gain"
        config["S2"] = "SL gain"
        config["S3"] = "Volume"
        applyConfig(widget, config)
    end
    local function buildChoices() -- build a choice list for the form
        local choices = {} -- choices for the form
        local indexes = {} -- index to retrieve the basename of the selected file
        local modelFileName = getConfigurationFilePath():match("[^/]*.lua$") -- current model configuration basename
        for i,f in pairs(system.listFiles(configurationPath)) do
            if f:sub(-4) == ".lua" and f ~= modelFileName then
                table.insert(choices, {f:sub(1, -5), i})
                indexes[i] = f
            end
        end
        return choices, indexes
    end

    local line, slots, choice, panel
    local configChoices, configIndexes = buildChoices()
    local count = #(configChoices)

    line = form.addLine(STR("DisplayAll"))
    form.addBooleanField(line, nil, function() return widget.DisplayAll end, function(value) widget.DisplayAll = value end)

    line = form.addLine(STR("DisplaySwitchNames"))
    form.addBooleanField(line, nil, function() return widget.DisplaySwitchNames end, function(value) widget.DisplaySwitchNames = value end)

    line = form.addLine(STR("TextColor"))
    form.addColorField(line, nil,
        function() return widget.TextColor or getDefaultTextColor() end,
        function(value) widget.TextColor = value ~= getDefaultTextColor() and value or nil end)

    panel = form.addExpansionPanel(STR("SwitchExpansionTitle"))
    local isFirst
    for _, k in pairs(radioSwitches) do
        if widget.radio and widget.radio[k] and widget.radio[k]["lines"] then -- no lines means no legend or disabled switch
            line = panel:addLine(STR(k.."text"))
            local textField = form.addTextField(line, nil, function() return widget[k] or "" end, function(value) widget[k] = value end)
            if isFirst == nil then textField:focus() isFirst = false end
        end
    end
    local fullScreenPanel = form.addExpansionPanel(STR("FullScreenOptions"))
    line = fullScreenPanel:addLine(STR("DisplayModelName"))
    form.addBooleanField(line, nil, function() return widget.DisplayModelName end, function(value) widget.DisplayModelName = value end)
    line = fullScreenPanel:addLine(STR("DisplayVersion"))
    form.addBooleanField(line, nil, function() return widget.DisplayVersion end, function(value) widget.DisplayVersion = value end)
    line = fullScreenPanel:addLine(STR("Note1"))
    form.addTextField(line, nil, function() return widget.Note1 end, function(value) widget.Note1 = value end)
    line = fullScreenPanel:addLine(STR("Note2"))
    form.addTextField(line, nil, function() return widget.Note2 end, function(value) widget.Note2 = value end)
    line = fullScreenPanel:addLine(STR("NoteColor"))
    form.addColorField(line, nil,
        function() return widget.NoteColor  or getDefaultTextColor() end,
        function(value) widget.NoteColor = value ~= getDefaultTextColor() and value or nil end)

    if count == 0 and isEmpty then
        panel:open(false)
        fullScreenPanel:open(false)
        line = form.addLine(STR("ExampleLine"))
        form.addButton(line, nil, {text=STR('ExampleButton'), press=function()
            loadExample()
            model.dirty()
            form.clear()
            configure(widget)
        end}):focus()
    else
        line = form.addLine(count > 0 and STR("LoadPreset") or "")
        slots = form.getFieldSlots(line, {0, 100})
        if count > 0 then
            choice = form.addChoiceField(line, slots[1], configChoices, function() return 0 end,
                function(newValue)
                    loadTemplate(configIndexes[newValue])
                    model.dirty()
                    form.clear()
                    configure(widget)
                end
            )
            choice:title(STR("TemplateChoiceTitle"))
        end

        form.addButton(line, slots[2], {text=STR("Reset"), press=function()
            form.openDialog({
                title=string.format(STR("ConfirmDialogTitle")),
                message=STR("ResetConfirmMessage"),
                buttons={
                    {label=STR("ButtonYes"), action=function() loadTemplate() model.dirty() form.clear() configure(widget) return true end},
                    {label=STR("ButtonNo"), action=function() return true end},
                },
                options=TEXT_LEFT
            })
        end})
    end
    if isEmpty then
        panel:open(false)
        fullScreenPanel:open(false)
        if choice and count > 0 then choice:focus() end-- we need to give the focus to a field otherwise the Reset makes the form to loose the focus
    end

    local infoPanel = form.addExpansionPanel(STR("WidgetInformation"))
    line = infoPanel:addLine(STR("WidgetVersion"))
    form.addStaticText(line, nil, STR("ScriptName") .. " v" .. version)
end


-- **************************************************************************************
-- ***		     write widget	 	   		                                          ***
-- *** The write handler saves model-specific parameters to the model file.           ***
-- *** Typically, changes in values in the config handler trigger this write action.  ***
-- *** Of course, the handler must have already been defined by the init handler.     ***
-- **************************************************************************************
--
local function write(widget)
  if debug_mode then log("Writing config to file: "..getConfigurationFilePath()) end
    local function color(rgba)
        -- BEWARE, this might be hardware specific
        local r, g, b, a =
            ((rgba & 0x0000f800) >> 11) * 8,
            ((rgba & 0x000007e0) >> 5) * 4,
            ((rgba & 0x0000001f) >> 0) * 8,
            ((rgba & 0x0f000000) >> 24) * 16
        return string.format("lcd.RGB(0x%02x, 0x%02x, 0x%02x), -- lcd.RGB(%s, %s, %s)", r, g, b, r, g, b)
    end
    local function quote(text)
        return '"' .. tostring(text):gsub('[\\"]', '\\%0') .. '"'
    end
    -- write storage to sdcard
    local f = assert(io.open(getConfigurationFilePath(), "w"))
    local function append(key, value)
        f:write(string.format("\n   %s = %s,\n", key, value))
    end
    f:write("-- configuration file for swmap v"..version.."\n")
    f:write("return {")
    append("DisplayAll", widget.DisplayAll)
    append("DisplaySwitchNames", widget.DisplaySwitchNames)
    -- extra check to remove color when it is the default for old config
    if lcd.darkMode() then
        if widget.TextColor and widget.TextColor ~= defaultTextColorDark then append("TextColor", color(widget.TextColor)) end
        if widget.NoteColor and widget.NoteColor ~= defaultTextColorDark then append("NoteColor", color(widget.NoteColor)) end
    else
        if widget.TextColor and widget.TextColor ~= defaultTextColorLight then append("TextColor", color(widget.TextColor)) end
        if widget.NoteColor and widget.NoteColor ~= defaultTextColorLight then append("NoteColor", color(widget.NoteColor)) end
    end
    append("DisplayVersion", widget.DisplayVersion)
    append("DisplayModelName", widget.DisplayModelName)
    append("Note1", quote(widget.Note1))
    append("Note2", quote(widget.Note2))
    for _, key in pairs(radioSwitches) do
        append(key.."text", quote(widget[key]))
    end
    f:write("}")
    f:close()
    ---@diagnostic disable-next-line: cast-local-type
    f = nil -- TODO is it useful ?
end

-- **************************************************************************************
-- ***		     Drawing Methods		 	   		                                  ***
-- They are available in the radio definitions files                   .              ***
-- **************************************************************************************
local function drawButton1Pos(cx, cy, r)
    lcd.color(lcd.darkMode() and GRAY_LIGHT or GRAY_DARK)
    lcd.drawFilledCircle(cx, cy, r)
    lcd.color(inactiveSwitchColor)
    lcd.drawFilledCircle(cx, cy, math.floor(math.max(r-4, r/2)))
end
local function drawButton2Pos(cx, cy, r)
    local r3 = math.ceil(r / 3)
    local rcos15 = math.ceil(r * 0.97)
    lcd.color(lcd.darkMode() and GRAY_LIGHT or GRAY_DARK)
    lcd.drawFilledCircle(cx, cy, r)
    lcd.color(inactiveSwitchColor)
    lcd.drawFilledTriangle(cx, cy + r3, cx + r3, cy + rcos15, cx - r3, cy + rcos15)
    lcd.color(lcd.themeColor(THEME_FOCUS_COLOR))
    lcd.drawFilledTriangle(cx - r3, cy - rcos15, cx + r3, cy - rcos15, cx, cy - r3)
end
local function drawButton3Pos(cx, cy, r)
    drawButton2Pos(cx, cy, r)
    lcd.color(inactiveSwitchColor)
    lcd.drawFilledCircle(cx, cy, math.floor(r/3))
end
local function drawPot(cx, cy, r)
    local rcos30 = 0.866 * r
    lcd.color(GRAY_LIGHT)
    lcd.drawFilledCircle(cx, cy, r)
    lcd.color(GRAY_DARK)
    lcd.drawFilledCircle(cx, cy, rcos30)
    lcd.color(GRAY_LIGHT)
    lcd.drawFilledTriangle(cx, cy, cx - (r /2), cy + rcos30, cx + (r/2), cy + rcos30)
    lcd.color(lcd.themeColor(THEME_FOCUS_COLOR))
    lcd.drawFilledCircle(cx, cy - r + 2, 4)

end
local function drawTrim(x, y, w, h)
    -- TODO computations are wrong but Ethos is drawing angle line badly
    lcd.color(lcd.darkMode() and GRAY_LIGHT or GRAY_DARK)
    lcd.drawFilledRectangle(x, y, w, h)
    lcd.color(inactiveSwitchColor)
    if w > h then -- horizontal
        local marginX = 4
        local marginY = 2
        lcd.drawLine(x + (w / 2), y, x + (w / 2), y + h)
        lcd.drawFilledTriangle(
            x + marginX, y + (h /2),
            x + (w / 2) - marginX, y + marginY,
            x + (w / 2) - marginX, y + h - marginY
        )
        lcd.drawFilledTriangle(
            x + w - marginX + 1, y + (h /2),
            x + (w / 2) + marginX - 1, y + marginY,
            x + (w / 2) + marginX - 1, y + h - marginY
        )
    else -- vertical
        local marginX = 2
        local marginY = 4
        lcd.drawLine(x, y + (h / 2), x + w, y + (h / 2))
        lcd.drawFilledTriangle(
            x + (w / 2), y + marginY,
            x + marginX, y + (h / 2) - marginY,
            x + w - marginX, y + (h / 2) - marginY
        )
        lcd.drawFilledTriangle(
            x + (w / 2), y + h - marginY,
            x + marginX, y + (h / 2) + marginY,
            x + w - marginX, y + (h / 2) + marginY
        )
    end
end
local function drawSlider(x, y , w, h)
    local rulerOffset = 5
    local rulerHeight = 3
    lcd.color(lcd.darkMode() and GRAY_LIGHT or GRAY_DARK)
    lcd.drawFilledRectangle(x, y, w, h)
    lcd.color(lcd.themeColor(THEME_FOCUS_COLOR))
    lcd.drawFilledRectangle(x - rulerOffset, math.ceil(y + (h / 2)), w + (rulerOffset * 2), rulerHeight)
end
local function drawCurvedSlider(x, y, intR, extR, startAngle, endAngle)
    lcd.color(lcd.darkMode() and GRAY_LIGHT or GRAY_DARK)
    lcd.drawAnnulusSector(x, y, intR, extR, startAngle, endAngle)
    lcd.color(lcd.themeColor(THEME_FOCUS_COLOR))
    if (startAngle + endAngle) / 2 == 270 then --left slider
        lcd.drawFilledRectangle(x - extR, y - 1, math.abs(extR - intR), 3)
    elseif (startAngle + endAngle) / 2 == 90 then --right slider
        lcd.drawFilledRectangle(x + extR, y - 1, -math.abs(extR - intR), 3)
    elseif (startAngle + endAngle) == 360 then --top slider
        lcd.drawFilledRectangle(x - 1, y - extR, 3, math.abs(extR - intR))
    elseif (startAngle + endAngle) == 180 then --bottom slider
        lcd.drawFilledRectangle(x - 1, y + extR, 3, -math.abs(extR - intR))
    else
        log("unknow type slider", ANSI_RED)
    end
end
local function drawStick(cx, cy, r)
    local margin = 8
    local rcos30 = 0.866 * r
    lcd.color(GRAY_LIGHT)
    lcd.drawFilledCircle(cx, cy, r)
    lcd.color(GRAY_DARK)
    lcd.drawFilledRectangle(cx - rcos30 + margin, cy - (r / 2), (rcos30 - margin) * 2, r)
    lcd.color(lcd.themeColor(THEME_FOCUS_COLOR))
    lcd.drawFilledCircle(cx, cy, 6)
end

-- **************************************************************************************
-- ***		     build widget		 	   		                                      ***
-- This handler is called after widget.create and on each layout change.              ***
-- **************************************************************************************
build = function(widget)
    -- here we set widget.radio
    if debug_mode then log("Build called") end
    local function load(filename)
        local env = { -- add some method to parse the definition
            drawStick=drawStick,
            drawButton1Pos=drawButton1Pos,
            drawButton2Pos=drawButton2Pos,
            drawButton3Pos=drawButton3Pos,
            drawPot=drawPot,
            drawTrim=drawTrim,
            drawSlider=drawSlider,
            drawCurvedSlider=drawCurvedSlider,
        }
        setmetatable(env, {__index = _G}) -- allow access to all globals
        if debug_mode then log(string.format("Reading definition from %s", filename)) end
        local chunk, msg = loadfile(filename,"bt", env)
        if chunk then
            return assert(chunk())
        end
        if msg then log(msg, ANSI_RED) end
        env = nil
        return false
    end
    local w, h = lcd.getWindowSize()
    if h == 0 then
        -- case where build is called from configure
        -- we assume that if a radio definition always exists for full screen
        log("assuming a full screen definition file exists")
        w = sys.lcdWidth
        h = sys.lcdHeight
    end
    local board = sys.board
    local radioId = getRadioId(board)

    local customFile = string.format("radios/custom/%s-%sx%s.lua", board, w, h)
    local swmapFile = string.format("radios/%sx%s/%s.lua", w, h, radioId)
    if os.stat(customFile) then
        widget.radio = load(customFile)
    elseif os.stat(swmapFile) then
        widget.radio = load(swmapFile)
    else
        widget.radio = false
        log(string.format("%s not found", customFile), ANSI_YELLOW)
        log(string.format("%s not found", swmapFile), ANSI_YELLOW)
    end
    -- he we set colors in case darkmode was changed
    inactiveSwitchColor = lcd.darkMode() and lcd.RGB(0x21, 0x20, 0x21) or lcd.RGB(0xf7, 0xf3, 0xf7)
    -- update translation file if needed
    if i18n.getLocale() ~= system.getLocale() then
        local locale = system.getLocale()
        if debug_mode then log("new locale "..locale) end
        i18n.changeLocale(locale)
    end
end

-- **************************************************************************************
-- ***		     init widget		 	   		                                      ***
-- This handler is called during the transmitter's boot process.                      ***
-- The transmitter makes a list of all Lua scripts with their unique                  ***
-- "keys" and their types (widget, systemTool, etc.)                                  ***
-- **************************************************************************************
--
local function init()
    system.registerWidget({key="swmap", name=name, build=build, create=create, paint=paint, configure=configure, write=write, event=event, title=false})
end


return {init=init}
