-- swmap TWXLITE RII definition for 784x316

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
        ["lines"]={{5,77,222,77}},
        ["draw"]=function() drawButton3Pos(234,77,12) end,
    },
    ["SB"] = {
        ["lines"]={{779,77,562,77}},
        ["draw"]=function () drawButton3Pos(550,77, 12) end,
    },
    ["SC"] = {
        ["lines"]={{5,17,198,17}},
        ["draw"]=function () drawButton2Pos(210, 17, 12) end,
    },
    ["SD"] = {
        ["lines"]={{779,17,586,17}},
        ["draw"]=function () drawButton2Pos(574, 17, 12) end,
    },
    ["SE"] = {
        ["lines"]={{5,47,217,47}},
        ["draw"]=function () drawButton1Pos(227,47, 10) end,
    },
    ["SF"] = {
        ["lines"]={{779,47,567,47}},
        ["draw"]=function () drawButton1Pos(557, 47, 10) end,
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
        ["lines"]={{5,284,334,284}},
        ["draw"]=function() drawButton1Pos(344,284, 10) end
    },
    ["FS2"] = {
        ["lines"]={{5,308,362,308},{362,308,376,295}},
        ["draw"]=function() drawButton1Pos(376,284, 10) end
    },
    ["FS3"] = {
        ["lines"]={{779,308,422,308}, {422,308,408,295}},
        ["draw"]=function() drawButton1Pos(408,284, 10) end
    },
    ["FS4"] = {
        ["lines"]={{779,284,450,284}},
        ["draw"]=function() drawButton1Pos(440,284, 10) end
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
        ["lines"]={{5,107,248,107}, {248,107,308,46}},
        ["draw"]=function() drawCurvedSlider(319, 74, 34, 44, 320, 40) end
    },
    ["RS"] = {
        ["lines"]={{779,107,536,107}, {536,107,476,46}},
        ["draw"]=function() drawCurvedSlider(465, 74, 34, 44, 320, 40) end
    },
    ["T1"] = {
        ["lines"]={{779,184,473,184}},
        ["draw"]=function() drawTrim(443,178, 30, 12) end
    },
    ["T2"] = {
        ["lines"]={{779,211,440,211}, {440,211,424,198}},
        ["draw"]=function() drawTrim(412,167, 12, 30) end
    },
    ["T3"] = {
        ["lines"]={{5,211,344,211}, {344,211,360,198}},
        ["draw"]=function() drawTrim(360,167, 12, 30) end
    },
    ["T4"] = {
        ["lines"]={{5,184,311,184}},
        ["draw"]=function() drawTrim(311,178, 30, 12) end
    },
    ["T5"] = {
        ["lines"]={{5,238,312,238}},
        ["draw"]=function() drawTrim(312,228, 40, 16) end
    },
    ["T6"] = {
        ["lines"]={{779,238,472,238}},
        ["draw"]=function() drawTrim(432,228, 40, 16) end
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(234,169, 54) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(550, 169, 54) end
    },
}
