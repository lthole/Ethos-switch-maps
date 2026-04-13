-- swmap X20 definition for 784x316
-- no T5/T6
-- no SK/SL

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
        ["draw"] = function() drawStick(242, 171, 74) end,
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(544, 171, 74) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 88, 185, 88 } },
        ["draw"] = function() drawButton3Pos(195, 80, 12) end,
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 65, 233, 65 }, { 233, 65, 240, 80 } },
        ["draw"] = function() drawButton3Pos(252, 80, 12) end,
    },
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 65, 551, 65 }, { 551, 65, 544, 80 } },
        ["draw"] = function() drawButton3Pos(532, 80, 12) end,
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 88, 599, 88 } },
        ["draw"] = function() drawButton3Pos(589, 80, 12) end,
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 42, 209, 42 } },
        ["draw"] = function() drawButton3Pos(220, 48, 12) end,
    },
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 19, 236, 19 } },
        ["draw"] = function() drawButton2Pos(248, 19, 12) end,
    },
    {
        ["name"] = "SG",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 42, 575, 42 } },
        ["draw"] = function() drawButton3Pos(564, 48, 12) end,
    },
    {
        ["name"] = "SH",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 19, 548, 19 } },
        ["draw"] = function() drawButton2Pos(536, 19, 12) end,
    },
    {
        ["name"] = "SI",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 174, 112, 174 } },
        ["draw"] = function() drawButton1Pos(120, 168, 8) end,
    },
    {
        ["name"] = "SJ",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 779, 174, 672, 174 } },
        ["draw"] = function() drawButton1Pos(664, 168, 8) end,
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
    -- Left Center Stick momentary switch, uncomment to show
    -- {
    --     ["name"] = "SM",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 242, 126, 295, 126 }, { 189, 126, 242, 126 }, { 242, 126, 242, 138 } },
    --     ["draw"] = function() drawButton1Pos(242, 146, 8) end,
    --     ["align"] = TEXT_CENTERED,
    -- },
    -- Right Center Stick momentary switch, uncomment to show
    -- {
    --     ["name"] = "SN",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 542, 126, 489, 126 }, { 595, 126, 542, 126 }, { 542, 126, 542, 138 } },
    --     ["draw"] = function() drawButton1Pos(542, 146, 8) end,
    --     ["align"] = TEXT_CENTERED,
    -- },
    -- Left Center Stick 3POS switch, uncomment to show
    -- {
    --     ["name"] = "SX",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 5, 154, 223, 154 }, { 223, 154, 232, 166 } },
    --     ["draw"] = function() drawButton3Pos(242, 171, 12) end,
    -- },
    -- Right Center Stick 3POS switch, uncomment to show
    -- {
    --     ["name"] = "SY",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 779, 154, 561, 154 }, { 561, 154, 552, 166 } },
    --     ["draw"] = function() drawButton3Pos(542, 171, 12) end,
    -- },
    {
        ["name"] = "LS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 5, 132, 145, 132 } },
        ["draw"] = function() drawSlider(145, 112, 10, 40, 1) end,
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 779, 132, 639, 132 } },
        ["draw"] = function() drawSlider(634, 112, 10, 40, 1) end,
    },
    {
        ["name"] = "S1",
        ["type"] = TYPE_POT,
        ["lines"] = { { 384, 42, 264, 42 }, { 353, 42, 353, 90 } },
        ["draw"] = function() drawPot(353, 111, 20) end,
        ["align"] = TEXT_RIGHT,
    },
    {
        ["name"] = "S2",
        ["type"] = TYPE_POT,
        ["lines"] = { { 400, 42, 520, 42 }, { 431, 42, 431, 90 } },
        ["draw"] = function() drawPot(431, 111, 20) end,
        ["align"] = TEXT_LEFT,
    },
    {
        ["name"] = "S3",
        ["type"] = TYPE_SLIDER_MIDDLE,
        ["lines"] = { { 392, 215, 435, 215 }, { 349, 215, 392, 215 }, { 392, 215, 392, 219 } },
        ["draw"] = function() drawSlider(387, 220, 10, 97) end,
        ["align"] = TEXT_CENTERED,
    },
    {
        ["name"] = "T1",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 780, 217, 473, 217 }, { 473, 217, 456, 236 } },
        ["draw"] = function() drawTrim(436, 229, 40, 16) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 779, 195, 465, 195 }, { 465, 195, 446, 174 } },
        ["draw"] = function() drawTrim(437, 157, 16, 40) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 195, 319, 195 }, { 319, 195, 338, 174 } },
        ["draw"] = function() drawTrim(331, 157, 16, 40) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 217, 312, 217 }, { 312, 217, 326, 236 } },
        ["draw"] = function() drawTrim(306, 229, 40, 16) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = nil,
        ["draw"] = function() end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = nil,
        ["draw"] = function() end,
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 266, 315, 266 } },
        ["draw"] = function() drawButton1Pos(316, 266, 10) end,
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 290, 333, 290 } },
        ["draw"] = function() drawButton1Pos(333, 290, 10) end,
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 313, 315, 313 } },
        ["draw"] = function() drawButton1Pos(316, 313, 10) end,
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 780, 266, 470, 266 } },
        ["draw"] = function() drawButton1Pos(470, 266, 10) end,
    },
    {
        ["name"] = "FS5",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 780, 290, 452, 290 } },
        ["draw"] = function() drawButton1Pos(452, 290, 10) end,
    },
    {
        ["name"] = "FS6",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 780, 313, 470, 313 } },
        ["draw"] = function() drawButton1Pos(470, 313, 10) end,
    },
}
