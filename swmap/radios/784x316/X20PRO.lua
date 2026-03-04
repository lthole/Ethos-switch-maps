-- swmap X20PRO definition for 784x316
-- T5/T6 vertical
-- SK/SL

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- draw represents the drawing of controls type nil|function

return {
        ["S1"] = {
        ["lines"]={{384, 42, 264, 42}, {353, 42, 353, 90}},
        ["draw"]=function () drawPot(353, 111, 20) end,
        ["align"]=TEXT_RIGHT
    },
        ["S2"] = {
        ["lines"]={{400, 42, 520, 42}, {431, 42, 431, 90}},
        ["draw"]=function () drawPot(431, 111, 20) end,
        ["align"]=TEXT_LEFT
    },
        ["S3"] = {
        ["lines"]={{392, 215, 435, 215},{349, 215, 392, 215}, {392, 215, 392, 219}},
        ["draw"]=function () drawSlider(387, 220, 10, 97) end,
        ["align"]=TEXT_CENTERED
    },
        ["SA"] = {
        ["lines"]={{5, 117, 177, 117}, {177, 117, 196, 91}},
        ["draw"]=function() drawButton3Pos(195, 80, 12) end,
    },
        ["SB"] = {
        ["lines"]={{5, 65, 233, 65}, {233, 65, 240, 80}},
        ["draw"]=function () drawButton3Pos(252, 80, 12) end,
    },
        ["SC"] = {
        ["lines"]={{779, 65, 551, 65}, {551, 65, 544, 80}},
        ["draw"]=function () drawButton3Pos(532, 80, 12) end,
    },
        ["SD"] = {
        ["lines"]={{779, 117, 607, 117}, {607, 117, 588, 91}},
        ["draw"]=function () drawButton3Pos(589, 80, 12) end,
    },
        ["SE"] = {
        ["lines"]={{5, 42, 209, 42}},
        ["draw"]=function () drawButton3Pos(220, 48, 12) end,
    },
        ["SF"] = {
        ["lines"]={{5, 19, 236, 19}},
        ["draw"]=function () drawButton2Pos(248, 19, 12) end,
    },
        ["SG"] = {
        ["lines"]={{779, 42, 575, 42}},
        ["draw"]=function () drawButton3Pos(564, 48, 12) end,
    },
        ["SH"] = {
        ["lines"]={{779, 19, 548, 19}},
        ["draw"]=function () drawButton2Pos(536, 19, 12) end,
    },
        ["SI"] = {
        ["lines"]={{5, 170, 111, 170}},
        ["draw"]=function () drawButton1Pos(111, 170, 8) end,
    },
        ["SJ"] = {
        ["lines"]={{779, 170, 673, 170}},
        ["draw"]=function () drawButton1Pos(673, 170, 8) end,
    },
        ["SK"] = {
        ["lines"]={{5, 88, 103, 88}},
        ["draw"]=function () drawButton2Pos(111, 85, 8) end,
    },
        ["SL"] = {
        ["lines"]={{779, 88, 681, 88}},
        ["draw"]=function () drawButton2Pos(673, 85, 8) end,
    },
        ["FS1"] = {
        ["lines"]={{5, 266, 315, 266}},
        ["draw"]=function() drawButton1Pos(316, 266, 10) end
    },
        ["FS2"] = {
        ["lines"]={{5, 290, 333, 290}},
        ["draw"]=function() drawButton1Pos(333, 290, 10) end
    },
        ["FS3"] = {
        ["lines"]={{5, 313, 315, 313}},
        ["draw"]=function() drawButton1Pos(316, 313, 10) end
    },
        ["FS4"] = {
        ["lines"]={{780, 266, 470, 266}},
        ["draw"]=function() drawButton1Pos(470, 266, 10) end
    },
        ["FS5"] = {
        ["lines"]={{780, 290, 452, 290}},
        ["draw"]=function() drawButton1Pos(452, 290, 10) end
    },
        ["FS6"] = {
        ["lines"]={{780, 313, 470, 313}},
        ["draw"]=function() drawButton1Pos(470, 313, 10) end
    },
        ["LS"] = {
        ["lines"]={{5, 144, 114, 144}, {114, 144, 138, 166}},
        ["draw"]=function() drawCurvedSlider(180, 170, 34, 44, 230, 310) end
    },
        ["RS"] = {
        ["lines"]={{779, 144, 670, 144}, {670, 144, 646, 166}},
        ["draw"]=function() drawCurvedSlider(604, 170, 34, 44, 50, 130) end
    },
        ["T1"] = {
        ["lines"]={{780, 217, 473, 217},{473, 217, 456, 236}},
        ["draw"]=function() drawTrim(436, 229, 40, 16) end
    },
        ["T2"] = {
        ["lines"]={{779, 195, 465, 195}, {465, 195, 446, 174}},
        ["draw"]=function() drawTrim(437, 157, 16, 40) end
    },
        ["T3"] = {
        ["lines"]={{5, 195, 319, 195}, {319, 195, 338, 174}},
        ["draw"]=function() drawTrim(331, 157, 16, 40) end
    },
        ["T4"] = {
        ["lines"]={{5, 217, 312, 217},{312,217,326,236}},
        ["draw"]=function() drawTrim(306, 229, 40, 16) end
    },
        ["T5"] = {
        ["lines"]={{5, 241, 178, 241}},
        ["draw"]=function() drawTrim(174, 242, 16, 40) end
    },
        ["T6"] = {
        ["lines"]={{780, 241, 607, 241}},
        ["draw"]=function() drawTrim(590, 242, 16, 40) end
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(242, 171, 74) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(544, 171, 74)  end
    },
}
