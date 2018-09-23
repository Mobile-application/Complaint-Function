local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local widget = require ("widget")

local surveyText = 
{
	text = "Complaints can be made to the Office of Australian Information Commissioner (OAIC)\
	 when you suspect that a breach has been made by government or private companies covered \
	 by the privacy act. You can check to see if you can make a complaint by filling out the survey here:",
	x = display.contentCenterX,
	y = 50,
	width = (display.contentWidth - 10),
	font = native.SystemFont,
	fontSize = 17
}

local function myText1()
	display.newText( surveyText )
end


local function hyperLink()
  system.openURL("https://www.oaic.gov.au/individuals/privacy-complaint-checker/question-1")
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    -- Code here runs when the scene is first created but has not yet appeared on screen

    -- Assign "self.view" to local variable "sceneGroup" for easy reference
    local sceneGroup = self.view

	background = display.newImage( "background2.jpg", display.contentCenterX, display.contentCenterY )
	sceneGroup:insert(background)


	local myText1 = display.newText( surveyText )

	local surveyLink = widget.newButton(
	{
		id = "link",
		label = "link",
		onEvent = myeventListener,
		emboss = false,
		x = display.contentCenterX,
		y = 150,
		shape = "roundedRect",

	}
	)
	sceneGroup:insert(surveyLink)
	surveyLink:addEventListener ("touch", hyperLink)

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

