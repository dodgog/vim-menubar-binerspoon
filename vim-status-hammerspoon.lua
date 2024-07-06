local currentMode = "00"

local menu = hs.menubar.new()
menu:setTitle("vim")

function updateDisplay(mode)
    currentMode = mode
    local vimMode = mode:sub(1, 1)
    local visualMode = mode:sub(2, 2)
    
    local displayText = ""
    
    if vimMode == "0" then
        displayText = "INSERT" -- Input mode
    elseif vimMode == "1" then
        displayText = "NORMAL" -- Normal mode
    else
        hs.alert.show("Invalid mode. First digit must be '0' or '1'.")
        return
    end
    
    if visualMode == "1" then
        displayText = "VISUAL"
    elseif visualMode ~= "0" then
        hs.alert.show("Invalid mode. Second digit must be '0' or '1'.")
        return
    end
    
    menu:setTitle(displayText)
end

-- Binding a URL event to update the mode
hs.urlevent.bind("set-vim-mode", function(eventName, params)
    local mode = params and params["mode"]
    if mode and mode:match("^[01][01]$") then -- validate mode '00', '01', '10', '11'
        updateDisplay(mode)
    else
        hs.alert.show("Invalid mode. Only '00', '01', '10', '11' are allowed.")
    end
end)

updateDisplay("00")