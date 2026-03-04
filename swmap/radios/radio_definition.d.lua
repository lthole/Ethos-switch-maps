-- this file is used for lua annotations in VSCode (plugin Lua Language Server)
---@meta

---Draws a Stick
---@param cx integer centre of the stick x axis
---@param cy integer centre of stick y axis
---@param r integer radius of the stick
function drawStick(cx, cy, r) end

---Draws a Momentary button (1 POS)
---@param cx integer centre of the stick x axis
---@param cy integer centre of stick y axis
---@param r integer radius of the stick
function drawButton1Pos(cx, cy, r) end

---Draws a 2 Positions button (2 POS)
---@param cx integer centre of the stick x axis
---@param cy integer centre of stick y axis
---@param r integer radius of the stick
function drawButton2Pos(cx, cy, r) end

---Draws a 3 Positions button (3 POS)
---@param cx integer centre of the stick x axis
---@param cy integer centre of stick y axis
---@param r integer radius of the stick
function drawButton3Pos(cx, cy, r) end

---Draws a potentiometer
---@param cx integer centre of the stick x axis
---@param cy integer centre of stick y axis
---@param r integer radius of the stick
function drawPot(cx, cy, r) end

---Draws a trim button if w > h, horizontal else vertical
---@param x integer top left x position
---@param y integer top left y position
---@param w integer width
---@param h integer height
function drawTrim(x, y, w, h) end

---Draws a vertical slider parameters are like drawRectangle
---@param x integer top left x position
---@param y integer top left y position
---@param w integer width
---@param h integer height
function drawSlider(x, y, w, h) end

---Draws a curved slider (left, right, top or bottom depending on angle)
---Same parameters than lcd.drawAnnulusSector
---@param x integer the center position of the building circle
---@param y integer the center position of the building circle
---@param intR integer inner radius
---@param extR integer outer radius
---@param startAngle integer in degrees
---@param endAngle integer in degrees
function drawCurvedSlider(x, y, intR, extR, startAngle, endAngle) end
