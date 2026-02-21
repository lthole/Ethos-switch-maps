-- **************************************************************************************
-- ***.        Switch Mapping Widget.                                                 ***
-- *** Based on earlier versions by ronron, Static, and Benno                         ***
-- *** With help from Bertrand Songis and strgaltdel (Udo Nowakowski)                 ***
-- **************************************************************************************
-- 2025-06-25 v0.2 remove unnecessary wakeup() and automate X20 Pro detetcion
-- 2025-06-28 v0.3 add color selection, supoort for X20R/RS, moved the sliders and Si/SJ, only show relevant elements in config form
-- 2025-07-09 v0.4 add file io for config storage due to widget.write memory limitations
-- 2025-07-10 v0.5 ehancements per @Alex00101: move model.filename(); use 'SCRIPTS:/swmap/...' in paths; add localization; make STR local.
--
--
-- **************************************************************************************
-- ***         widget startup code                                                    ***
-- *** The code that is outside of the handlers will be executed on the 1st script    ***
-- *** load (radio start).                                                            ***
-- **************************************************************************************

local version="0.5"
local debug_mode=false -- true or false only
local curposx=0
local curposy=0
local def_text_color = lcd.RGB(0, 0xFF, 0xFF)
local def_ctrls_color = lcd.RGB(0xF8, 0xC0, 0x00)
local mname -- model name (set in create())

local file ="SCRIPTS:/swmap/templates/template.lua"
local file2="SCRIPTS:/swmap/models/"

-- Get information for Transmitter
local sys = system.getVersion()

local radioSwitches = { -- supported switches in display order
    "SA", "SB", "SC", "SD", "SE", "SF", "SG", "SH", "SI", "SJ", "SK", "SL",
    "LS", "RS",
    "S1", "S2", "S3",
    "T1", "T2", "T3", "T4", "T5", "T6",
    "FS1", "FS2", "FS3", "FS4", "FS5", "FS6"
}
local function getRadioId(board)
    -- do return 'X18RS' end
    if board:sub(1,6)=="X20PRO" or board:sub(1,2)=="XE" then return 'X20PRO' end
    if board:sub(1,5)=="X20RS" then return 'X20R' end -- explicitly show X20RS support
    if board:sub(1,4)=="X20R" then return 'X20R' end
    if board:sub(1,5)=="X18RS" then return 'X18RS' end
    return 'X20'
end
local function loadRadioDefinition(board, w, h)
    local function load(basename)
        return assert(loadfile(string.format("radios/%dx%d/%s.lua", w, h, basename)))()
    end
    return load(getRadioId(board))
end
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
  return STR("scriptName")
end



-- **************************************************************************************
-- ***		    startup (onetime) handler		                                      ***
-- ***	         returns widget vars			                                      ***
-- *** The create handler is executed the first time the script is called, for        ***
-- *** example, when the screen of a widget is activated for the first time.          ***
-- *** time. In the create handler, the "central data structure" or an array is       ***
-- *** typically defined, which can be passed to other handlers.                      ***
-- *** This data structure must be defined as the return value of the handler.        ***
-- *** Often (e.g., in a widget), this is named as widget.                            ***
-- **************************************************************************************
--
local function create()
    -- load model name
    mname = model.name()
    -- subsititute wrong characters in the model name for use as filename
    mname = string.gsub(mname,'[^%w_-]', '-')
    -- if debug_mode then print ("modelname=",mname) end

    -- check if template load file exists
  -- if it does, read switches config from it
