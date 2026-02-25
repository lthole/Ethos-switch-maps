-- swmap X20PRO definition for 784x316
-- T5/T6 vertical
-- SK/SL

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]
return {
        ["S1"] = {
        ["lines"]={{228, 19, 369, 19}, {353, 19, 353, 90}},
        ["draw"]=function () lcd.drawCircle(353, 111, 20) end,
    },
        ["S2"] = {
        ["lines"]={{545, 19, 404, 19}, {434, 19, 434, 90}},
        ["draw"]=function () lcd.drawCircle(434, 111, 20) end,
    },
        ["S3"] = {
        ["lines"]={{400, 220, 435, 220},{365, 220, 400, 220}},
        ["draw"]=function () lcd.drawLine(400, 220, 400, 317) lcd.drawLine(390, 270, 410, 270) end,
        ["align"]=TEXT_CENTERED
    },
        ["SA"] = {
        ["lines"]={{5, 115, 94, 115}, {94, 115, 118, 91}},
        ["draw"]=function() lcd.drawCircle(118, 91, 12) end,
    },
        ["SB"] = {
        ["lines"]={{5, 67, 144, 67}, {144, 67, 168, 91}},
        ["draw"]=function () lcd.drawCircle(168, 91, 12) end,
    },
        ["SC"] = {
        ["lines"]={{780, 67, 641, 67}, {641, 67, 617, 91}},
        ["draw"]=function () lcd.drawCircle(617, 91, 12) end,
    },
        ["SD"] = {
        ["lines"]={{780, 115, 691, 115}, {691, 115, 667, 91}},
        ["draw"]=function () lcd.drawCircle(668, 91, 12) end,
    },
        ["SE"] = {
        ["lines"]={{5, 43, 145, 43}},
        ["draw"]=function () lcd.drawCircle(145, 43, 12) end,
    },
        ["SF"] = {
        ["lines"]={{5, 19, 196, 19}},
        ["draw"]=function () lcd.drawCircle(196, 19, 12) end,
    },
        ["SG"] = {
        ["lines"]={{780, 43, 641, 43}},
        ["draw"]=function () lcd.drawCircle(641, 43, 12) end,
    },
        ["SH"] = {
        ["lines"]={{780, 19, 587, 19}},
        ["draw"]=function () lcd.drawCircle(587, 19, 12) end,
    },
        ["SI"] = {
        ["lines"]={{5, 166, 100, 166}},
        ["draw"]=function () lcd.drawCircle(100, 170, 8) end,
    },
        ["SJ"] = {
        ["lines"]={{780, 166, 685, 166}},
        ["draw"]=function () lcd.drawCircle(685, 170, 8) end,
    },
        ["SK"] = {
        ["lines"]={{5, 91, 76, 91}},
        ["draw"]=function () lcd.drawCircle(77, 91, 8) end,
    },
        ["SL"] = {
        ["lines"]={{780, 91, 719, 91}},
        ["draw"]=function () lcd.drawCircle(719, 91, 8) end,
    },
        ["FS1"] = {
        ["lines"]={{5, 266, 315, 266}},
        ["draw"]=function() lcd.drawCircle(316, 266, 10) end
    },
        ["FS2"] = {
        ["lines"]={{5, 290, 333, 290}},
        ["draw"]=function() lcd.drawCircle(333, 290, 10) end
    },
        ["FS3"] = {
        ["lines"]={{5, 314, 315, 314}},
        ["draw"]=function() lcd.drawCircle(316, 314, 10) end
    },
        ["FS4"] = {
        ["lines"]={{780, 266, 470, 266}},
        ["draw"]=function() lcd.drawCircle(470, 266, 10) end
    },
        ["FS5"] = {
        ["lines"]={{780, 290, 452, 290}},
        ["draw"]=function() lcd.drawCircle(452, 290, 10) end
    },
        ["FS6"] = {
        ["lines"]={{780, 314, 470, 314}},
        ["draw"]=function() lcd.drawCircle(470, 314, 10) end
    },
        ["LS"] = {
        ["lines"]={{5, 142, 114, 142}, {114, 142, 138, 166}},
        ["draw"]=function() lcd.drawAnnulusSector(180, 170, 43, 44, 230, 310) lcd.drawLine(130, 170, 146, 170) end
    },
        ["RS"] = {
        ["lines"]={{780, 142, 671, 142}, {671, 142, 647, 166}},
        ["draw"]=function() lcd.drawAnnulusSector(603, 170, 43, 44, 50, 130) lcd.drawLine(637, 170, 653, 170) end
    },
        ["T1"] = {
        ["lines"]={{780, 217, 473, 217},{473, 217, 456, 236}},
        ["draw"]=function() lcd.drawRectangle(436, 229, 40, 16) lcd.drawLine(456, 229, 456, 244) end
    },
        ["T2"] = {
        ["lines"]={{780, 193, 464, 193}, {464, 193, 445, 174}},
        ["draw"]=function() lcd.drawRectangle(436, 157, 16, 40) lcd.drawLine(436, 177, 451, 177) end
    },
        ["T3"] = {
        ["lines"]={{5, 193, 319, 193}, {319, 193, 338, 174}},
        ["draw"]=function() lcd.drawRectangle(331, 157, 16, 40) lcd.drawLine(331, 177, 346, 177) end
    },
        ["T4"] = {
        ["lines"]={{5, 217, 312, 217},{312,217,326,236}},
        ["draw"]=function() lcd.drawRectangle(306, 229, 40, 16) lcd.drawLine(326, 229, 326, 244) end
    },
        ["T5"] = {
        ["lines"]={{5, 241, 178, 241}},
        ["draw"]=function() lcd.drawRectangle(174, 242, 16, 40) lcd.drawLine(174, 262, 189, 262) end
    },
        ["T6"] = {
        ["lines"]={{780, 241, 607, 241}},
        ["draw"]=function() lcd.drawRectangle(590, 242, 16, 40) lcd.drawLine(590, 262, 605, 262) end
    },
    ["LH STICK"]={
        ["draw"]=function() lcd.drawCircle(242, 171, 74) lcd.drawCircle(242, 171, 10) end
    },
    ["RH STICK"]={
        ["draw"]=function() lcd.drawCircle(544, 171, 74) lcd.drawCircle(544, 171, 10) end
    },
}
