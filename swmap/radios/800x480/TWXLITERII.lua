-- swmap TWXLITE RII definition for 800x480

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- draw represents the drawing of controls type nil|function

return {
    ["S1"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["S2"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["S3"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["SA"] = {
        ["lines"]={{5,149,230,149}},
        ["draw"]=function() drawButton3Pos(242,149,12) end,
    },
    ["SB"] = {
        ["lines"]={{795,149,570,149}},
        ["draw"]=function () drawButton3Pos(558,149, 12) end,
    },
    ["SC"] = {
        ["lines"]={{5,89,206,89}},
        ["draw"]=function () drawButton2Pos(218, 89, 12) end,
    },
    ["SD"] = {
        ["lines"]={{795,89,594,89}},
        ["draw"]=function () drawButton2Pos(582, 89, 12) end,
    },
    ["SE"] = {
        ["lines"]={{5,119,225,119}},
        ["draw"]=function () drawButton1Pos(235,119, 10) end,
    },
    ["SF"] = {
        ["lines"]={{795,119,575,119}},
        ["draw"]=function () drawButton1Pos(565, 119, 10) end,
    },
    ["SG"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["SH"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["SI"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["SJ"] = {
        ["lines"]=nil,
        ["draw"]=nil,
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
        ["lines"]={{5,356,342,356}},
        ["draw"]=function() drawButton1Pos(352,356, 10) end
    },
    ["FS2"] = {
        ["lines"]={{5,380,370,380},{370,380,384,367}},
        ["draw"]=function() drawButton1Pos(384,356, 10) end
    },
    ["FS3"] = {
        ["lines"]={{795,380,430,380}, {430,380,416,367}},
        ["draw"]=function() drawButton1Pos(416,356, 10) end
    },
    ["FS4"] = {
        ["lines"]={{795,356,458,356}},
        ["draw"]=function() drawButton1Pos(448,356, 10) end
    },
    ["FS5"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["FS6"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
    ["LS"] = {
        ["lines"]={{5,179,255,179}, {255,179,316,118}},
        ["draw"]=function() drawCurvedSlider(327, 146, 34, 44, 320, 40) end
    },
    ["RS"] = {
        ["lines"]={{795,179,545,179}, {545,179,484,118}},
        ["draw"]=function() drawCurvedSlider(473, 146, 34, 44, 320, 40) end
    },
    ["T1"] = {
        ["lines"]={{795,256,481,256}},
        ["draw"]=function() drawTrim(451,250, 30, 12) end
    },
    ["T2"] = {
        ["lines"]={{795,283,448,283}, {448,283,432,270}},
        ["draw"]=function() drawTrim(420,239, 12, 30) end
    },
    ["T3"] = {
        ["lines"]={{5,283,352,283}, {352,283,368,270}},
        ["draw"]=function() drawTrim(368,239, 12, 30) end
    },
    ["T4"] = {
        ["lines"]={{5,256,319,256}},
        ["draw"]=function() drawTrim(319,250, 30, 12) end
    },
    ["T5"] = {
        ["lines"]={{5,310,320,310}},
        ["draw"]=function() drawTrim(320,300, 40, 16) end
    },
    ["T6"] = {
        ["lines"]={{795,310,480,310}},
        ["draw"]=function() drawTrim(440,300, 40, 16) end
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(242,241, 54) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(559, 241, 54) end
    },
}
