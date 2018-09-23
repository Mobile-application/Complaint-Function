local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local widget = require ("widget")

local function content()
  composer.gotoScene("contents",{effect = "slideLeft", time = 500})
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    -- Code here runs when the scene is first created but has not yet appeared on screen

    -- Assign "self.view" to local variable "sceneGroup" for easy reference
    local sceneGroup = self.view
	
	background = display.newImage( "background3.png", display.contentCenterX, display.contentCenterY )
	sceneGroup:insert(background)

    -- Code here runs when the scene is first created but has not yet appeared on screen
	head = display.newText("Complaints", display.contentCenterX,display.contentCenterY*0.10,"Arial",20)
	head:setFillColor(0,0,0)



	local known = widget.newButton(
	{
		id = "known",
		label = "Breaches from a known source",
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX,
		y = 110,
		shape = "roundedRect",

	}
	)
	sceneGroup:insert(known)
	known:addEventListener ("touch", content)

	local unknown = widget.newButton(
	{
		id = "unknown",
		label = "Unknown Source",
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX,
		y = 200,
		shape = "roundedRect",
	}
	)
	sceneGroup:insert(unknown)
	unknown:addEventListener ("touch", content)


end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
