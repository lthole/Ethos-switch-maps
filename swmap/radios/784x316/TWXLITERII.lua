-- swmap TWXLITE RII definition for 784x316

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
        ["draw"] = function() drawStick(234, 169, 54) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(550, 169, 54) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 77, 222, 77 } },
        ["draw"] = function() drawButton3Pos(234, 77, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 77, 562, 77 } },
        ["draw"] = function() drawButton3Pos(550, 77, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 17, 198, 17 } },
        ["draw"] = function() drawButton2Pos(210, 17, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 17, 586, 17 } },
        ["draw"] = function() drawButton2Pos(574, 17, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 47, 217, 47 } },
        ["draw"] = function() drawButton1Pos(227, 47, 10) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 47, 567, 47 } },
        ["draw"] = function() drawButton1Pos(557, 47, 10) end,
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
        ["lines"] = { { 5, 107, 248, 107 }, { 248, 107, 308, 46 } },
        ["draw"] = function() drawCurvedSlider(319, 74, 34, 44, 320, 40) end,
        ["alias"] = "L1",
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 779, 107, 536, 107 }, { 536, 107, 476, 46 } },
        ["draw"] = function() drawCurvedSlider(465, 74, 34, 44, 320, 40) end,
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
        ["name"] = "T1",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 779, 184, 473, 184 } },
        ["draw"] = function() drawTrim(443, 178, 30, 12) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 779, 211, 440, 211 }, { 440, 211, 424, 198 } },
        ["draw"] = function() drawTrim(412, 167, 12, 30) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 211, 344, 211 }, { 344, 211, 360, 198 } },
        ["draw"] = function() drawTrim(360, 167, 12, 30) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 184, 311, 184 } },
        ["draw"] = function() drawTrim(311, 178, 30, 12) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 238, 312, 238 } },
        ["draw"] = function() drawTrim(312, 228, 40, 16) end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 779, 238, 472, 238 } },
        ["draw"] = function() drawTrim(432, 228, 40, 16) end,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 284, 334, 284 } },
        ["draw"] = function() drawButton1Pos(344, 284, 10) end,
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 308, 362, 308 }, { 362, 308, 376, 295 } },
        ["draw"] = function() drawButton1Pos(376, 284, 10) end,
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 779, 308, 422, 308 }, { 422, 308, 408, 295 } },
        ["draw"] = function() drawButton1Pos(408, 284, 10) end,
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 779, 284, 450, 284 } },
        ["draw"] = function() drawButton1Pos(440, 284, 10) end,
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
