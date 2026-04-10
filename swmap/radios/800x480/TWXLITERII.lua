-- swmap TWXLITE RII definition for 800x480

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
        ["draw"] = function() drawStick(242, 241, 54) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(559, 241, 54) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 149, 230, 149 } },
        ["draw"] = function() drawButton3Pos(242, 149, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 149, 570, 149 } },
        ["draw"] = function() drawButton3Pos(558, 149, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 89, 206, 89 } },
        ["draw"] = function() drawButton2Pos(218, 89, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 89, 594, 89 } },
        ["draw"] = function() drawButton2Pos(582, 89, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 119, 225, 119 } },
        ["draw"] = function() drawButton1Pos(235, 119, 10) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 119, 575, 119 } },
        ["draw"] = function() drawButton1Pos(565, 119, 10) end,
    },
    {
        ["name"] = "SG",
        ["type"] = TYPE_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "SH",
        ["type"] = TYPE_SWITCH,
        ["lines"] = nil,
        ["draw"] = nil,
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
        ["lines"] = { { 300, 89, 500, 89 }, { 327, 89, 327, 107 } },
        ["draw"] = function() drawCurvedSlider(327, 151, 34, 44, 320, 40) end,
        ["alias"] = "L1",
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 500, 149, 300, 149 }, { 473, 149, 473, 117 } },
        ["draw"] = function() drawCurvedSlider(473, 151, 34, 44, 320, 40) end,
        ["alias"] = "L2",
        ["offset"] = -2
    },
    {
        ["name"] = "S1",
        ["type"] = TYPE_POT,
        ["lines"] = nil,
        ["draw"] = nil,
    },
    {
        ["name"] = "S2",
        ["type"] = TYPE_POT,
        ["lines"] = nil,
        ["draw"] = nil,
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
        ["lines"] = { { 795, 256, 481, 256 } },
        ["draw"] = function() drawTrim(451, 250, 30, 12) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 283, 448, 283 }, { 448, 283, 432, 270 } },
        ["draw"] = function() drawTrim(420, 239, 12, 30) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 283, 352, 283 }, { 352, 283, 368, 270 } },
        ["draw"] = function() drawTrim(368, 239, 12, 30) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 256, 319, 256 } },
        ["draw"] = function() drawTrim(319, 250, 30, 12) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 310, 320, 310 } },
        ["draw"] = function() drawTrim(320, 300, 40, 16) end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 310, 480, 310 } },
        ["draw"] = function() drawTrim(440, 300, 40, 16) end,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 356, 342, 356 } },
        ["draw"] = function() drawButton1Pos(352, 356, 10) end,
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 380, 370, 380 }, { 370, 380, 384, 367 } },
        ["draw"] = function() drawButton1Pos(384, 356, 10) end,
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 380, 430, 380 }, { 430, 380, 416, 367 } },
        ["draw"] = function() drawButton1Pos(416, 356, 10) end,
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 356, 458, 356 } },
        ["draw"] = function() drawButton1Pos(448, 356, 10) end,
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
