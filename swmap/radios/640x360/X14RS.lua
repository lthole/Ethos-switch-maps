-- swmap X14RS definition for 640x360

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- draw represents the drawing of controls type nil|function

return {
        ["S1"] = {
        ["lines"]={{317, 50, 178, 50}, {290, 50, 290, 110}},
        ["draw"]=function () drawPot(290, 131, 14) end,
        ["align"]=TEXT_RIGHT
    },
        ["S2"] = {
        ["lines"]={{326, 50, 459, 50}, {350, 50, 350, 110}},
        ["draw"]=function () drawPot(350, 131, 14) end,
        ["align"]=TEXT_LEFT
    },
        ["S3"] = {
        ["lines"]=nil,
        ["draw"]=nil,
    },
        ["SA"] = {
        ["lines"]={{5, 121, 177, 121}, {177, 121, 183, 118}},
        ["draw"]=function() drawButton3Pos(195, 112, 12) end,
    },
        ["SB"] = {
        ["lines"]={{5, 97, 233, 97}, {233, 97, 240, 112}},
        ["draw"]=function () drawButton3Pos(252, 112, 12) end,
    },
        ["SC"] = {
        ["lines"]={{635, 97, 407, 97}, {407, 97, 400, 112}},
        ["draw"]=function () drawButton3Pos(388, 112, 12) end,
    },
        ["SD"] = {
        ["lines"]={{635, 121, 463, 121}, {463, 121, 457, 118}},
        ["draw"]=function () drawButton3Pos(445, 112, 12) end,
    },
        ["SE"] = {
        ["lines"]={{5, 74, 209, 74}},
        ["draw"]=function () drawButton2Pos(220, 80, 12) end,
    },
        ["SF"] = {
        ["lines"]={{635, 74, 431, 74}},
        ["draw"]=function () drawButton2Pos(420, 80, 12) end,
    },
        ["SG"] = {
        ["lines"]={{5, 188, 118, 188}},
        ["draw"]=function () drawButton1Pos(126, 188, 8) end,
    },
        ["SH"] = {
        ["lines"]={{635, 188, 522, 188}},
        ["draw"]=function () drawButton1Pos(514, 188, 8) end,
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
        ["lines"]={{5, 284, 250, 284}},
        ["draw"]=function() drawButton1Pos(260, 290, 10) end
    },
        ["FS2"] = {
        ["lines"]={{5, 308, 290, 308},{290, 308, 300, 300}},
        ["draw"]=function() drawButton1Pos(300, 290, 10) end
    },
        ["FS3"] = {
        ["lines"]={{635, 308, 350, 308},{350, 308, 340, 300}},
        ["draw"]=function() drawButton1Pos(340, 290, 10) end
    },
        ["FS4"] = {
        ["lines"]={{635, 284, 390, 284}},
        ["draw"]=function() drawButton1Pos(380, 290, 10) end
    },
        ["FS5"] = {
        ["lines"]=nil,
        ["draw"]=nil
    },
        ["FS6"] = {
        ["lines"]=nil,
        ["draw"]=nil
    },
        ["LS"] = {
        ["lines"]={{5, 212, 145, 212}},
        ["draw"]=function() drawCurvedSlider(186, 191, 34, 44, 230, 310) end
    },
        ["RS"] = {
        ["lines"]={{635, 212, 495, 212}},
        ["draw"]=function() drawCurvedSlider(454, 191, 34, 44, 50, 130) end
    },
        ["T1"] = {
        ["lines"]={{635, 260, 448, 260}},
        ["draw"]=function() drawTrim(404, 252, 40, 16) end
    },
        ["T2"] = {
        ["lines"]={{635, 236, 388, 236}, {388, 236, 369, 217}},
        ["draw"]=function() drawTrim(353, 177, 16, 40) end
    },
        ["T3"] = {
        ["lines"]={{5, 236, 252, 236}, {252, 236, 271, 217}},
        ["draw"]=function() drawTrim(271, 177, 16, 40) end
    },
        ["T4"] = {
        ["lines"]={{5, 260, 192, 260}},
        ["draw"]=function() drawTrim(192, 252, 40, 16) end
    },
        ["T5"] = {
        ["lines"]=nil,
        ["draw"]=nil
    },
        ["T6"] = {
        ["lines"]=nil,
        ["draw"]=nil
    },
    ["LH STICK"]={
        ["draw"]=function() drawStick(212, 191, 44) end
    },
    ["RH STICK"]={
        ["draw"]=function() drawStick(428, 191, 44)  end
    },
}
