local fabric = require "plugin.fabric"
fabric.init()

local widget = require("widget")

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 0,0,1 )

local title = display.newText( {text = "Fabric Plugin", fontSize = 30} )
title.width, title.height = 300, 168
title.x, title.y = display.contentCenterX, 168*.5
title:setFillColor(1,1,1)
local logEvent
logEvent = widget.newButton( {
    x = display.contentCenterX,
    y = display.contentCenterY-50,
    id = "logEvent",
    labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
    label = "Log Event",
    onEvent = function ( e )
        if (e.phase == "ended") then
            fabric.sendCustomEvent("test", {testData = "hello world"})
            print("event logged")
        end
    end
} )

local sendPurchase
sendPurchase = widget.newButton( {
    x = display.contentCenterX,
    y = display.contentCenterY,
    id = "sendPurchase",
    labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
    label = "Send Purchase",
    onEvent = function ( e )
        if (e.phase == "ended") then
            fabric.sendPurchase("13.50", "USD", true, "Answers Shirt", "Apparel", "testID")
            print("purchased logged")
        end
    end
} )
