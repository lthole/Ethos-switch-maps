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
--     decoupled the code from radio definition files
--     added X18RS
--     changed trim on X20R and X20RS (horizontal)
--     added focus border
--     fix Pot S2 placement
--     added bold switch names and dashed lines
--     added multiple resolutions compatibility per radio to allow full screen and non full screen
--     in simulator, only handles evt_touch category to still allow the use of other controls
--     revised template loading implemented
--     write routine is now quote safe (if case you tape a quote in the switch description)
--     write routine now write colors like this: "lcd.RGB(0xf8, 0xc0, 0x00)", config file using the old syntax are still valid.
--     moved switches inside a panel on the configure page
--     added widget version in configure page
--     no more focus border on full screen, instead the widget information (bottom right) is shown in the focus color
--     light mode theme support
--
--
-- **************************************************************************************
-- ***         widget startup code                                                    ***
-- *** The code that is outside of the handlers will be executed on the 1st script    ***
-- *** load (radio start).                                                            ***
-- **************************************************************************************

local version="1.0"
-- Get information for Transmitter
local sys = system.getVersion()

local debug_mode=false -- sys.simulation or true or false only
if debug_mode then print("SWMAP Debug MODE ON") end

local defaultCtrlsColor = function() return lcd.themeColor(THEME_FOCUS_COLOR) end
local defaultTextColor = function() return lcd.darkMode() and lcd.RGB(0, 0xFF, 0xFF) or lcd.color(0x58, 0x5C, 0x58) end

local configurationPath="SCRIPTS:/swmap/models/"

-- supported switches in display order
local radioSwitches = {
    "SA", "SB", "SC", "SD", "SE", "SF", "SG", "SH", "SI", "SJ", "SK", "SL",
    "LS", "RS",
    "S1", "S2", "S3",
    "T1", "T2", "T3", "T4", "T5", "T6",
    "FS1", "FS2", "FS3", "FS4", "FS5", "FS6"
}

local fullScreenLayout = string.format("%dx%d", sys.lcdWidth, sys.lcdHeight) -- used to detect full screen in paint()
local function isFullScreen(layout)
    return layout == fullScreenLayout
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

---read a configuration file
---@param basename string|nil filename of the file without path if nil, reads the model's configuration
---@return table<string, string|integer|boolean>|nil
local function readConfiguration(basename)
    local config = {}
    local chunk = loadfile(getConfigurationFilePath(basename))
    if chunk then
        local data = chunk({lcd=lcd}) -- executes the config file passing the lcd global variable
        config.DisplayAll = data.DisplayAll
        config.DisplaySwitchNames = data.DisplaySwitchNames
        config.TextColor=data.TextColor and data.TextColor or defaultTextColor()
        config.ControlsColor=data.ControlsColor and data.ControlsColor or defaultCtrlsColor()
        for _, key in pairs(radioSwitches) do
            config[key] = data[key.."text"]
        end
        return config
    else
        warn(string.format("could not load %s", getConfigurationFilePath(basename)))
    end
    return nil
end

---returns our own radio identification string
---@param board (string) a board returned by sys.board
---@return string our identification used to find the radio definitions
local function getRadioId(board)
    -- do return 'X18RS' end
    if board:sub(1,6)=="X20PRO" or board:sub(1,2)=="XE" then return 'X20PRO' end
    if board:sub(1,5)=="X20RS" then return 'X20R' end -- explicitly show X20RS support
    if board:sub(1,4)=="X20R" then return 'X20R' end
    if board:sub(1,5)=="X18RS" then return 'X18RS' end
    return 'X20'
end

--- returns the radio definition file for a board and a window resolution
---@param board string the board returned by sys.board
---@param w integer the width of the window
---@param h integer the height of the window
---@return table<string, { lines: table|nil, draw: function|nil }>
local function loadRadioDefinition(board, w, h)
    local function load(basename)
        return assert(loadfile(string.format("radios/%dx%d/%s.lua", w, h, basename)))()
    end
    return load(getRadioId(board))
end

---checks if resolution is supported for the given board
---@param board string a board returned by sys.board
---@param w integer the window with
---@param h integer the window height
---@return boolean
local function isWindowSizeSupported(board, w, h)
    local supported = {
        ["X20PRO"]={{800,480}, {784, 316}},
        ["X20R"]={{800,480}, {784, 316}},
        ["X18RS"]={{800,480}, {784, 316}},
        ["X20"]={{800,480}, {784, 316}},
    }
    local radioId=board
    if not supported[radioId] then return false end
    for _, def in pairs(supported[radioId]) do
        if w == def[1] and h == def[2] then
            return true
        end
    end
    return false
end

