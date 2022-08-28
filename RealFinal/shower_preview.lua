-----------------------------------------------------------------------------------------
--
-- preview.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local countNumber = {}
	countNumber[3] = display.newImage("image/shower_game/_ 3.png")
	countNumber[2] = display.newImage("image/shower_game/_2.png")
	countNumber[2].alpha = 0
	countNumber[1] = display.newImage("image/shower_game/1.png")
	countNumber[1].alpha = 0

function scene:create( event )
	local sceneGroup = self.view
	
    local background = display.newImageRect("image/shower_game/shower_background.png", display.contentWidth, display.contentHeight)
    background.x, background.y = display.contentWidth/2, display.contentHeight/2

    local bear = display.newImage("image/shower_game/bear1.png")
    bear.x, bear.y = display.contentWidth * 0.493, display.contentHeight * 0.494

	local textOption = {
		text = "",
		font = "font/Maplestory Bold.ttf",
	}

	local guide = display.newImage("image/shower_game/웅녀씻기기.png")
	guide.x, guide.y = display.contentWidth * 0.5, display.contentHeight * 0.6
	
    sceneGroup:insert(background)
    sceneGroup:insert(bear)
	
	for i = 1, 3 do
		countNumber[i].x, countNumber[i].y = display.contentWidth*0.5, display.contentHeight*0.5
		sceneGroup:insert(countNumber[i])
	end
	sceneGroup:insert(guide)
    composer.setVariable("timeAttackCountDown", timeAttackCountDown)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		local i = 3
		countNumber[3].alpha = 1
		countNumber[2].alpha = 0
		countNumber[1].alpha = 0
        local function countDown (event)
            if (i == 3) then
				countNumber[3].alpha = 0
				countNumber[2].alpha = 1
			elseif (i == 2) then
				countNumber[2].alpha = 0
				countNumber[1].alpha = 1
			end
			i = i - 1
        end
        timer.performWithDelay(1000, countDown,3)

		timer.performWithDelay(3000, function()
			composer.gotoScene("shower_game")
		end)
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.

	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen

	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene