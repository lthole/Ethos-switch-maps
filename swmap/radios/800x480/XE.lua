-- swmap XE(S) definition for 800x480
-- T5/T6 vertical
-- 2026-03-29 reverse text direction for the switches to avoid early overlaps


--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- draw represents the drawing of controls type nil|function

return {
    ["S1"] = {
        ["lines"]={{5,90,125,90}},
        ["draw"]=function () drawPot(140,90, 15) end,
    },
    ["S2"] = {
        ["lines"]={{5,125,125,125}},
        ["draw"]=function () drawPot(140,125, 15) end,
    },
    ["S3"] = {
        ["lines"]={{795,90,675,90}},
        ["draw"]=function () drawPot(660,90, 15) end,
    },
    ["S4"] = {
        ["lines"]={{795,125,675,125}},
        ["draw"]=function () drawPot(660,125, 15) end,
    },
    ["L1"] = {
        ["lines"]={{390,313,300,313},{370,313,370,280}},
        ["draw"]=function () drawSlider(365,203,10,77) end,
        ["align"]=TEXT_RIGHT,
        ["offset"]= -2
    },
    ["L2"] = {
        ["lines"]={{410,313,500,313}, {430,313,430,280}},
        ["draw"]=function () drawSlider(425,203,10,77) end,
        ["align"]=TEXT_LEFT,
        ["offset"]= -2
    },
    ["SA"] = {
        ["lines"]={{5,64,180,64}, {180,64,190,78}},
        ["draw"]=function() drawButton3Pos(190,90,12) end,
    },
    ["SB"] = {
        ["lines"]={{218,64,390,64}, {238,64,238,78}},
        ["draw"]=function () drawButton2Pos(238, 90, 12) end,
    },
    ["SC"] = {
        ["lines"]={{390,94,298, 94}},
        ["draw"]=function () drawButtonSlot(286,90, 12) end,
        ["align"]=TEXT_RIGHT
    },
    ["SD"] = {
        ["lines"]={{5,152,180,152}, {180,152,190,139}},
        ["draw"]=function () drawButton3Pos(190,125, 12) end,
   },
    ["SE"] = {
        ["lines"]={{218,150,390,150}, {238,137,238,150}},
        ["draw"]=function () drawButton3Pos(238,125, 12) end,
        ["offset"]= -2
    },
    ["SF"] = {
        ["lines"]={{390,127,298, 127}},
        ["draw"]=function () drawButtonSlot(286, 125, 12) end,
        ["align"]=TEXT_RIGHT
    },
    ["SG"] = {
        ["lines"]={{410,94,502, 94}},
        ["draw"]=function () drawButtonSlot(514, 90, 12) end,
        ["align"]=TEXT_LEFT,
    },
    ["SH"] = {
        ["lines"]={{582,64,410,64}, {562,64,562,78}},
        ["draw"]=function () drawButton1Pos(562, 90, 12) end,
        ["align"]=TEXT_RIGHT
    },
    ["SI"] = {
        ["lines"]={{795,64,620,64}, {620,64,610,78}},
        ["draw"]=function () drawButton3Pos(610,90, 12) end,
    },
    ["SJ"] = {
        ["lines"]={{410,127,502,127}},
        ["draw"]=function () drawButtonSlot(514,125, 12) end,
        ["align"]=TEXT_LEFT,
    },
    ["SK"] = {
        ["lines"]={{582,150,410,150}, {562,137,562,150}},
        ["draw"]=function () drawButton3Pos(562,125, 12) end,
        ["offset"]= -2,
        ["align"]=TEXT_RIGHT
    },
    ["SL"] = {
        ["lines"]={{795,152,620,152}, {620,152,610,139}},
        ["draw"]=function () drawButton3Pos(610,125, 12) end,
    },
    ["SM"] = {
        ["lines"]={{5,265,234,265}},
        ["draw"]=function () drawButton1Pos(242, 265, 8) end,
    },
    ["SN"] = {
        ["lines"]={{795,265,566,265}},
        ["draw"]=function () drawButton1Pos(558, 265, 8) end,
    },
    ["SX"] = {
        ["lines"]={{5,241,229,241}},
        ["draw"]=function () drawButton3Pos(242,241, 12) end,
    },
    ["SY"] = {
        ["lines"]={{795,241,561,241}},
        ["draw"]=function () drawButton3Pos(558,241, 12) end,
    },
    ["FS1"] = {
        ["lines"]={{5,356,279,356}},
        ["draw"]=function() drawButton1Pos(280,356, 10) end
    },
    ["FS2"] = {
        ["lines"]={{5,380,279,380}},
        ["draw"]=function() drawButton1Pos(280,380, 10) end
    },
    ["FS3"] = {
        ["lines"]={{5,404,279,404}},
        ["draw"]=function() drawButton1Pos(280,404, 10) end
    },
    ["FS4"] = {
        ["lines"]={{795,356,520,356}},
        ["draw"]=function() drawButton1Pos(520,356, 10) end
    },
    ["FS5"] = {
        ["lines"]={{795,380,520,380}},
        ["draw"]=function() drawButton1Pos(520,380, 10) end
    },
    ["FS6"] = {
        ["lines"]={{795,404,520,404}},
        ["draw"]=function() drawButton1Pos(520,404, 10) end
    },
    ["LS"] = {
        ["lines"]={{5,209,133,209}},
        ["draw"]=function() drawCurvedSlider(178, 209, 34, 44, 230, 310) end
    },
    ["RS"] = {
        ["lines"]={{795,209,667,209}},
        ["draw"]=function() drawCurvedSlider(622, 209, 34, 44, 50, 130) end
    },
    ["T1"] = {
        ["lines"]={{795,332,578,332}},
        ["draw"]=function() drawTrim(538,325, 40, 16) end
    },
    ["T2"] = {
        ["lines"]={{795,289,494,289}, {494,289,469,264}},
        ["draw"]=function() drawTrim(453,227, 16, 40) end
    },
    ["T3"] = {
        ["lines"]={{5,289,306,289}, {306,289,330,264}},
        ["draw"]=function() drawTrim(331,227, 16, 40) end
    },
    ["T4"] = {
        ["lines"]={{5,332,222,332}},
        ["draw"]=function() drawTrim(222,325, 40, 16) end
    },
    ["T5"] = {
        ["lines"]={{5,177, 159,177}},
        ["draw"]=function() drawTrim(159,163, 12, 30) end
    },
    ["T6"] = {
        ["lines"]={{795,177,639,177}},
        ["draw"]=function() drawTrim(629,163, 12, 30) end
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(242,241, 65) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(558, 241, 65) end
    },
    -- ["TOP DISPLAY"]={
    --     ["draw"]=function() lcd.color(lcd.darkMode() and lcd.GREY(60) or lcd.GREY(180)) lcd.drawRectangle(330, 60, 140, 90, 5) end
    -- },
    -- ["MAIN DISPLAY"]={
    --     ["draw"]=function() lcd.color(lcd.darkMode() and lcd.GREY(60) or lcd.GREY(180)) lcd.drawRectangle(300, 320, 200, 120, 5) end
    -- },
}