---@diagnostic disable-next-line: undefined-field
    local file_info = os.stat(file)
    if file_info then
    if debug_mode then print("Reading config from table template file") end
        local ltab = assert(loadfile(file)())
        if debug_mode then
            print("DisplayAll=", ltab.DisplayAll)
            print("DisplaySwitchNames=", ltab.DisplaySwitch)
            for _, key in pairs(radioSwitches) do
                print(string.format("%stext=", key, ltab[key.."text"]))
            end
            print("TextColor=", ltab.TextColor)
            print("ControlsColor=", ltab.ControlsColor)
        end
        if not(ltab.TextColor) then
            ltab.TextColor = def_text_color end
        if not(ltab.ControlsColor) then
            ltab.ControlsColor = def_ctrls_color end
        ltab.DisplayAll = true
        ltab.DisplaySwitchNames = true
        return ltab
        --return {DisplayAll=true, DisplaySwitchNames=true, TextColor=ltab.TextColor, ControlsColor=ltab.ControlsColor, SAtext=ltab.SAtext, SBtext=ltab.SBtext, SCtext=ltab.SCtext, SDtext=ltab.SDtext, SEtext=ltab.SEtext, SFtext=ltab.SFtext, SGtext=ltab.SGtext, SHtext=ltab.SHtext, SItext=ltab.SItext, SJtext=ltab.SJtext, SKtext=ltab.SKtext, SLtext=ltab.SLtext, LStext=ltab.LStext, RStext=ltab.RStext, S1text=ltab.S1text, S2text=ltab.S2text, S3text=ltab.S3text, T1text=ltab.T1text, T2text=ltab.T2text, T3text=ltab.T3text, T4text=ltab.T4text, T5text=ltab.T5text, T6text=ltab.T6text, FS1text=ltab.FS1text, FS2text=ltab.FS2text, FS3text=ltab.FS3text, FS4text=ltab.FS4text, FS5text=ltab.FS5text, FS6text=ltab.FS6text}
    else
        -- if debug_mode then print ("create type textcolor="..lcd.RGB(0, 0xFF, 0xFF)) end -- debug
        -- template load file does not exist
        ---@type table<string, boolean|string|number>
        local config = {
            DisplayAll=true,
            DisplaySwitchNames=true,
            TextColor=def_text_color,
            ControlsColor=def_ctrls_color
        }
        for _, key in pairs(radioSwitches) do
            config[key .."text"] = ""
        end
        return config
        -- return {DisplayAll=true, DisplaySwitchNames=true, TextColor=def_text_color, ControlsColor=def_ctrls_color, SAtext="", SBtext="", SCtext="", SDtext="", SEtext="", SFtext="", SGtext="", SHtext="", SItext="", SJtext="", SKtext="", SLtext="", LStext="", RStext="", S1text="", S2text="", S3text="", T1text="", T2text="", T3text="", T4text="", T5text="", T6text="", FS1text="", FS2text="", FS3text="", FS4text="", FS5text="", FS6text=""}
    end

end

local function wakeup(widget)
    local w, h = lcd.getWindowSize()
    -- load once the radio definition
    if not widget.radio and isWindowSizeSupported(sys.board, w, h) then
        widget.radio = loadRadioDefinition(sys.board, w, h)
        lcd.invalidate()
    end
    -- detects if layout has changed
    if w~= widget.windowW or h ~= widget.windowH then
        widget.windowW = w
        widget.windowH = h
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
    local widget_w, widget_h = lcd.getWindowSize()
    --print("widget_w:",widget_w)
    --print("widget_h:",widget_h)
    if not widget.radio then
        lcd.drawText( 0, 0, "Unsupported widget size, Full Screen only")
        return
    end

    if lcd.hasFocus() then
        -- show the focus through a border of 4px
        lcd.color(lcd.themeColor(THEME_DEFAULT_BGCOLOR))
        lcd.drawFilledRectangle(4, 4, widget_w - 8, widget_h -8)
    end

    lcd.font(FONT_S)
    if sys.simulation==true and debug_mode then
        lcd.color(lcd.themeColor(THEME_DEFAULT_COLOR))
        --lcd.drawText(1, widget.h-s_font_h,"Pos left:"..curposx.."    Pos high: "..curposh-s_font_h)
        lcd.drawText(1, 10,curposx..", "..curposy)
    end

    local _, vOffset = lcd.getTextSize("")
    local showPrefix = widget.DisplaySwitchNames
    local showAll = widget.DisplayAll
    local function addLegend(label, prefix, lines, align, offset)
        if showAll or label ~= "" then
            local x = lines[1][1]
            local y = lines[1][2]
            if not align and x < widget_w/2 then align = TEXT_LEFT end
            if not align and x >= widget_w/2 then align = TEXT_RIGHT end
            lcd.font(FONT_S_BOLD)
            local pw = lcd.getTextSize(prefix .." ")
            if showPrefix then
                if align == TEXT_RIGHT then
                    lcd.font(FONT_S_BOLD)
                    lcd.drawText(x, y - (offset and offset or vOffset), prefix, align)
                    lcd.font(FONT_S)
                    lcd.drawText(x - pw, y - (offset and offset or vOffset), label, align)
                elseif align == TEXT_CENTERED then
                    local lw = lcd.getTextSize(label) -- not UTF8 compatible on ethos < 1.7 but acceptable for one or two accentuated chars (slight misplacement)
                    lcd.font(FONT_S_BOLD)
                    lcd.drawText(x - pw/4 -lw/2, y - (offset and offset or vOffset), prefix, align)
                    lcd.font(FONT_S)
                    lcd.drawText(x + pw/2, y - (offset and offset or vOffset), label, align)
                else
                    lcd.font(FONT_S_BOLD)
                    lcd.drawText(x, y - (offset and offset or vOffset), prefix, align)
                    lcd.font(FONT_S)
                    lcd.drawText(x + pw, y - (offset and offset or vOffset), label, align)
                end
            else
                lcd.drawText(x, y - (offset and offset or vOffset), label, align)
            end
            for _,rect in pairs(lines) do
                lcd.pen(PEN_DASHED)
                lcd.drawLine(rect[1], rect[2], rect[3], rect[4])
                lcd.pen(PEN_SOLID)
            end
        end
    end

    for id, specs in pairs(widget.radio) do
        --print(string.format("%s: %s",id.."text", widget[id.."text"]))
        lcd.color(widget.TextColor)
        if specs["lines"] and widget[id.."text"] then addLegend(widget[id.."text"], id, specs["lines"], specs["align"], specs["offset"]) end
        lcd.color(widget.ControlsColor)
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
        if category == EVT_KEY then return false end
        curposx=x
        curposy=y
        lcd.invalidate()
        return true
    end
