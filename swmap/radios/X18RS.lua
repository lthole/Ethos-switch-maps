-- swmap X18RS definition
-- T5/T6 horizontal
-- no SK/SL
-- no S3

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]
return {
    ["S1"] = {
        ["lines"]={{243,89,384,89}, {353,89,353,160}},
        ["draw"]=function () lcd.drawCircle(353,181, 20) end,
    },
    ["S2"] = {
        ["lines"]={{419,89,560,89}, {449,89,449,160}},
        ["draw"]=function () lcd.drawCircle(449,181, 20) end,
    },
    ["S3"] = {
        ["lines"]=nil,
        ["draw"]=function () end,
    },
    ["SA"] = {
        ["lines"]={{5,185,94,185}, {94,185,118,161}},
        ["draw"]=function() lcd.drawCircle(118,161,12) end,
    },
    ["SB"] = {
        ["lines"]={{5,137,144,137}, {144,137,168,161}},
        ["draw"]=function () lcd.drawCircle(168,161, 12) end,
    },
    ["SC"] = {
        ["lines"]={{795,137,656,137}, {656,137,632,161}},
        ["draw"]=function () lcd.drawCircle(632,161, 12) end,
    },
    ["SD"] = {
        ["lines"]={{795,185,706,185}, {706,185,682,161}},
        ["draw"]=function () lcd.drawCircle(683,161, 12) end,
    },
    ["SE"] = {
        ["lines"]={{5,113,145,113}},
        ["draw"]=function () lcd.drawCircle(145,113, 12) end,
    },
    ["SF"] = {
        ["lines"]={{5,89,196,89}},
        ["draw"]=function () lcd.drawCircle(196,89, 12) end,
    },
    ["SG"] = {
        ["lines"]={{795,113,656,113}},
        ["draw"]=function () lcd.drawCircle(656,113, 12) end,
    },
    ["SH"] = {
        ["lines"]={{795,89,602,89}},
        ["draw"]=function () lcd.drawCircle(602,89, 12) end,
    },
    ["SI"] = {
        ["lines"]={{5,240,100,240}},
        ["draw"]=function () lcd.drawCircle(100,240, 8) end,
    },
    ["SJ"] = {
        ["lines"]={{795,240,700,240}},
        ["draw"]=function () lcd.drawCircle(700,240, 8) end,
    },
    ["SK"] = {
        ["lines"]=nil,
        ["draw"]=function () end,
    },
    ["SL"] = {
        ["lines"]=nil,
        ["draw"]=function () end,
    },
    ["FS1"] = {
        ["lines"]={{5,356,315,356}},
        ["draw"]=function() lcd.drawCircle(316,356, 10) end
    },
    ["FS2"] = {
        ["lines"]={{5,380,333,380}},
        ["draw"]=function() lcd.drawCircle(333,380, 10) end
    },
    ["FS3"] = {
        ["lines"]={{5,404,315,404}},
        ["draw"]=function() lcd.drawCircle(316,404, 10) end
    },
    ["FS4"] = {
        ["lines"]={{795,356,485,356}},
        ["draw"]=function() lcd.drawCircle(485,356, 10) end
    },
    ["FS5"] = {
        ["lines"]={{795,380,467,380}},
        ["draw"]=function() lcd.drawCircle(467,380, 10) end
    },
    ["FS6"] = {
        ["lines"]={{795,404,485,404}},
        ["draw"]=function() lcd.drawCircle(485,404, 10) end
    },
    ["LS"] = {
        ["lines"]={{5,216,114,216}, {114,216,138,240}},
        ["draw"]=function() lcd.drawAnnulusSector(180, 240, 43, 44, 230, 310) lcd.drawLine(130,240,146,240) end
    },
    ["RS"] = {
        ["lines"]={{795,216,686,216}, {686,216,662,240}},
        ["draw"]=function() lcd.drawAnnulusSector(618, 240, 43, 44, 50, 130) lcd.drawLine(652,240,668,240) end
    },
    ["T1"] = {
        ["lines"]={{795,335,576,335}},
        ["draw"]=function() lcd.drawRectangle(539,327, 40, 16) lcd.drawLine(559,327,559,342) end
    },
    ["T2"] = {
        ["lines"]={{795,283,479,283}, {479,283,460,264}},
        ["draw"]=function() lcd.drawRectangle(451,227, 16, 40) lcd.drawLine(451,247,466,247) end
    },
    ["T3"] = {
        ["lines"]={{5,283,319,283}, {319,283,338,264}},
        ["draw"]=function() lcd.drawRectangle(331,227, 16, 40) lcd.drawLine(331,247,346,247) end
    },
    ["T4"] = {
        ["lines"]={{5,335,224,335}},
        ["draw"]=function() lcd.drawRectangle(222,327, 40, 16) lcd.drawLine(242,327,242,342) end
    },
    ["T5"] = {
        ["lines"]={{5,307,312,307}},
        ["draw"]=function() lcd.drawRectangle(306,299, 40, 16) lcd.drawLine(326,299,326,314) end
    },
    ["T6"] = {
        ["lines"]={{795,307,488,307}},
        ["draw"]=function() lcd.drawRectangle(451,299, 40, 16) lcd.drawLine(471,299,471,314) end
    },
    ["_LH STICK"]={
        ["draw"]=function() lcd.drawCircle(242,241, 74) lcd.drawCircle(242,241, 10) end
    },
    ["_RH STICK"]={
        ["draw"]=function() lcd.drawCircle(559,241, 74) lcd.drawCircle(559,241, 10) end
    },
}
