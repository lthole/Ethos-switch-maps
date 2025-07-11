-- **************************************************************************************
-- ***		   Switch Mapping Widget			                                      ***
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
-- ***		     widget	startup code      				                                      *** 
-- *** The code that is outside of the handlers will be executed on the 1st script    ***
-- *** load (radio start).                                                            ***       
-- **************************************************************************************

local version="0.5"
local debug_flag=false         --> for debug mode
local debug_mode=true
local curposx=0
local curposy=0
local SKandSL=false
local T5andT6=false
--local bitmap1
local def_text_color = lcd.RGB(0, 0xFF, 0xFF)
local def_ctrls_color = lcd.RGB(0xF8, 0xC0, 0x00)

local file ="SCRIPTS:/swmap/templates/template.lua"
local file2="SCRIPTS:/swmap/models/"
--local file2 = "/scripts/swmap/templates/template_used.txt"

-- Get information for Transmitter
local sys = system.getVersion()   	
local RADIO=sys.board


if string.sub(RADIO,1,6)=="X20PRO" then
	SKandSL=true
	T5andT6=true
else if string.sub(RADIO,1,4)=="X20R" then
	T5andT6=true
	end
end

--[[
-- *** Local functions

-- check for empty string
local function isempty(s)
	return s == nil or s == ""
end

-- read string from input file
local function readstring(s)
	if string.len(s) == 8 then -- note the len includes the eol char
		return ""
	else
		return string.sub(s, 8)
	end
end
]]-- 

--define function for retrieving translations from translation files 
local STR = assert(loadfile("i18n/i18n.lua"))().translate

-- **************************************************************************************
-- ***		     name widget					                                      *** 
-- **************************************************************************************
--[[
local translations = {en="Switch maps"}

local function name(widget)					-- name script, appears in widget selection list
  local locale = system.getLocale()
	 return translations[locale] or translations["en"]
end
]]--

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
	-- if debug_mode then print ("modelname=",mname) end

	-- check if template load file exists
  -- if it does, read switches config from it

	local file_info = os.stat(file)
	if file_info then
    if debug_mode then print("Reading config from table template file") end

		ltab = assert(loadfile(file)())
    if debug_mode then 
			print("DisplayAll=", ltab.DisplayAll)
			print("DisplaySwitchNames=", ltab.DisplaySwitch)
			print("SAtext=", ltab.SAtext)
			print("SBtext=", ltab.SBtext)
			print("SCtext=", ltab.SCtext)
			print("SDtext=", ltab.SDtext)
			print("SEtext=", ltab.SEtext)
			print("SFtext=", ltab.SFtext)
			print("SGtext=", ltab.SGtext)
			print("SHtext=", ltab.SHtext)
			print("SItext=", ltab.SItext)
			print("SJtext=", ltab.SJtext)
			print("T1text=", ltab.T1text)
			print("T2text=", ltab.T2text)
			print("T3text=", ltab.T3text)
			print("T4text=", ltab.T4text)
			print("LStext=", ltab.LStext)
			print("RStext=", ltab.RStext)
			print("S1text=", ltab.S1text)
			print("S2text=", ltab.S2text)
			print("S3text=", ltab.S3text)
			print("FS1text=", ltab.FS1text)
			print("FS2text=", ltab.FS2text)
			print("FS3text=", ltab.FS3text)
			print("FS4text=", ltab.FS4text)
			print("FS5text=", ltab.FS5text)
			print("FS6text=", ltab.FS6text)
			print("SKtext=", ltab.SKtext)
			print("SLtext=", ltab.SLtext)
			print("T5text=", ltab.T5text)
			print("T6text=", ltab.T6text)
			print("TextColor=", ltab.TextColor)
			print("ControlsColor=", ltab.ControlsColor)
		end


--[[
		-- now remove the template file to avoid loading it again
		result, message = os.remove(file)
		-- if file is removed
		if result then
			print("File deleted successfully.")
		else
			print("File deletion failed.", message)
		end 
]]--

		if not(ltab.TextColor) then
			ltab.TextColor = def_text_color end
		if not(ltab.ControlsColor) then
			ltab.ControlsColor = def_ctrls_color end

		return {DisplayAll=true, DisplaySwitchNames=true, TextColor=ltab.TextColor, ControlsColor=ltab.ControlsColor, SAtext=ltab.SAtext, SBtext=ltab.SBtext, SCtext=ltab.SCtext, SDtext=ltab.SDtext, SEtext=ltab.SEtext, SFtext=ltab.SFtext, SGtext=ltab.SGtext, SHtext=ltab.SHtext, SItext=ltab.SItext, SJtext=ltab.SJtext, SKtext=ltab.SKtext, SLtext=ltab.SLtext, LStext=ltab.LStext, RStext=ltab.RStext, S1text=ltab.S1text, S2text=ltab.S2text, S3text=ltab.S3text, T1text=ltab.T1text, T2text=ltab.T2text, T3text=ltab.T3text, T4text=ltab.T4text, T5text=ltab.T5text, T6text=ltab.T6text, FS1text=ltab.FS1text, FS2text=ltab.FS2text, FS3text=ltab.FS3text, FS4text=ltab.FS4text, FS5text=ltab.FS5text, FS6text=ltab.FS6text}

	else

		-- if debug_mode then print ("create type textcolor="..lcd.RGB(0, 0xFF, 0xFF)) end -- debug
		-- template load file does not exist
		return {DisplayAll=true, DisplaySwitchNames=true, TextColor=def_text_color, ControlsColor=def_ctrls_color, SAtext="", SBtext="", SCtext="", SDtext="", SEtext="", SFtext="", SGtext="", SHtext="", SItext="", SJtext="", SKtext="", SLtext="", LStext="", RStext="", S1text="", S2text="", S3text="", S3text="", T1text="", T2text="", T3text="", T4text="", T5text="", T6text="", FS1text="", FS2text="", FS3text="", FS4text="", FS5text="", FS6text=""}
	end

end

