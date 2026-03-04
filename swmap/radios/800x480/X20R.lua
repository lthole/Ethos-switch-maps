-- swmap X20R/X20RS definition for 800x480
-- T5/T6 horizontal
-- no SK/SL

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- draw represents the drawing of controls type nil|function

return {
    ["S1"] = {
        ["lines"]={{384, 111, 264, 111}, {353,111,353,160}},
        ["draw"]=function () drawPot(353,181, 20) end,
        ["align"]=TEXT_RIGHT
    },
    ["S2"] = {
        ["lines"]={{416, 111, 536, 111}, {447,111,447,160}},
        ["draw"]=function () drawPot(447,181, 20) end,
        ["align"]=TEXT_LEFT
    },
    ["S3"] = {
        ["lines"]={{400, 412, 460,412},{400,387,400,412}, {340,412,440,412}},
        ["draw"]=function () drawSlider(395,290,10,97) end,
        ["offset"]= -2,
        ["align"]=TEXT_CENTERED
    },
    ["SA"] = {
        ["lines"]={{5,185,177,185}, {177,185,195,163}},
        ["draw"]=function() drawButton3Pos(195,150,12) end,
    },
    ["SB"] = {
        ["lines"]={{5,132,233,132}, {233,132,240,145}},
        ["draw"]=function () drawButton3Pos(252, 150, 12) end,
    },
    ["SC"] = {
        ["lines"]={{795,132,567,132}, {567,132,560,145}},
        ["draw"]=function () drawButton3Pos(548,150, 12) end,
    },
    ["SD"] = {
        ["lines"]={{795,185,623,185}, {623,185,605,163}},
        ["draw"]=function () drawButton3Pos(605,150, 12) end,
    },
    ["SE"] = {
        ["lines"]={{5,111,209,111}},
        ["draw"]=function () drawButton3Pos(220,116, 12) end,
    },
    ["SF"] = {
        ["lines"]={{5,89,236,89}},
        ["draw"]=function () drawButton2Pos(248, 89, 12) end,
    },
    ["SG"] = {
        ["lines"]={{795,111,591,111}},
        ["draw"]=function () drawButton3Pos(580, 116, 12) end,
    },
    ["SH"] = {
        ["lines"]={{795,89,564,89}},
        ["draw"]=function () drawButton2Pos(552, 89, 12) end,
    },
    ["SI"] = {
        ["lines"]={{5,240,111,240}},
        ["draw"]=function () drawButton1Pos(111,240, 8) end,
    },
    ["SJ"] = {
        ["lines"]={{795,240,689,240}},
        ["draw"]=function () drawButton1Pos(689,240, 8) end,
    },
    ["SK"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["SL"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["FS1"] = {
        ["lines"]={{5,356,315,356}},
        ["draw"]=function() drawButton1Pos(316,356, 10) end
    },
    ["FS2"] = {
        ["lines"]={{5,380,333,380}},
        ["draw"]=function() drawButton1Pos(333,380, 10) end
    },
    ["FS3"] = {
        ["lines"]={{5,404,315,404}},
        ["draw"]=function() drawButton1Pos(316,404, 10) end
    },
    ["FS4"] = {
        ["lines"]={{795,356,485,356}},
        ["draw"]=function() drawButton1Pos(485,356, 10) end
    },
    ["FS5"] = {
        ["lines"]={{795,380,467,380}},
        ["draw"]=function() drawButton1Pos(467,380, 10) end
    },
    ["FS6"] = {
        ["lines"]={{795,404,485,404}},
        ["draw"]=function() drawButton1Pos(485,404, 10) end
    },
    ["LS"] = {
        ["lines"]={{5,216,114,216}, {114,216,138,240}},
        ["draw"]=function() drawCurvedSlider(180, 240, 34, 44, 230, 310) end
    },
    ["RS"] = {
        ["lines"]={{795,216,686,216}, {686,216,662,240}},
        ["draw"]=function() drawCurvedSlider(618, 240, 34, 44, 50, 130) end
    },
    ["T1"] = {
        ["lines"]={{795,335,576,335}},
        ["draw"]=function() drawTrim(539,327, 40, 16) end
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
        ["lines"]={{5,335,224,335}},
        ["draw"]=function() drawTrim(222,327, 40, 16) end
    },
    ["T5"] = {
        ["lines"]={{5,307,298,307}, {298,307,306,314}},
        ["draw"]=function() drawTrim(306,309, 40, 16) end
    },
    ["T6"] = {
        ["lines"]={{795,307,502,307}, {502,307,494,314}},
        ["draw"]=function() drawTrim(454,309, 40, 16) end
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(242,241, 74) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(559, 241, 74) end
    },
}