--define function for retrieving translations from translation files
local STR = assert(loadfile("i18n/i18n.lua"))().translate

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
-- ***                                                                                ***
-- *** NON STANDARD: create is also called when we reset template in configure method ***
-- **************************************************************************************
--
local function create()
    local widget = {
        --- saved
        DisplayAll=true,
        DisplaySwitchNames=true,
        TextColor=defaultTextColor(),
        ControlsColor=defaultCtrlsColor(),
        --- others
        layout=nil, -- to detect screen layout change
        curposx=0, -- cursor x position in simulator
        curposy=0,-- cursor y position in simulator
    }
    for _, k in pairs(radioSwitches) do
        widget[k] = ""
    end
    return widget
end

-- **************************************************************************************
-- ***                               WakeUp handler                                   ***
-- **************************************************************************************
--
local function wakeup(widget)
    local w, h = lcd.getWindowSize()
    -- load once the radio definition
    if not widget.radio and isWindowSizeSupported(sys.board, w, h) then
        widget.radio = loadRadioDefinition(sys.board, w, h)
        lcd.invalidate()
    end
    -- detects if layout has changed
    local layout = tostring(w).."x"..tostring(h)
    if layout ~= widget.layout then
        widget.layout = layout
        widget.radio = nil
        lcd.invalidate()
    end
end

-- **************************************************************************************
-- ***		     "display handler"					                                  ***
-- *** The paint handler is responsible for graphical representations in a script,    ***
-- *** therefore only necessary in scripts that display something on the screen.      ***
-- **************************************************************************************
--
local function paint(widget)
    local w, h = lcd.getWindowSize()

    -- show the focus through a border of 4px except on full screen
    local border = isFullScreen(widget.layout) and 0 or 3
    lcd.color(lcd.themeColor(THEME_DEFAULT_BGCOLOR))
    lcd.drawFilledRectangle(border, border, w - (2 * border), h - (2 * border))

    if not widget.radio then
        lcd.drawText( 0, 0, string.format("%sx%s : unsupported widget size, Try Full Screen", w, h))
        return
    end

    -- show widget information on Full Screen, color based on lcd.hasFocus
    if isFullScreen(widget.layout) then
        lcd.font(FONT_XS)
        lcd.color(lcd.hasFocus() and lcd.themeColor(THEME_FOCUS_COLOR) or lcd.themeColor(14)) -- 14 is the theme color for widget titles
        lcd.drawText(w - 4, h - select(2, lcd.getTextSize("")) - 4, STR("ScriptName")..' v'..version, TEXT_RIGHT)
    end

    if sys.simulation==true and debug_mode then
        lcd.font(FONT_S)
        lcd.color(lcd.themeColor(THEME_DEFAULT_COLOR))
        --lcd.drawText(1, widget.h-s_font_h,"Pos left:"..curposx.."    Pos high: "..curposh-s_font_h)
        lcd.drawText(1, 10,widget.curposx..", "..widget.curposy)
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
            if widget.DisplaySwitchNames then
                lcd.font(FONT_S_BOLD)
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

    for id, specs in pairs(widget.radio) do
        lcd.color(type(widget.TextColor) == "function" and widget.TextColor() or widget.TextColor)
        if specs["lines"] then addLegend(widget[id] or "", id, specs["lines"], specs["align"], specs["offset"]) end
        lcd.color(type(widget.ControlsColor) == "function" and widget.ControlsColor() or widget.ControlsColor)
        if type(specs["draw"]) == "function" then specs["draw"]() end
    end

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
        if category == EVT_TOUCH then
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
    local function _checkIfEmpty()
        for _, k in pairs(radioSwitches) do
            if widget[k] ~= "" and widget[k] ~= "" then
                return false
            end
        end
        return true
    end
    local isEmpty = _checkIfEmpty() -- cache

    local function loadTemplate(basename)
        if not basename then
            local config = create()
            for k,v in pairs(config) do
                widget[k] = v
            end
        else
            local config = readConfiguration(basename)
            if config then
                for k, v in pairs(config) do
                    widget[k] = v
                end
            end
        end
    end
    local function loadExample()
        local config = create()
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
        for k,v in pairs(config) do
            widget[k] = v
        end
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
    local line, slots, choice, panel, exampleButton
    local configChoices, configIndexes = buildChoices()
    local count = #(configChoices)

    line = form.addLine(STR("DisplayAll"))
    form.addBooleanField(line, nil, function() return widget.DisplayAll end, function(value) widget.DisplayAll = value end)

    line = form.addLine(STR("DisplaySwitchNames"))
    form.addBooleanField(line, nil, function() return widget.DisplaySwitchNames end, function(value) widget.DisplaySwitchNames = value end)

    line = form.addLine(STR("TextColor"))
    form.addColorField(line, nil, function() return widget.TextColor end, function(TextColor) widget.TextColor = TextColor end)

    line = form.addLine(STR("ControlsColor"))
    form.addColorField(line, nil, function() return widget.ControlsColor end, function(ControlsColor) widget.ControlsColor = ControlsColor end)

    panel = form.addExpansionPanel(STR("SwitchExpansionTitle"))
    local isFirst
    for _, k in pairs(radioSwitches) do
        if widget.radio and widget.radio[k]["lines"] then -- no lines means no legend or disabled switch
            line = panel:addLine(STR(k.."text"))
            local textField = form.addTextField(line, nil, function() return widget[k] or "" end, function(value) widget[k] = value end)
            if isFirst == nil then textField:focus() isFirst = false end
        end
    end
    if count == 0 and isEmpty then
        panel:open(false)
        line = form.addLine(STR("ExampleLine"))
        form.addTextButton(line, nil, STR('ExampleButton'), function()
            loadExample()
            model.dirty()
            form.clear()
            return configure(widget)
        end)
    else
        line = form.addLine(count > 0 and STR("LoadPreset") or "")
        slots = form.getFieldSlots(line, {0, 100})
        if count > 0 then
            choice = form.addChoiceField(line, slots[1], configChoices, function() return 0 end,
                function(newValue)
                    loadTemplate(configIndexes[newValue])
                    model.dirty()
                    form.clear()
                    return configure(widget)
                end
            )
            choice:title(STR("TemplateChoiceTitle"))
        end

        form.addTextButton(line, slots[2], STR("Reset"), function()
            form.openDialog({
                title=string.format(STR("ConfirmDialogTitle")),
                message=STR("ResetConfirmMessage"),
                buttons={
                    {label=STR("ButtonYes"), action=function() loadTemplate() model.dirty() form.clear() return configure(widget) or true end},
                    {label=STR("ButtonNo"), action=function() return true end},
                },
                options=TEXT_LEFT
            })
            end
        )
    end

    line = form.addLine(STR("WidgetInformation"))
    form.addStaticText(line, nil, STR("ScriptName") .. " v" .. version)

    if isEmpty then
        panel:open(false)
        if choice and count > 0 then choice:focus() end-- we need to give the focus to a field otherwise the Reset makes the form to loose the focus
    end
