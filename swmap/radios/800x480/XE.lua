-- swmap XE(S) definition for 800x480
-- T5/T6 vertical
-- 2026-03-29 reverse text direction for the switches to avoid early overlaps


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
    -- sticks are drawn first to be in the background
    {
        ["name"] = "LH STICK",
        ["draw"] = function() drawStick(242, 241, 65) end
    },
    {
        ["name"] = "RH STICK",
        ["draw"] = function() drawStick(558, 241, 65) end
    },
    {
        ["name"] = "SA",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 64, 180, 64 }, { 180, 64, 190, 78 } },
        ["draw"] = function() drawButton3Pos(190, 90, 12) end
    },
    {
        ["name"] = "SB",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 218, 64, 390, 64 }, { 238, 64, 238, 78 } },
        ["draw"] = function() drawButton2Pos(238, 90, 12) end
    },
    -- to activate the switch uncomment lines and change draw
    {
        ["name"] = "SC",
        ["type"] = TYPE_SWITCH,
        --["lines"] = { { 390, 94, 298, 94 } },
        ["draw"] = function() drawButtonSlot(286, 90, 12) end,
        ["align"] = TEXT_RIGHT
    },
    {
        ["name"] = "SD",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 5, 152, 180, 152 }, { 180, 152, 190, 139 } },
        ["draw"] = function() drawButton3Pos(190, 125, 12) end
    },
    {
        ["name"] = "SE",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 218, 150, 390, 150 }, { 238, 137, 238, 150 } },
        ["draw"] = function() drawButton3Pos(238, 125, 12) end,
        ["offset"] = -2
    },
    -- to activate the switch uncomment lines and change draw
    {
        ["name"] = "SF",
        ["type"] = TYPE_SWITCH,
        --["lines"] = { { 390, 127, 298, 127 } },
        ["draw"] = function() drawButtonSlot(286, 125, 12) end,
        ["align"] = TEXT_RIGHT
    },
    -- to activate the switch uncomment lines and change draw
    {
        ["name"] = "SG",
        ["type"] = TYPE_SWITCH,
        --["lines"] = { { 410, 94, 502, 94 } },
        ["draw"] = function() drawButtonSlot(514, 90, 12) end,
        ["align"] = TEXT_LEFT
    },
    {
        ["name"] = "SH",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 582, 64, 410, 64 }, { 562, 64, 562, 78 } },
        ["draw"] = function() drawButton1Pos(562, 90, 12) end,
        ["align"] = TEXT_RIGHT
    },
    {
        ["name"] = "SI",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 64, 620, 64 }, { 620, 64, 610, 78 } },
        ["draw"] = function() drawButton3Pos(610, 90, 12) end
    },
    -- to activate the switch uncomment lines and change draw
    {
        ["name"] = "SJ",
        ["type"] = TYPE_SWITCH,
        --["lines"] = { { 410, 127, 502, 127 } },
        ["draw"] = function() drawButtonSlot(514, 125, 12) end,
        ["align"] = TEXT_LEFT
    },
    {
        ["name"] = "SK",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 582, 150, 410, 150 }, { 562, 137, 562, 150 } },
        ["draw"] = function() drawButton3Pos(562, 125, 12) end,
        ["offset"] = -2,
        ["align"] = TEXT_RIGHT
    },
    {
        ["name"] = "SL",
        ["type"] = TYPE_SWITCH,
        ["lines"] = { { 795, 152, 620, 152 }, { 620, 152, 610, 139 } },
        ["draw"] = function() drawButton3Pos(610, 125, 12) end
    },
    -- Left Center Stick momentary switch, uncomment to show
    -- {
    --     ["name"] = "SM",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 5, 265, 234, 265 } },
    --     ["draw"] = function() drawButton1Pos(242, 265, 8) end
    -- },
    -- Right Center Stick momentary switch, uncomment to show
    -- {
    --     ["name"] = "SN",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 795, 265, 566, 265 } },
    --     ["draw"] = function() drawButton1Pos(558, 265, 8) end
    -- },
    -- Left Center Stick 3POS switch, uncomment to show
    -- {
    --     ["name"] = "SX",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 5, 241, 229, 241 } },
    --     ["draw"] = function() drawButton3Pos(242, 241, 12) end,
    -- },
    -- Right Center Stick 3POS switch, uncomment to show
    -- {
    --     ["name"] = "SY",
    --     ["type"] = TYPE_SWITCH,
    --     ["lines"] = { { 795, 241, 561, 241 } },
    --     ["draw"] = function() drawButton3Pos(558, 241, 12) end,
    -- },
    {
        ["name"] = "LS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 5, 209, 133, 209 } },
        ["draw"] = function() drawCurvedSlider(178, 209, 34, 44, 230, 310) end
    },
    {
        ["name"] = "RS",
        ["type"] = TYPE_SLIDER,
        ["lines"] = { { 795, 209, 667, 209 } },
        ["draw"] = function() drawCurvedSlider(622, 209, 34, 44, 50, 130) end
    },
    {
        ["name"] = "L1",
        ["type"] = TYPE_SLIDER_MIDDLE,
        ["lines"] = { { 390, 313, 300, 313 }, { 370, 313, 370, 281 } },
        ["draw"] = function() drawSlider(365, 201, 10, 80) end,
        ["align"] = TEXT_RIGHT,
        ["offset"] = -2
    },
    {
        ["name"] = "L2",
        ["type"] = TYPE_SLIDER_MIDDLE,
        ["lines"] = { { 410, 313, 500, 313 }, { 430, 313, 430, 281 } },
        ["draw"] = function() drawSlider(425, 201, 10, 80) end,
        ["align"] = TEXT_LEFT,
        ["offset"] = -2
    },
    {
        ["name"] = "S1",
        ["type"] = TYPE_POT,
        ["lines"] = { { 5, 90, 125, 90 } },
        ["draw"] = function() drawPot(140, 90, 15) end
    },
    {
        ["name"] = "S2",
        ["type"] = TYPE_POT,
        ["lines"] = { { 5, 125, 125, 125 } },
        ["draw"] = function() drawPot(140, 125, 15) end
    },
    {
        ["name"] = "S3",
        ["type"] = TYPE_SLIDER_MIDDLE,
        ["lines"] = { { 795, 90, 675, 90 } },
        ["draw"] = function() drawPot(660, 90, 15) end
    },
    {
        ["name"] = "S4",
        ["type"] = TYPE_POT,
        ["lines"] = { { 795, 125, 675, 125 } },
        ["draw"] = function() drawPot(660, 125, 15) end
    },
    {
        ["name"] = "T1",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 332, 578, 332 } },
        ["draw"] = function() drawTrim(538, 325, 40, 16) end
    },
    {
        ["name"] = "T2",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 289, 494, 289 }, { 494, 289, 469, 263 } },
        ["draw"] = function() drawTrim(453, 223, 16, 40) end
    },
    {
        ["name"] = "T3",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 289, 306, 289 }, { 306, 289, 330, 263 } },
        ["draw"] = function() drawTrim(331, 223, 16, 40) end
    },
    {
        ["name"] = "T4",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 332, 222, 332 } },
        ["draw"] = function() drawTrim(222, 325, 40, 16) end
    },
    {
        ["name"] = "T5",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 5, 177, 159, 177 } },
        ["draw"] = function() drawTrim(159, 163, 12, 30) end
    },
    {
        ["name"] = "T6",
        ["type"] = TYPE_TRIM,
        ["lines"] = { { 795, 177, 639, 177 } },
        ["draw"] = function() drawTrim(629, 163, 12, 30) end
    },
    {
        ["name"] = "FS1",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 356, 279, 356 } },
        ["draw"] = function() drawButton1Pos(280, 356, 10) end
    },
    {
        ["name"] = "FS2",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 380, 279, 380 } },
        ["draw"] = function() drawButton1Pos(280, 380, 10) end
    },
    {
        ["name"] = "FS3",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 5, 404, 279, 404 } },
        ["draw"] = function() drawButton1Pos(280, 404, 10) end
    },
    {
        ["name"] = "FS4",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 356, 520, 356 } },
        ["draw"] = function() drawButton1Pos(520, 356, 10) end
    },
    {
        ["name"] = "FS5",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 380, 520, 380 } },
        ["draw"] = function() drawButton1Pos(520, 380, 10) end
    },
    {
        ["name"] = "FS6",
        ["type"] = TYPE_FUNCTION_SWITCH,
        ["lines"] = { { 795, 404, 520, 404 } },
        ["draw"] = function() drawButton1Pos(520, 404, 10) end
    },
}
