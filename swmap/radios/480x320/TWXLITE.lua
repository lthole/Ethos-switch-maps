-- swmap TWXLITE definition for 480x320

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

local function drawCrossTrim(x, y, size, thickness)
    lcd.color(lcd.GREY(50))
    local half = size / 2
    local halfThickness = thickness / 2
    lcd.drawFilledRectangle(x - half, y - halfThickness, size, thickness)
    lcd.drawFilledRectangle(x - halfThickness, y - half, thickness, size)
end
return {
    {
        ["name"] = "LH STICK",
        ["draw"] = function() drawStick(100, 169, 44) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(380, 169, 44) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 114, 132, 114 } },
        ["draw"] = function() drawButton3Pos(144, 114, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 114, 348, 114 } },
        ["draw"] = function() drawButton3Pos(336, 114, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 56, 108, 56 } },
        ["draw"] = function() drawButton2Pos(120, 56, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 56, 372, 56 } },
        ["draw"] = function() drawButton2Pos(360, 56, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 84, 127, 84 } },
        ["draw"] = function() drawButton1Pos(137, 84, 10) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 475, 84, 353, 84 } },
        ["draw"] = function() drawButton1Pos(343, 84, 10) end,
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
        ["lines"] = { { 166, 57, 312, 57 }, { 194, 57, 194, 67 } },
        ["draw"] = function() drawCurvedSlider(194, 112, 34, 44, 320, 40) end,
        ["alias"] = "L1",
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 312, 114, 166, 114 }, { 286, 114, 286, 77 } },
        ["draw"] = function() drawCurvedSlider(286, 112, 34, 44, 320, 40) end,
        ["offset"] = -2,
        ["alias"] = "L2",
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
        ["name"] = "T1T2",
        ["draw"] = function() drawCrossTrim(284, 190, 40, 12) end,
    },
    {
        ["name"] = "T3T4",
        ["draw"] = function() drawCrossTrim(196, 190, 40, 12) end,
    },
    {
        ["name"] = "T1",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 475, 210, 316, 210 }, { 316, 210, 304, 196 } },
        ["draw"] = nil,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 475, 234, 310, 234 }, { 310, 234, 290, 210 } },
        ["draw"] = nil,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 234, 170, 234 }, { 170, 234, 190, 210 } },
        ["draw"] = nil,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 210, 164, 210 }, { 164, 210, 176, 196 } },
        ["draw"] = nil,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 258, 164, 258 } },
        ["draw"] = function() drawTrim(164, 245, 40, 16) end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 475, 258, 316, 258 } },
        ["draw"] = function() drawTrim(276, 245, 40, 16) end,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 284, 173, 284 } },
        ["draw"] = function() drawButton1Pos(183, 284, 10) end,
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 308, 205, 308 }, { 205, 308, 213, 293 } },
        ["draw"] = function() drawButton1Pos(221, 284, 10) end,
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 475, 308, 275, 308 }, { 275, 308, 267, 293 } },
        ["draw"] = function() drawButton1Pos(259, 284, 10) end,
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 475, 284, 307, 284 } },
        ["draw"] = function() drawButton1Pos(297, 284, 10) end,
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
