-- swmap X18RS definition for 800x480
-- T5/T6 horizontal
-- no SK/SL
-- no S3
-- SE/SF/SG/SH specific positions

--[[ important:
  in lines the first two points of the first line are the text coordinates
  you must draw the lines from the left if switch is on the left and vice versa
]]

-- lines represents the lines of the legend, type nil|table
-- when lines is commented out the draw function is still called but no line/legend is drawn, this is useful for slots
-- draw represents the drawing of controls type nil|function
-- align if defined overrides the alignment of the text TEXT_LEFT|TEXT_RIGHT|TEXT_CENTERED
-- offset if defined is added to the y coordinate of the text
-- name is the name of the switch, name as you wish, it appears as legend prefix
-- the order of the switches defines the order on the configure panel

return {
    {
        ["name"] = "LH STICK",
        ["draw"] = function() drawStick(242, 241, 74) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(558, 241, 74) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 153, 183, 153 } },
        ["draw"] = function() drawButton3Pos(195, 150, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 132, 233, 132 }, { 233, 132, 240, 145 } },
        ["draw"] = function() drawButton3Pos(252, 150, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 132, 567, 132 }, { 567, 132, 560, 145 } },
        ["draw"] = function() drawButton3Pos(548, 150, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 153, 617, 153 } },
        ["draw"] = function() drawButton3Pos(605, 150, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 111, 209, 111 } },
        ["draw"] = function() drawButton3Pos(220, 116, 12) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 89, 210, 89 } },
        ["draw"] = function() drawButton2Pos(222, 86, 12) end,
    },
    {
        ["name"] = "SG",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 111, 591, 111 } },
        ["draw"] = function() drawButton3Pos(580, 116, 12) end,
    },
    {
        ["name"] = "SH",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 89, 590, 89 } },
        ["draw"] = function() drawButton2Pos(578, 86, 12) end,
    },
    {
        ["name"] = "SI",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 235, 122, 235 } },
        ["draw"] = function() drawButton1Pos(130, 235, 8) end,
    },
    {
        ["name"] = "SJ",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 235, 678, 235 } },
        ["draw"] = function() drawButton1Pos(670, 235, 8) end,
    },
    {
        ["name"] = "SK",
        ["type"] = TYPE_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "SL",
        ["type"] = TYPE_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "LS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 5, 190, 154, 190 } },
        ["draw"] = function() drawCurvedSlider(220, 225, 64, 74, 280, 325) end,
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 795, 190, 646, 190 } },
        ["draw"] = function() drawCurvedSlider(580, 225, 64, 74, 35, 80) end,
    },
    {
        ["name"] = "S1",
        ["type"] = TYPE_POT,
        ["lines"] = { { 384, 111, 264, 111 }, { 353, 111, 353, 160 } },
        ["draw"] = function() drawPot(353, 181, 20) end,
        ["align"] = TEXT_RIGHT,
    },
    {
        ["name"] = "S2",
        ["type"] = TYPE_POT,
        ["lines"] = { { 416, 111, 536, 111 }, { 447, 111, 447, 160 } },
        ["draw"] = function() drawPot(447, 181, 20) end,
        ["align"] = TEXT_LEFT,
    },
    {
        ["name"] = "S3",
        ["type"] = TYPE_SLIDER_MIDDLE,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "T1",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 335, 576, 335 } },
        ["draw"] = function() drawTrim(538, 327, 40, 16) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 283, 479, 283 }, { 479, 283, 463, 267 } },
        ["draw"] = function() drawTrim(455, 227, 16, 40) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 283, 319, 283 }, { 319, 283, 335, 267 } },
        ["draw"] = function() drawTrim(331, 227, 16, 40) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 335, 224, 335 } },
        ["draw"] = function() drawTrim(222, 327, 40, 16) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 307, 298, 307 }, { 298, 307, 306, 314 } },
        ["draw"] = function() drawTrim(306, 309, 40, 16) end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 307, 502, 307 }, { 502, 307, 494, 314 } },
        ["draw"] = function() drawTrim(454, 309, 40, 16) end,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 356, 315, 356 } },
        ["draw"] = function() drawButton1Pos(316, 356, 10) end,
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 380, 333, 380 } },
        ["draw"] = function() drawButton1Pos(333, 380, 10) end,
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 404, 315, 404 } },
        ["draw"] = function() drawButton1Pos(316, 404, 10) end,
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 356, 485, 356 } },
        ["draw"] = function() drawButton1Pos(485, 356, 10) end,
    },
    {
        ["name"] = "FS5",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 380, 467, 380 } },
        ["draw"] = function() drawButton1Pos(467, 380, 10) end,
    },
    {
        ["name"] = "FS6",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 404, 485, 404 } },
        ["draw"] = function() drawButton1Pos(485, 404, 10) end,
    },
}