end

-- **************************************************************************************
-- ***		     configure widget	 	   		                                      ***
-- *** Clicking the widget configure option triggers this handler.                    ***
-- **************************************************************************************
--
local function configure(widget)
    -- State 1 text param
    local line = form.addLine(STR("DisplayAll"))
    form.addBooleanField(line, nil, function() return widget.DisplayAll end, function(value) widget.DisplayAll = value end)
    line = form.addLine(STR("DisplaySwitchNames"))
    form.addBooleanField(line, nil, function() return widget.DisplaySwitchNames end, function(value) widget.DisplaySwitchNames = value end)
    for _, k in pairs(radioSwitches) do
        if widget.radio and widget.radio[k]["lines"] then -- no lines means no legend or disabled switch
            line = form.addLine(STR(k.."text"))
            form.addTextField(line, nil, function() return widget[k.."text"] end, function(value) widget[k.."text"] = value end)
        end
    end
    line = form.addLine(STR("TextColor"))
    form.addColorField(line, nil, function() return widget.TextColor end, function(TextColor) widget.TextColor = TextColor end)
    line = form.addLine(STR("ControlsColor"))
    form.addColorField(line, nil, function() return widget.ControlsColor end, function(ControlsColor) widget.ControlsColor = ControlsColor end)
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
        local file_info = os.stat(file2..mname..".lua")
        if file_info then
            local ltab = assert(loadfile(file2..mname..".lua")())
            widget.DisplayAll=ltab.DisplayAll
            widget.DisplaySwitchNames=ltab.DisplaySwitchNames
            for _, key in pairs(radioSwitches) do
                widget[key.."text"] = ltab[key.."text"]
            end
            if debug_mode then print("SAtext = "..ltab.SAtext) end
            widget.TextColor=ltab.TextColor
            widget.ControlsColor=ltab.ControlsColor
            --if debug_mode then print ("read textcolor="..(widget.TextColor)) end -- debug
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
  if debug_mode then print("Writing config to file io storage") end
    -- write storage to sdcard
    local f = assert(io.open(file2..mname..".lua", "w"))
    io.write(f,"return {")
    --io.write(f,"\n   DisplayAll = " .. widget.DisplayAll .. ",\n")
    if widget.DisplayAll then io.write(f,"\n   DisplayAll = true,\n")
    else io.write(f,"\n   DisplayAll = false,\n") end
    --io.write(f,"\n   DisplaySwitchNames = ",widget.DisplaySwitchNames, ",\n")
    if widget.DisplaySwitchNames then io.write(f,"\n   DisplaySwitchNames = true,\n")
    else io.write(f,"\n   DisplaySwitchNames = false,\n") end
    for _, key in pairs(radioSwitches) do
        io.write(f,"\n   "..key.."text = \"",widget[key.."text"], "\",\n")
    end
    if debug_mode then print("SAtext = "..widget.SAtext) end
    --
    local tc = math.tointeger(widget.TextColor)
    local cc = math.tointeger(widget.ControlsColor)
    --print ("write textcolor="..(widget.TextColor)) -- debug
    --print ("write textcolor="..(tc)) -- debug
    io.write(f,"\n   TextColor = " .. widget.TextColor .. ",\n")
    io.write(f,"\n   ControlsColor = " .. widget.ControlsColor .. "\n")
    io.write(f,"}")
    --print ("write type textcolor="..type(tc)) -- debug
    --print ("write int textcolor="..(tc)) -- debug

    io.close(f)
---@diagnostic disable-next-line: cast-local-type
    f=nil

end

-- **************************************************************************************
-- ***		     init widget		 	   		                                      ***
-- This handler is called during the transmitter's boot process.                      ***
-- The transmitter makes a list of all Lua scripts with their unique                  ***
-- "keys" and their types (widget, systemTool, etc.)                                  ***
-- **************************************************************************************
--
local function init()
    --system.registerWidget({key="swmap", name=name, create=create, build=build, wakeup=wakeup, paint=paint, configure=configure, read=read, write=write, event=event, title=false})
    system.registerWidget({key="swmap", name=name, create=create, wakeup=wakeup, paint=paint, configure=configure, read=read, write=write, event=event, title=false})
    --bitmap1 = lcd.loadBitmap("/scripts/swmap/bitmaps/x20pro.bmp")
end


return {init=init}
