-- swmap X20PRO definition for 800x480
-- T5/T6 vertical
-- SK/SL

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
        ["draw"] = function() drawStick(559, 241, 74) end,
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 153, 185, 153 } },
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
        ["lines"] = { { 795, 153, 615, 153 } },
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
        ["lines"] = { { 5, 89, 236, 89 } },
        ["draw"] = function() drawButton2Pos(248, 89, 12) end,
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
        ["lines"] = { { 795, 89, 564, 89 } },
        ["draw"] = function() drawButton2Pos(552, 89, 12) end,
    },
    {
        ["name"] = "SI",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 244, 112, 244 } },
        ["draw"] = function() drawButton1Pos(120, 244, 8) end,
    },
    {
        ["name"] = "SJ",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 244, 688, 244 } },
        ["draw"] = function() drawButton1Pos(680, 244, 8) end,
    },
    {
        ["name"] = "SK",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 174, 112, 174 } },
        ["draw"] = function() drawButton2Pos(120, 174, 8) end,
    },
    {
        ["name"] = "SL",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 174, 688, 174 } },
        ["draw"] = function() drawButton2Pos(680, 174, 8) end,
    },
    -- Left Center Stick momentary switch, uncomment to show
    -- {
    --     ["name"] = "SM",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 5, 265, 234, 265 } },
    --     ["draw"] = function() drawButton1Pos(242, 265, 8) end,
    -- },
    -- Right Center Stick momentary switch, uncomment to show
    -- {
    --     ["name"] = "SN",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 795, 265, 566, 265 } },
    --     ["draw"] = function() drawButton1Pos(558, 265, 8) end,
    -- },
    -- Left Center Stick 3POS switch, uncomment to show
    -- {
    --     ["name"] = "SX",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 5, 223, 223, 223 }, { 223, 223, 232, 232 } },
    --     ["draw"] = function() drawButton3Pos(242, 241, 12) end,
    -- },
    -- Right Center Stick 3POS switch, uncomment to show
    -- {
    --     ["name"] = "SY",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 795, 223, 577, 223 }, { 577, 223, 568, 232 } },
    --     ["draw"] = function() drawButton3Pos(558, 241, 12) end,
    -- },
    {
        ["name"] = "LS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 5, 202, 145, 202 } },
        ["draw"] = function() drawSlider(145, 180, 10, 40, 1) end,
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 795, 202, 655, 202 } },
        ["draw"] = function() drawSlider(645, 180, 10, 40, 1) end,
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
        ["lines"] = { { 400, 412, 460, 412 }, { 400, 387, 400, 412 }, { 340, 412, 440, 412 } },
        ["draw"] = function() drawSlider(395, 290, 10, 97) end,
        ["offset"] = -2,
        ["align"] = TEXT_CENTERED,
    },
    {
        ["name"] = "T1",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 307, 488, 307 } },
        ["draw"] = function() drawTrim(451, 299, 40, 16) end,
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 286, 481, 286 }, { 481, 286, 462, 264 } },
        ["draw"] = function() drawTrim(451, 227, 16, 40) end,
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 286, 319, 286 }, { 319, 286, 338, 264 } },
        ["draw"] = function() drawTrim(331, 227, 16, 40) end,
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 307, 312, 307 } },
        ["draw"] = function() drawTrim(306, 299, 40, 16) end,
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 331, 178, 331 } },
        ["draw"] = function() drawTrim(174, 312, 16, 40) end,
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 331, 622, 331 } },
        ["draw"] = function() drawTrim(605, 312, 16, 40) end,
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
