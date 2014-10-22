--[[
This script was made by Atton in 2014. [MTA COMMUNITY]
Users are free to modify this script as long as it is for personal use only.
No assurances and or warranties will be provided use at your own risk.
Please do not distribute this code in a modified form without giving credit.
]]--
-- Only edit this if you really know what you are doing.
cryptType = "AES256"
mode = "ECBMODE"


function makeGUI ()
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 591, 401
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	troot = guiCreateWindow(left, top, windowWidth, windowHeight, "AES GUI", false)
	guiWindowSetSizable(troot, false)
	guiSetVisible(troot, false)
	codeE = guiCreateMemo(440, 75, 131, 31, "[Your Key Here]", false, troot)
	guiSetVisible(troot, false)
	
	encodeB = guiCreateButton(440, 165, 111, 41, "Encode", false, troot)
	decodeB = guiCreateButton(440, 215, 111, 41, "Decode", false, troot)
	wbB = guiCreateButton(440, 265, 111, 41, "Clear All Boxes", false, troot)
	closeB = guiCreateButton(440, 315, 111, 41, "Close", false, troot)
	
	outputl = guiCreateLabel(20, 185, 91, 31, "Output", false, troot)
	guiLabelSetHorizontalAlign(outputl, "left", false)
	guiLabelSetVerticalAlign(outputl, "center")
	guiSetVisible(troot, false)
	inputF = guiCreateLabel(20, 15, 91, 31, "Input", false, troot)
	guiLabelSetHorizontalAlign(inputF, "left", false)
	guiLabelSetVerticalAlign(inputF, "center")
	guiSetVisible(troot, false)
	Codel = guiCreateLabel(440, 45, 91, 21, "Code", false, troot)
	guiLabelSetHorizontalAlign(Codel, "left", false)
	guiLabelSetVerticalAlign(Codel, "center")

	inputBox = guiCreateMemo(20, 45, 361, 131, "", false, troot)
	outputBox = guiCreateMemo(20, 215, 361, 131, "", false, troot)
	guiSetVisible(troot, false)
end
makeGUI ()

-- tostring used a lot just to prevent fuck up's.
function enCodef ()
	local Key = guiGetText(codeE)
	local Data = guiGetText(inputBox)
	local Code = exports.aesgui:encryptString(Key,Data,cryptType,mode)
		guiSetText(outputBox,tostring(base64Encode(tostring(Code))))
end
addEventHandler("onClientGUIClick",encodeB ,enCodef, true)	

function deCodef ()
	local Key = guiGetText(codeE)
	local Data = tostring(base64Decode(tostring(guiGetText(inputBox))))
	local Code = exports.aesgui:decryptString(Key,Data,cryptType,mode)
		guiSetText(outputBox,tostring(Code))
end
addEventHandler("onClientGUIClick",decodeB ,deCodef, true)	

function dtf ()
-- This is fine leave it alone.
	guiSetText(outputBox,"")
	guiSetText(inputBox,"")
	guiSetText(codeE,"")
end
addEventHandler("onClientGUIClick",wbB ,dtf, true)

function closef()
-- Also fine.
	 guiSetVisible(troot, false)
     showCursor(false)
end
addEventHandler("onClientGUIClick",closeB ,closef, true)

function Aguif()
-- Same here no need to edit it.
	if (guiGetVisible(troot)) then
		guiSetVisible(troot, false)
		showCursor(false)
	else
		guiSetVisible(troot, true)
		showCursor(true)
    end
end
addCommandHandler("AES", Aguif)