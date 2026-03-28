-- swmap XE(S) definition for 800x480
-- T5/T6 vertical


--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- draw represents the drawing of controls type nil|function

return {
    ["S1"] = {
        ["lines"]={{5,90,115,90}},
        ["draw"]=function () drawPot(130,90, 15) end,
    },
    ["S2"] = {
        ["lines"]={{5,125,115,125}},
        ["draw"]=function () drawPot(130,125, 15) end,
    },
    ["S3"] = {
        ["lines"]={{795,90,685,90}},
        ["draw"]=function () drawPot(670,90, 15) end,
    },
    ["S4"] = {
        ["lines"]={{795,125,685,125}},
        ["draw"]=function () drawPot(670,125, 15) end,
    },
    ["L1"] = {
        ["lines"]={{300,190,390,190},{370,190,370,203}},
        ["draw"]=function () drawSlider(365,203,10,77) end,
    },
    ["L2"] = {
        ["lines"]={{500,190,410,190}, {430,190,430,203}},
        ["draw"]=function () drawSlider(425,203,10,77) end,
    },
    ["SA"] = {
        ["lines"]={{130,68,210,68}, {190,68,190,78}},
        ["draw"]=function() drawButton3Pos(190,90,12) end,
    },
    ["SB"] = {
        ["lines"]={{298,68,218,68}, {238,68,238,78}},
        ["draw"]=function () drawButton2Pos(238, 90, 12) end,
        ["align"]=TEXT_RIGHT
    },
    ["SC"] = {
        ["draw"]=function () lcd.color(ORANGE) lcd.drawCircle(286,90, 12) end,
    },
    ["SD"] = {
        ["lines"]={{130,145,210,145}, {190,137,190,145}},
        ["draw"]=function () drawButton3Pos(190,125, 12) end,
        ["offset"]= -2,
        ["align"]=TEXT_LEFT
   },
    ["SE"] = {
        ["lines"]={{298,145,218,145}, {238,137,238,145}},
        ["draw"]=function () drawButton3Pos(238,125, 12) end,
        ["offset"]= -2,
        ["align"]=TEXT_RIGHT
    },
    ["SF"] = {
        ["draw"]=function () lcd.color(ORANGE) lcd.drawCircle(286, 125, 12) end,
    },
    ["SG"] = {
        ["draw"]=function () lcd.color(ORANGE) lcd.drawCircle(514, 90, 12) end,
    },
    ["SH"] = {
        ["lines"]={{502,68,582,68}, {562,68,562,78}},
        ["draw"]=function () drawButton1Pos(562, 90, 12) end,
        ["align"]=TEXT_LEFT
    },
    ["SI"] = {
        ["lines"]={{670,68,590,68}, {610,68,610,78}},
        ["draw"]=function () drawButton3Pos(610,90, 12) end,
        ["align"]=TEXT_RIGHT
    },
    ["SJ"] = {
        ["draw"]=function () lcd.color(ORANGE) lcd.drawCircle(514,125, 12) end,
    },
    ["SK"] = {
        ["lines"]={{502,145,582,145}, {562,137,562,145}},
        ["draw"]=function () drawButton3Pos(562,125, 12) end,
        ["offset"]= -2,
        ["align"]=TEXT_LEFT
    },
    ["SL"] = {
        ["lines"]={{670,145,590,145}, {610,137,610,145}},
        ["draw"]=function () drawButton3Pos(610,125, 12) end,
        ["offset"]= -2,
        ["align"]=TEXT_RIGHT
    },
    ["FS1"] = {
        ["lines"]={{5,356,269,356}},
        ["draw"]=function() drawButton1Pos(270,356, 10) end
    },
    ["FS2"] = {
        ["lines"]={{5,380,269,380}},
        ["draw"]=function() drawButton1Pos(270,380, 10) end
    },
    ["FS3"] = {
        ["lines"]={{5,404,269,404}},
        ["draw"]=function() drawButton1Pos(270,404, 10) end
    },
    ["FS4"] = {
        ["lines"]={{795,356,530,356}},
        ["draw"]=function() drawButton1Pos(530,356, 10) end
    },
    ["FS5"] = {
        ["lines"]={{795,380,530,380}},
        ["draw"]=function() drawButton1Pos(530,380, 10) end
    },
    ["FS6"] = {
        ["lines"]={{795,404,530,404}},
        ["draw"]=function() drawButton1Pos(530,404, 10) end
    },
    ["LS"] = {
        ["lines"]={{5,205,105,205}},
        ["draw"]=function() drawCurvedSlider(150, 205, 34, 44, 230, 310) end
    },
    ["RS"] = {
        ["lines"]={{795,205,695,205}},
        ["draw"]=function() drawCurvedSlider(650, 205, 34, 44, 50, 130) end
    },
    ["T1"] = {
        ["lines"]={{795,308,617,308}, {599,325,617,308}},
        ["draw"]=function() drawTrim(559,325, 40, 16) end
    },
    ["T2"] = {
        ["lines"]={{795,283,479,283}, {479,283,460,264}},
        ["draw"]=function() drawTrim(451,227, 16, 40) end
    },
    ["T3"] = {
        ["lines"]={{5,283,319,283}, {319,283,338,264}},
        ["draw"]=function() drawTrim(331,227, 16, 40) end
    },
    ["T4"] = {
        ["lines"]={{5,308,185,308}, {185,308,202,325}},
        ["draw"]=function() drawTrim(202,325, 40, 16) end
    },
    ["T5"] = {
        ["lines"]={{5,255,113,255}, {113,255,143,225}},
        ["draw"]=function() drawTrim(135,185, 16, 40) end
    },
    ["T6"] = {
        ["lines"]={{795,255,687,255}, {657,225,687,255}},
        ["draw"]=function() drawTrim(649,185, 16, 40) end
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(242,241, 65) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(559, 241, 65) end
    },
    ["TOP DISPLAY"]={
        ["draw"]=function() lcd.color(ORANGE) lcd.drawRectangle(330, 60, 140, 90, 5) end
    },
    ["MAIN DISPLAY"]={
        ["draw"]=function() lcd.color(ORANGE) lcd.drawRectangle(290, 310, 220, 140, 5) end
    },
}