-- **************************************************************************************
-- ***		     "display handler"					                                  ***
-- *** The paint handler is responsible for graphical representations in a script,    ***
-- *** therefore only necessary in scripts that display something on the screen.      ***  
-- **************************************************************************************
--
local function paint(widget)
	local text_w
	local text_h
	local text_offset

	widget_w, widget_h = lcd.getWindowSize()
	--print("widget_w:",widget_w)
	--print("widget_h:",widget_h)
	if( widget_w ~= 800 or widget_h ~= 480 ) then
		lcd.drawText( 0, 0, "Unsupported widget size, Full Screen only")
		return
	end
	
	-- Demo of a mask
    --lcd.color( lcd.RGB(155, 155, 0) )
    --lcd.drawMask(150, 25, mask)
    --lcd.drawBitmap(1,1,bitmap1,widget_w,widget_h)   
    
	if sys.simulation==true and debug_mode==1 then 
    lcd.font(FONT_S)
    lcd.color(COLOR_WHITE)
    --lcd.drawText(1, widget.h-s_font_h,"Pos left:"..curposx.."    Pos high: "..curposh-s_font_h)
    lcd.drawText(1, 10,curposx..", "..curposy)
  end

	--lcd.color( lcd.RGB(0, 255, 255) )
  --lcd.color(WHITE)
  lcd.color(widget.TextColor)
	lcd.font(FONT_S)
	text_w, text_h = lcd.getTextSize("")
	text_offset = text_h

  -- lcd.drawText(10, 40, "Hello here!") -- debug

 ----LEFT SIDE------
	if widget.DisplayAll or widget.SAtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SA "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 185-text_offset, prefixtext .. widget.SAtext)
		lcd.drawLine(5,185,94,185)
		 lcd.drawLine(94,185,118,161)
	end 
	if widget.DisplayAll or widget.SBtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SB "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 137-text_offset, prefixtext .. widget.SBtext)
		lcd.drawLine(5,137,144,137)
		 lcd.drawLine(144,137,168,161)
	end

	if widget.DisplayAll or widget.SEtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SE "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 114-text_offset, prefixtext .. widget.SEtext)
		lcd.drawLine(5,113,145,113)
	end 
	
	if widget.DisplayAll or widget.SFtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SF "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 89-text_offset, prefixtext .. widget.SFtext)
		--lcd.drawLine(5,89,172,89) -- original position
		 --lcd.drawLine(172,89,196,113)
		lcd.drawLine(5,89,196,89)
	end
	if widget.DisplayAll or widget.SItext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SI "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 240-text_offset, prefixtext .. widget.SItext)
		lcd.drawLine(5,240,100,240)
	end 
	if 	SKandSL and (widget.DisplayAll or widget.SKtext ~= "") then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SK "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 161-text_offset, prefixtext .. widget.SKtext)
		lcd.drawLine(5,161,76,161)
	end 
	if widget.DisplayAll or widget.LStext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "LS "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 216-text_offset, prefixtext .. widget.LStext)
		lcd.drawLine(5,216,114,216)
		lcd.drawLine(114,216,138,240)
	end 
	if widget.DisplayAll or widget.T3text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "T3 "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 283-text_offset, prefixtext .. widget.T3text)
		lcd.drawLine(5,283,319,283)
		lcd.drawLine(319,283,338,264)
	end 
	if widget.DisplayAll or widget.T4text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "T4 "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 307-text_offset, prefixtext .. widget.T4text)
		lcd.drawLine(5,307,312,307)
		--lcd.drawLine(76,216,100,240)
	end 
	if T5andT6 and widget.DisplayAll or widget.T5text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "T5 "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 331-text_offset, prefixtext .. widget.T5text)
		lcd.drawLine(5,331,178,331)
		--lcd.drawLine(76,216,100,240)
	end 
	if widget.DisplayAll or widget.FS1text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "FS1 "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 356-text_offset, prefixtext .. widget.FS1text)
		lcd.drawLine(5,356,315,356)
		--lcd.drawLine(76,216,100,240)
	end 
	if widget.DisplayAll or widget.FS2text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "FS2 "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 380-text_offset, prefixtext .. widget.FS2text)
		lcd.drawLine(5,380,333,380)
		--lcd.drawLine(76,216,100,240)
	end 
	if widget.DisplayAll or widget.FS3text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "FS3 "
		else
			prefixtext = ""
		end

		lcd.drawText(5, 404-text_offset, prefixtext .. widget.FS3text)
		lcd.drawLine(5,404,315,404)
		--lcd.drawLine(76,216,100,240)
	end 
	
	if widget.DisplayAll or widget.S1text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "S1 "
		else
			prefixtext = ""
		end

		lcd.drawText(243, 89-text_offset, prefixtext .. widget.S1text)
		lcd.drawLine(243,89,384,89)
		 lcd.drawLine(353,89,353,160)
	end 

 ------RIGHT SIDE------
	if widget.DisplayAll or widget.SCtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SC "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 137-text_offset, prefixtext .. widget.SCtext, RIGHT)
		lcd.drawLine(795,137,656,137)
		 lcd.drawLine(656,137,632,161)
	end
	
	if widget.DisplayAll or widget.SDtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SD "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 185-text_offset, prefixtext .. widget.SDtext, RIGHT)
		lcd.drawLine(795,185,706,185)
		 lcd.drawLine(706,185,682,161)

	end
	
	if widget.DisplayAll or widget.SHtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SH "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 89-text_offset, prefixtext .. widget.SHtext, RIGHT)
		--lcd.drawLine(795,89,626,89) -- original position
		 --lcd.drawLine(626,89,602,113)
		lcd.drawLine(795,89,602,89)
	end
	
	if widget.DisplayAll or widget.SGtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SG "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 114-text_offset, prefixtext .. widget.SGtext, RIGHT)
		lcd.drawLine(795,113,656,113)
 
		end
	
	if widget.DisplayAll or widget.SJtext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SJ "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 240-text_offset, prefixtext .. widget.SJtext, RIGHT)
		lcd.drawLine(795,240,700,240)
	end 
	
	if 	SKandSL and (widget.DisplayAll or widget.SLtext ~= "") then
		if widget.DisplaySwitchNames == true then
			prefixtext = "SL "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 161-text_offset, prefixtext .. widget.SLtext, RIGHT)
		lcd.drawLine(795,161,734,161)
	end 

	if widget.DisplayAll or widget.RStext ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "RS "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 216-text_offset, prefixtext .. widget.RStext, RIGHT)
		lcd.drawLine(795,216,686,216)
		lcd.drawLine(686,216,662,240)

	end 
	if widget.DisplayAll or widget.T2text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "T2 "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 283-text_offset, prefixtext .. widget.T2text, RIGHT)
		lcd.drawLine(795,283,479,283)
		lcd.drawLine(479,283,460,264)
	end 
	
	if widget.DisplayAll or widget.T1text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "T1 "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 307-text_offset, prefixtext .. widget.T1text, RIGHT)
		lcd.drawLine(795,307,488,307)
		--lcd.drawLine(76,216,100,240)
	end 
	
	if T5andT6 and widget.DisplayAll or widget.T6text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "T6 "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 331-text_offset, prefixtext .. widget.T6text,  RIGHT)
		lcd.drawLine(795,331,622,331)
		--lcd.drawLine(76,216,100,240)
	end 
	
	if widget.DisplayAll or widget.FS4text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "FS4 "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 356-text_offset, prefixtext .. widget.FS4text, RIGHT)
		lcd.drawLine(795,356,485,356)
		--lcd.drawLine(76,216,100,240)
	end 
	
	if widget.DisplayAll or widget.FS5text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "FS5 "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 380-text_offset, prefixtext .. widget.FS5text, RIGHT)
		lcd.drawLine(795,380,467,380)
		--lcd.drawLine(76,216,100,240)
	end 
	
	if widget.DisplayAll or widget.FS6text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "FS6 "
		else
			prefixtext = ""
		end

		lcd.drawText(795, 404-text_offset, prefixtext .. widget.FS6text, RIGHT)
		lcd.drawLine(795,404,485,404)
		--lcd.drawLine(76,216,100,240)
	end 
	
	if widget.DisplayAll or widget.S2text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "S2 "
		else
			prefixtext = ""
		end

 		lcd.drawText(419, 89-text_offset, prefixtext .. widget.S2text)
		lcd.drawLine(419,89,560,89)
		 lcd.drawLine(449,89,449,160)

	end 
	
	if widget.DisplayAll or widget.S3text ~= "" then
		if widget.DisplaySwitchNames == true then
			prefixtext = "S3 "
		else
			prefixtext = ""
		end

		lcd.drawText(400, 430, prefixtext .. widget.S3text, CENTERED)
		lcd.drawLine(400,387,400,428)
		lcd.drawLine(340,428,460,428)
	end
	
 ------CONTROLS------
	-- draw the controls in a different colour
	--lcd.color( lcd.RGB(155, 100, 0) )
	--lcd.color( lcd.RGB(0xf8, 0xb0, 0x38) ) --f8b038
    lcd.color(widget.ControlsColor)
	-- draw LH gimbal 
	lcd.drawCircle(242,241, 74)
	lcd.drawCircle(242,241, 10)

	-- draw RH gimbal 
	lcd.drawCircle(559,241, 74)
	lcd.drawCircle(559,241, 10)

	-- Left side --
	-- draw SE
	lcd.drawCircle(145,113, 12)

	-- draw SF
	lcd.drawCircle(196,89, 12)

	-- draw SK
	if SKandSL then 
		lcd.drawCircle(77,161, 8)
	end

	-- draw SA
	lcd.drawCircle(118,161, 12)

	-- draw SB
	lcd.drawCircle(168,161, 12)

	-- draw Pot S1
	--lcd.drawCircle(353,161, 20)
	lcd.drawCircle(353,181, 20)

	-- draw SI switch
	lcd.drawCircle(100,240, 8)

	-- draw LS
	lcd.drawAnnulusSector(180,240, 43, 44, 230, 310)
	lcd.drawLine(130,240,146,240)

	-- draw FS1
	lcd.drawCircle(316,356, 10)

	-- draw FS2
	lcd.drawCircle(333,380, 10)

	-- draw FS3
	lcd.drawCircle(316,404, 10)

	-- draw T3
	lcd.drawRectangle(331,227, 16, 40)
	lcd.drawLine(331,247,346,247)

	-- draw T4
	--lcd.drawRectangle(304,298, 44, 18)
	--lcd.drawLine(326,298,326,315)
	lcd.drawRectangle(306,299, 40, 16)
	lcd.drawLine(326,299,326,314)

	-- draw T5
	if T5andT6 then 
		lcd.drawRectangle(174,312, 16, 40)
		lcd.drawLine(174,332,189,332)
	end

	-- Right side --
	-- draw SH
	lcd.drawCircle(602,89, 12)

	-- draw SG
	lcd.drawCircle(656,113, 12)

	-- draw SC
	lcd.drawCircle(632,161, 12)

	-- draw SD
	lcd.drawCircle(683,161, 12)

	-- draw SL
	if SKandSL then 
		lcd.drawCircle(734,161, 8)
	end

	-- draw Pot S2
	lcd.drawCircle(449,181, 20)

	-- draw RS
	lcd.drawAnnulusSector(618,240, 43, 44, 50, 130)
	lcd.drawLine(652,240,668,240)
	--lcd.drawAnnulusSector(141,246, 10)

	-- draw SJ
	lcd.drawCircle(700,240, 8)

	-- draw FS4
	lcd.drawCircle(485,356, 10)

	-- draw FS5
	lcd.drawCircle(467,380, 10)

	-- draw FS6
	lcd.drawCircle(485,404, 10)

	-- draw Pot S3
	lcd.drawLine(400,290,400,387)
	lcd.drawLine(390,340,410,340)

	-- draw T1
	lcd.drawRectangle(451,299, 40, 16)
	lcd.drawLine(471,299,471,314)

	-- draw T2
	lcd.drawRectangle(451,227, 16, 40)
	lcd.drawLine(451,247,466,247)

	-- draw T6
	if T5andT6 then 
		lcd.drawRectangle(605,312, 16, 40)
		lcd.drawLine(605,332,620,332)
	end
