-- swmap Kavan V15 definition for 640x360

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
        ["draw"] = function() drawStick(212, 191, 44) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(428, 191, 44) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 121, 177, 121 }, { 177, 121, 183, 118 } },
        ["draw"] = function() drawButton3Pos(195, 112, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 97, 233, 97 }, { 233, 97, 240, 112 } },
        ["draw"] = function() drawButton3Pos(252, 112, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 635, 97, 407, 97 }, { 407, 97, 400, 112 } },
        ["draw"] = function() drawButton3Pos(388, 112, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 635, 121, 463, 121 }, { 463, 121, 457, 118 } },
        ["draw"] = function() drawButton3Pos(445, 112, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 74, 209, 74 } },
        ["draw"] = function() drawButton2Pos(220, 80, 12) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 635, 74, 431, 74 } },
        ["draw"] = function() drawButton2Pos(420, 80, 12) end,
    },
    {
        ["name"] = "SG",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 193, 125, 193 } },
        ["draw"] = function() drawButton1Pos(133, 193, 8) end,
    },
    {
        ["name"] = "SH",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 635, 193, 515, 193 } },
        ["draw"] = function() drawButton1Pos(507, 193, 8) end,
    },
    {
        ["name"] = "SI",
        ["type"] = TYPE_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "SJ",
        ["type"] = TYPE_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
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
        ["lines"] = { { 5, 153, 147, 153 } },
        ["draw"] = function() drawCurvedSlider(191, 153, 37, 44, 240, 300) end,
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 635, 153, 493, 153 } },
        ["draw"] = function() drawCurvedSlider(449, 153, 37, 44, 60, 120) end,
    },
    {
        ["name"] = "S1",
        ["type"] = TYPE_POT,
        ["lines"] = { { 317, 50, 178, 50 }, { 290, 50, 290, 110 } },
        ["draw"] = function() drawPot(290, 131, 14) end,
        ["align"] = TEXT_RIGHT,
    },
    {
        ["name"] = "S2",
        ["type"] = TYPE_POT,
        ["lines"] = { { 326, 50, 459, 50 }, { 350, 50, 350, 110 } },
        ["draw"] = function() drawPot(350, 131, 14) end,
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
        ["lines"] = { { 635, 260, 448, 260 } },
        ["draw"] = function() drawTrim(404, 252, 40, 16) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 635, 236, 388, 236 }, { 388, 236, 369, 217 } },
        ["draw"] = function() drawTrim(353, 177, 16, 40) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 236, 252, 236 }, { 252, 236, 271, 217 } },
        ["draw"] = function() drawTrim(271, 177, 16, 40) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 260, 192, 260 } },
        ["draw"] = function() drawTrim(192, 252, 40, 16) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 284, 250, 284 } },
        ["draw"] = function() drawButton1Pos(260, 290, 10) end,
        ["alias"] = "SG",
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 308, 290, 308 }, { 290, 308, 300, 300 } },
        ["draw"] = function() drawButton1Pos(300, 290, 10) end,
        ["alias"] = "SH",
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 635, 308, 350, 308 }, { 350, 308, 340, 300 } },
        ["draw"] = function() drawButton1Pos(340, 290, 10) end,
        ["alias"] = "SJ",
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 635, 284, 390, 284 } },
        ["draw"] = function() drawButton1Pos(380, 290, 10) end,
        ["alias"] = "SK",
    },
    {
        ["name"] = "FS5",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "FS6",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
    },
}