end

-- **************************************************************************************
-- ***		     read widget	 	   		                                          ***
-- *** The parameters written by the write handler should, of course, also be loaded  ***
-- *** when the model is loaded (or otherwise). This is done by the read handler.     ***
-- **************************************************************************************

local function read(widget)
    if debug_mode then print("Reading config from file io storage") end
    --if debug_mode and onStart then print("192 lothar: start reading widget config @" .. os.clock(),"   ***************************************   ") end
    ---@diagnostic disable-next-line: undefined-field
    local config = readConfiguration()
    if config then
        for k,v in pairs(config) do
            widget[k] =  v
        end
    end
end

-- **************************************************************************************
-- ***		     write widget	 	   		                                          ***
-- *** The write handler saves model-specific parameters to the model file.           ***
-- *** Typically, changes in values in the config handler trigger this write action.  ***
-- *** Of course, the handler must have already been defined by the init handler.     ***
-- **************************************************************************************
--
local function write(widget)
  if debug_mode then print("Writing config to file "..getConfigurationFilePath()) end
    local function color(rgba)
        -- BEWARE, this might be hardware specific
        local r, g, b, a =
            ((rgba & 0x0000f800) >> 11) * 8,
            ((rgba & 0x000007e0) >> 5) * 4,
            ((rgba & 0x0000001f) >> 0) * 8,
            ((rgba & 0x0f000000) >> 24) * 16
        return string.format("lcd.RGB(0x%02x, 0x%02x, 0x%02x)", r, g, b)
    end
    local function quote(text)
        return '"' .. tostring(text):gsub('[\\"]', '\\%0') .. '"'
    end
    -- write storage to sdcard
    local f = assert(io.open(getConfigurationFilePath(), "w"))
    local function append(key, value)
        f:write(string.format("\n   %s = %s,\n", key, value))
    end
    f:write("return {")
    append("DisplayAll", widget.DisplayAll)
    append("DisplaySwitchNames", widget.DisplaySwitchNames)
    append("TextColor", color(widget.TextColor))
    append("ControlsColor", color(widget.ControlsColor))
    for _, key in pairs(radioSwitches) do
        append(key.."text", quote(widget[key]))
    end
    f:write("}")
    f:close()
    ---@diagnostic disable-next-line: cast-local-type
    f = nil -- TODO is it useful ?
end

-- **************************************************************************************
-- ***		     init widget		 	   		                                      ***
-- This handler is called during the transmitter's boot process.                      ***
-- The transmitter makes a list of all Lua scripts with their unique                  ***
-- "keys" and their types (widget, systemTool, etc.)                                  ***
-- **************************************************************************************
--
local function init()
    system.registerWidget({key="swmap", name=name, create=create, wakeup=wakeup, paint=paint, configure=configure, read=read, write=write, event=event, title=false})
end


return {init=init}