end

-- **************************************************************************************
-- ***		     "background loop"				                                      *** 
-- *** The wakeup handler is the general background handler for all kinds of tasks,   ***
-- *** including reading sources, their processing, and updating the central data.    ***
-- *** structure (principle: input, processing, output). It is generally called.      ***
-- *** around a dozen times per second. Another essential element is to decide        ***
-- *** whether the display (in the paint handler) needs updating. If so, the wakeup.  ***
-- *** handler triggers an update of the display using the method lcd.invalidate().   ***
-- **************************************************************************************
--
-- eakeup not needed, so remove
--[[
local function wakeup(widget)

    if lcd.isVisible()==false then
        return true
    end
end
]]--

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
	if sys.simulation==true and debug_mode==1 then 
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
	line = form.addLine(STR("SAtext"))
	form.addTextField(line, nil, function() return widget.SAtext end, function(value) widget.SAtext = value end)
	line = form.addLine(STR("SBtext"))
	form.addTextField(line, nil, function() return widget.SBtext end, function(value) widget.SBtext = value end)
	line = form.addLine(STR("SCtext"))
	form.addTextField(line, nil, function() return widget.SCtext end, function(value) widget.SCtext = value end)
	line = form.addLine(STR("SDtext"))
	form.addTextField(line, nil, function() return widget.SDtext end, function(value) widget.SDtext = value end)
	line = form.addLine(STR("SEtext"))
	form.addTextField(line, nil, function() return widget.SEtext end, function(value) widget.SEtext = value end)
	line = form.addLine(STR("SFtext"))
	form.addTextField(line, nil, function() return widget.SFtext end, function(value) widget.SFtext = value end)
	line = form.addLine(STR("SGtext"))
	form.addTextField(line, nil, function() return widget.SGtext end, function(value) widget.SGtext = value end)
	line = form.addLine(STR("SHtext"))
	form.addTextField(line, nil, function() return widget.SHtext end, function(value) widget.SHtext = value end)
	line = form.addLine(STR("SItext"))
	form.addTextField(line, nil, function() return widget.SItext end, function(value) widget.SItext = value end)
	line = form.addLine(STR("SJtext"))
	form.addTextField(line, nil, function() return widget.SJtext end, function(value) widget.SJtext = value end)
	if SKandSL then
		line = form.addLine(STR("SKtext"))
		form.addTextField(line, nil, function() return widget.SKtext end, function(value) widget.SKtext = value end)
		line = form.addLine(STR("SLtext"))
		form.addTextField(line, nil, function() return widget.SLtext end, function(value) widget.SLtext = value end)
	end
	line = form.addLine(STR("LStext"))
	form.addTextField(line, nil, function() return widget.LStext end, function(value) widget.LStext = value end)
	line = form.addLine(STR("RStext"))
	form.addTextField(line, nil, function() return widget.RStext end, function(value) widget.RStext = value end)
	line = form.addLine(STR("S1text"))
	form.addTextField(line, nil, function() return widget.S1text end, function(value) widget.S1text = value end)
	line = form.addLine(STR("S2text"))
	form.addTextField(line, nil, function() return widget.S2text end, function(value) widget.S2text = value end)
    line = form.addLine(STR("S3text"))
	form.addTextField(line, nil, function() return widget.S3text end, function(value) widget.S3text = value end)
    line = form.addLine(STR("T1text"))
	form.addTextField(line, nil, function() return widget.T1text end, function(value) widget.T1text = value end)
    line = form.addLine(STR("T2text"))
	form.addTextField(line, nil, function() return widget.T2text end, function(value) widget.T2text = value end)
    line = form.addLine(STR("T3text"))
	form.addTextField(line, nil, function() return widget.T3text end, function(value) widget.T3text = value end)
    line = form.addLine(STR("T4text"))
	form.addTextField(line, nil, function() return widget.T4text end, function(value) widget.T4text = value end)
	if T5andT6 then
		line = form.addLine(STR("T5text"))
		form.addTextField(line, nil, function() return widget.T5text end, function(value) widget.T5text = value end)
		line = form.addLine(STR("T6text"))
		form.addTextField(line, nil, function() return widget.T6text end, function(value) widget.T6text = value end)
	end
    line = form.addLine(STR("FS1text"))
	form.addTextField(line, nil, function() return widget.FS1text end, function(value) widget.FS1text = value end)
    line = form.addLine(STR("FS2text"))
	form.addTextField(line, nil, function() return widget.FS2text end, function(value) widget.FS2text = value end)
    line = form.addLine(STR("FS3text"))
	form.addTextField(line, nil, function() return widget.FS3text end, function(value) widget.FS3text = value end)
    line = form.addLine(STR("FS4text"))
	form.addTextField(line, nil, function() return widget.FS4text end, function(value) widget.FS4text = value end)
    line = form.addLine(STR("FS5text"))
	form.addTextField(line, nil, function() return widget.FS5text end, function(value) widget.FS5text = value end)
    line = form.addLine(STR("FS6text"))
	form.addTextField(line, nil, function() return widget.FS6text end, function(value) widget.FS6text = value end)
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
		local file_info = os.stat(file2..mname..".lua")
		if file_info then
			ltab = assert(loadfile(file2..mname..".lua")())
			widget.DisplayAll=ltab.DisplayAll
			widget.DisplaySwitchNames=ltab.DisplaySwitchNames
			widget.SAtext=ltab.SAtext
	    if debug_mode then print("SAtext = "..ltab.SAtext) end
			widget.SBtext=ltab.SBtext
			widget.SCtext=ltab.SCtext
			widget.SDtext=ltab.SDtext
			widget.SEtext=ltab.SEtext
			widget.SFtext=ltab.SFtext
			widget.SGtext=ltab.SGtext
			widget.SHtext=ltab.SHtext
			widget.SItext=ltab.SItext
			widget.SJtext=ltab.SJtext
			widget.T1text=ltab.T1text
			widget.T2text=ltab.T2text
			widget.T3text=ltab.T3text
			widget.T4text=ltab.T4text
			widget.LStext=ltab.LStext
			widget.RStext=ltab.RStext
			widget.S1text=ltab.S1text
			widget.S2text=ltab.S2text
			widget.S3text=ltab.S3text
			widget.FS1text=ltab.FS1text
			widget.FS2text=ltab.FS2text
			widget.FS3text=ltab.FS3text
			widget.FS4text=ltab.FS4text
			widget.FS5text=ltab.FS5text
			widget.FS6text=ltab.FS6text
			widget.SKtext=ltab.SKtext
			widget.SLtext=ltab.SLtext
			widget.T5text=ltab.T5text
			widget.T6text=ltab.T6text
			widget.TextColor=ltab.TextColor
			widget.ControlsColor=ltab.ControlsColor
		--io.close()    
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
	io.write(f,"\n   SAtext = \"",widget.SAtext, "\",\n")
	if debug_mode then print("SAtext = "..widget.SAtext) end
	io.write(f,"\n   SBtext = \"",widget.SBtext, "\",\n")
	io.write(f,"\n   SCtext = \"",widget.SCtext, "\",\n")
	io.write(f,"\n   SDtext = \"",widget.SDtext, "\",\n")
	io.write(f,"\n   SEtext = \"",widget.SEtext, "\",\n")
	io.write(f,"\n   SFtext = \"",widget.SFtext, "\",\n")
	io.write(f,"\n   SGtext = \"",widget.SGtext, "\",\n")
	io.write(f,"\n   SHtext = \"",widget.SHtext, "\",\n")
	io.write(f,"\n   SItext = \"",widget.SItext, "\",\n")
	io.write(f,"\n   SJtext = \"",widget.SJtext, "\",\n")
	io.write(f,"\n   T1text = \"",widget.T1text, "\",\n")
	io.write(f,"\n   T2text = \"",widget.T2text, "\",\n")
	io.write(f,"\n   T3text = \"",widget.T3text, "\",\n")
	io.write(f,"\n   T4text = \"",widget.T4text, "\",\n")
	io.write(f,"\n   LStext = \"",widget.LStext, "\",\n")
	io.write(f,"\n   RStext = \"",widget.RStext, "\",\n")
	io.write(f,"\n   S1text = \"",widget.S1text, "\",\n")
	io.write(f,"\n   S2text = \"",widget.S2text, "\",\n")
	io.write(f,"\n   S3text = \"",widget.S3text, "\",\n")
	io.write(f,"\n   FS1text = \"",widget.FS1text, "\",\n")
	io.write(f,"\n   FS2text = \"",widget.FS2text, "\",\n")
	io.write(f,"\n   FS3text = \"",widget.FS3text, "\",\n")
	io.write(f,"\n   FS4text = \"",widget.FS4text, "\",\n")
	io.write(f,"\n   FS5text = \"",widget.FS5text, "\",\n")
	io.write(f,"\n   FS6text = \"",widget.FS6text, "\",\n")
	-- X20 Pro
	io.write(f,"\n   SKtext = \"",widget.SKtext, "\",\n")
	io.write(f,"\n   SLtext = \"",widget.SLtext, "\",\n")
	io.write(f,"\n   T5text = \"",widget.T5text, "\",\n")
	io.write(f,"\n   T6text = \"",widget.T6text, "\",\n")
	--
  local tc = math.tointeger(widget.TextColor)
	local cc = math.tointeger(widget.ControlsColor)
	--print ("write textcolor="..(widget.TextColor)) -- debug
	--print ("write textcolor="..(tc)) -- debug
	io.write(f,"\n   TextColor = " .. tc .. ",\n")
  io.write(f,"\n   ControlsColor = " .. cc .. "\n")
  io.write(f,"}")
	--print ("write type textcolor="..type(tc)) -- debug
	--print ("write int textcolor="..(tc)) -- debug

  io.close(f)    
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
    system.registerWidget({key="swmap", name=name, create=create, build=build, paint=paint, configure=configure, read=read, write=write, event=event, title=false})
	--bitmap1 = lcd.loadBitmap("/scripts/swmap/bitmaps/x20pro.bmp")
end


return {init=init}