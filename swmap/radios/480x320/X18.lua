-- swmap X18RS definition for 784x316
-- T5/T6 horizontal
-- no SK/SL
-- no S3
-- specific SF/SH positions

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
        ["draw"] = function() drawStick(148, 179, 45) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(332, 179, 45) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 113, 107, 113 } },
        ["draw"] = function() drawButton3Pos(119, 105, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 90, 142, 90 }, { 142, 90, 147, 96 } },
        ["draw"] = function() drawButton3Pos(154, 105, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 90, 338, 90 }, { 338, 90, 333, 96 } },
        ["draw"] = function() drawButton3Pos(326, 105, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 113, 373, 113 } },
        ["draw"] = function() drawButton3Pos(361, 105, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 66, 122, 66 } },
        ["draw"] = function() drawButton3Pos(134, 73, 12) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 280, 44, 146, 44 } },
        ["draw"] = function() drawButton2Pos(134, 41, 12) end,
    },
    {
        ["name"] = "SG",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 66, 358, 66 } },
        ["draw"] = function() drawButton3Pos(346, 73, 12) end,
    },
    {
        ["name"] = "SH",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 44, 358, 44 } },
        ["draw"] = function() drawButton2Pos(346, 41, 12) end,
    },
    {
        ["name"] = "SI",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 170, 77, 170 } },
        ["draw"] = function() drawButton1Pos(85, 170, 8) end,
    },
    {
        ["name"] = "SJ",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 170, 403, 170 } },
        ["draw"] = function() drawButton1Pos(395, 170, 8) end,
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
        ["lines"] = { { 5, 146, 97, 146 } },
        ["draw"] = function() drawCurvedSlider(137, 166, 38, 45, 290, 340) end,
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 475, 146, 383, 146 } },
        ["draw"] = function() drawCurvedSlider(343, 166, 38, 45, 20, 70) end,
    },
    {
        ["name"] = "S1",
        ["type"] = TYPE_POT,
        ["lines"] = { { 200, 76, 280, 76 }, { 216, 76, 216, 95 } },
        ["draw"] = function() drawPot(216, 111, 16) end,
    },
    {
        ["name"] = "S2",
        ["type"] = TYPE_POT,
        ["lines"] = { { 280, 142, 200, 142 }, { 264, 142, 264, 127 } },
        ["draw"] = function() drawPot(264, 111, 16) end,
        ["offset"] = -2,
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
        ["lines"] = { { 475, 242, 352, 242 } },
        ["draw"] = function() drawTrim(312, 234, 40, 16) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 475, 194, 285, 194 }, { 285, 194, 277, 185 } },
        ["draw"] = function() drawTrim(261, 165, 16, 40) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 194, 195, 194 }, { 195, 194, 203, 185 } },
        ["draw"] = function() drawTrim(203, 165, 16, 40) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 242, 128, 242 } },
        ["draw"] = function() drawTrim(128, 234, 40, 16) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 218, 191, 218 }, { 191, 218, 199, 230 } },
        ["draw"] = function() drawTrim(187, 230, 40, 16) end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 475, 218, 289, 218 }, { 289, 218, 281, 230 } },
        ["draw"] = function() drawTrim(253, 230, 40, 16) end,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 266, 183, 266 } },
        ["draw"] = function() drawButton1Pos(193, 266, 10) end,
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 290, 194, 290 } },
        ["draw"] = function() drawButton1Pos(204, 290, 10) end,
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 313, 183, 313 } },
        ["draw"] = function() drawButton1Pos(193, 313, 10) end,
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 475, 266, 297, 266 } },
        ["draw"] = function() drawButton1Pos(287, 266, 10) end,
    },
    {
        ["name"] = "FS5",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 475, 290, 286, 290 } },
        ["draw"] = function() drawButton1Pos(276, 290, 10) end,
    },
    {
        ["name"] = "FS6",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 475, 313, 297, 313 } },
        ["draw"] = function() drawButton1Pos(287, 313, 10) end,
    },
}
