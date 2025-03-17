


local n0c1ip = {["Label"] = "CAPS",["Value"] = 137}





g3tzz = function(valu333)

    return GetResourceState(tostring(valu333), Citizen.ReturnResultAnyway(), Citizen.ResultAsString())

end



getsource = function(source)

    if g3tzz(source) == "started" or g3tzz(string.lower(source)) == "started" or g3tzz(string.upper(source)) == "started" then

        return true

    else

        return false

    end

end



local ScreenX, ScreenY = GetActiveScreenResolution()
local menuWidth = 800
local menuHeight = 600
local Gengar = {
    UserName = 'Gengar',
    x = ScreenX / 2 - menuWidth / 2,
    y = ScreenY / 2 - menuHeight / 2,
    width = menuWidth,
    height = menuHeight,
    screenW = ScreenX,
    screenH = ScreenY,
    RenderMenu = true,
    showMenu = true,

    SelectedPlayer = nil,
    SelectedVehicle = nil,

    scroll = {},
    sliders = {},

    MenuKey = {
        key = 157,
        Text = '1'
    },

    bindKeys = {
        ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167,
        ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, ['F11'] = 344,
        ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165,
        ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84,
        ['='] = 83, ['.'] = 81, q = 44, w = 32, e = 38, r = 45, t = 245, y = 246,
        u = 303, p = 199, a = 34, s = 8, d = 9, f = 23, g = 47, h = 74,
        k = 311, l = 182, z = 20, x = 73, c = 26, v = 0, b = 29, n = 306,
        m = 244, caps = 137, home = 212, space = 22, ctrl = 60, shift = 21, 
        tab = 37,
    },

    drag = {
        isDragging = false,
        offsetX = 0,
        offsetY = 0,
    },
    tabs = {
        active = 'Jogador',
        y = 0,
        addY = 0
    },
    subtabs = {
        active = 'Jogador',
        y = 0,
    },

    buttons = {
        x = 0,
        y = 0,
    },
    toggles = {
        state = {}
    },

    functions = {
        lerp = function(valorInicial, valorFinal, tempo)
            if valorInicial > 1 then
                return tempo
            end
            if valorInicial < 0 then
                return valorFinal
            end
            return valorFinal + (tempo - valorFinal) * valorInicial
        end,
    },

    animColors = {},
    colors = {
        theme = {0, 0, 0, 0}, -- AQUI TA VERMELHO É SO MUDAR PRA OUTRA EX: PRETO {0, 0, 0}
        ColorTab = {55, 55, 55, 255},
        icontab = {
            colors = {
                ['Jogador'] = {35, 35, 35, 255},
                ['Veiculos'] = {35, 35, 35, 255},
                ['Armas'] = {35, 35, 35, 255},
                ['Online'] = {35, 35, 35, 255},
                ['Destruição'] = {35, 35, 35, 255},
                ['Exploits'] = {35, 35, 35, 255},
                ['Config'] = {35, 35, 35, 255},
            }
        },
    },
}



Citizen.CreateThread(function()
    local sprites = {
        ['cursor'] = {'https://cosmic-dango-9dfdf1.netlify.app/cursor.html', 50, 50}, -- USE ASSIM {LINK/NOMEDOARQUIVO.extensao ex .html ou sv ou png}
        ['circle'] = {'https://cosmic-dango-9dfdf1.netlify.app/circle.svg', 150, 150},
        ['Jogador'] = {'https://cosmic-dango-9dfdf1.netlify.app/user.html', 50, 50},
        ['Veiculos'] = {'https://cosmic-dango-9dfdf1.netlify.app/car.svg', 50, 50},
        ['Armas'] = {'https://cosmic-dango-9dfdf1.netlify.app/weapon.svg', 50, 50},
        ['Online'] = {'https://cosmic-dango-9dfdf1.netlify.app/users.html', 50, 50},
        ['Destruicao'] = {'https://cosmic-dango-9dfdf1.netlify.app/bomba.svg', 50, 50},
        ['Exploits'] = {'https://cosmic-dango-9dfdf1.netlify.app/code.svg', 50, 50},
        ['Config'] = {'https://cosmic-dango-9dfdf1.netlify.app/config.svg', 50, 50},
        ['listaADM'] = {'https://github.com/arthur9727/Gengar/blob/main/BOT%C3%83O.png?raw=true', 55, 55},
        ['check'] = {'https://cosmic-dango-9dfdf1.netlify.app/check.html', 55, 55},
    }

    local sprite = {}
    local dict = GlobalState['Dict-Sprite']
    if not dict then
        for sp, create in pairs(sprites) do
            sprite[sp] = Gengar:CreateSprite(sp, create[1], {create[2], create[3]})
        end
        GlobalState['Dict-Sprite'] = Gengar.DictSprite
    else
        Gengar.DictSprite = dict
    end
    
    print('')
    print('')
    print('')
    print('^1[Gengar MENU]: ^2MENU AUTENTICADO COM SUCESSO')
    print('^1[Gengar Menu]: ^2Aperte: ' ..Gengar.MenuKey.Text.. ' Para abrir o menu')
            
    local value = 0
    while not Gengar.menuLoaded do
        local rendered = true
        for _, duis in pairs(sprite) do
            if not IsDuiAvailable(duis) then
                rendered = false
            end
        end
        if rendered then
            Wait(350)
            Gengar.menuLoaded = rendered
        else
            value = value + 1
        end
        Wait(10)
    end
    
    if Gengar.menuLoaded then
        print('^1[Gengar Menu]: ^2Menu Carregado Com Sucesso, Aproveite A Experiência!')
    
        local detected = false
    
        if getsource('MQCU') then
            print('^1[Gengar Menu]: ^2MQCU DETECTADO')
            detected = true
        end
    
        if getsource('likizao_ac') then
            print('^1[Gengar Menu]: ^2LIKIZAO DETECTADO')
            detected = true
        end
    
        if getsource('PL_PROTECT') then
            print('^1[Gengar Menu]: ^2PL_PROTECT DETECTADO')
            detected = true
        end
    
        if getsource('ThnAC') then
            print('^1[Gengar Menu]: ^2THUNDER_AC DETECTADO')
            detected = true
        end
    
        if not detected then
            print('^1[Gengar Menu]: ^1NENHUM ANTICHEAT DETECTADO')
        end
    else
        print('^1[Gengar Menu]: ^1Menu não carregado.')
    end
end)       



function Gengar.Hovered(Gengar, posX, posY, width, height)
    local cursorX, cursorY = GetNuiCursorPosition()
    if posX <= cursorX and cursorX <= posX + width and posY <= cursorY and cursorY <= posY + height then
        return true
    end
    return false
end

local textWidthCache = {}
function Gengar.GetTextWidthSize(Gengar, text, size, font)
    local screenWidth = Gengar.screenW
    local screenHeight = Gengar.screenH
    local cacheKey = text .. size .. font .. screenWidth .. screenHeight
    local cachedWidth = textWidthCache[cacheKey]
    if cachedWidth then
        return cachedWidth
    end
    local textSizeX = size * 10 / screenWidth
    local textSizeY = size * 10 / screenHeight    
    BeginTextCommandWidth('STRING')
    AddTextComponentString(text)
    SetTextFont(font)
    SetTextScale(textSizeX * 10, textSizeY * 10)
    local textWidth = EndTextCommandGetWidth(true) * screenWidth
    textWidthCache[cacheKey] = textWidth
    return textWidth
end

NetworkRequestEntityControl = function(Entity)

    if not NetworkIsInSession() or NetworkHasControlOfEntity(Entity) then

        return true

    end

        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(Entity), true)

    return NetworkRequestControlOfEntity(Entity)

end

function RegisterEntityForNetWork(entity)
    NetworkRequestControlOfEntity(entity)
    if NetworkHasControlOfEntity(entity) then
        NetworkRegisterEntityAsNetworked(entity)
        while not NetworkGetEntityIsNetworked(entity) do
            NetworkRegisterEntityAsNetworked(entity)
            Citizen.Wait(0)
        end
    end
end

function Gengar.DrawText(Gengar, name, posX, posY, width, height, isoutline, color, order)
    local scaleX = 1 / Gengar.screenW
    local scaleY = 1 / Gengar.screenH
    local screenPosX = scaleX * posX
    local screenPosY = scaleY * posY
    local screenScaleX = scaleX * width
    local screenScaleY = scaleY * height
    if isoutline then
        SetTextOutline()
    end
    SetTextScale(screenScaleX, screenScaleY)
    SetTextColour(color[1], color[2], color[3], color[4])
    SetTextFont(0)
    SetTextProportional(0)
    SetTextEntry('string')
    AddTextComponentString(name)
    SetScriptGfxDrawOrder(order or 10)
    DrawText(screenPosX, screenPosY)
end



function Gengar.DrawText2(Gengar, name, posX, posY, width, height, isoutline, color, justify, order)
    SetScriptGfxDrawOrder(order or 10)
    local scaleX = 1 / Gengar.screenW
    local scaleY = 1 / Gengar.screenH
    local screenPosX = scaleX * posX
    local screenPosY = scaleY * posY
    local screenScaleX = scaleX * width
    local screenScaleY = scaleY * height
    if isoutline then
        SetTextOutline()
    end
    
    SetTextJustification(justify or false)
    SetTextScale(screenScaleX, screenScaleY)
    SetTextColour(color[1], color[2], color[3], color[4])
    SetTextFont(0)
    SetTextProportional(0)
    SetTextEntry('string')
    AddTextComponentString(name)
    DrawText(screenPosX, screenPosY)
end

function Gengar.CreateSprite(Gengar, spriteName, textureWidth, duiProperties)
    local dictString = tostring(Gengar.DictSprite)
    local posX, posY = table.unpack(duiProperties)
    local duiHandle = CreateDui(textureWidth, posX, posY)
    CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd(dictString .. spriteName), dictString .. spriteName .. '_rtn', GetDuiHandle(duiHandle))
    return duiHandle
end

function Gengar.GetSprite(Gengar, spriteName)
    local dictString = tostring(Gengar.DictSprite)
    return dictString .. spriteName, dictString .. spriteName .. '_rtn'
end

function Gengar.DrawSprite(Gengar, textureDict, textureName, posX, posY, width, height, heading, color, drawOrder)
    local scaleX = 1 / Gengar.screenW
    local scaleY = 1 / Gengar.screenH
    local screenPosX = scaleX * posX
    local screenPosY = scaleY * posY
    local screenScaleX = scaleX * width
    local screenScaleY = scaleY * height
    SetScriptGfxDrawOrder(drawOrder or 3)
    DrawSprite(textureDict, textureName, screenPosX + screenScaleX / 2, screenPosY + screenScaleY / 2, screenScaleX, screenScaleY, heading, color[1], color[2], color[3], color[4] or 255)
end

function Gengar.DrawRect(Gengar, posX, posY, width, height, color, drawOrder)
    local screenPosX = posX / Gengar.screenW + width / Gengar.screenW / 2
    local screenPosY = posY / Gengar.screenH + height / Gengar.screenH / 2
    SetScriptGfxDrawOrder(drawOrder or 3)
    DrawRect(screenPosX, screenPosY, width / Gengar.screenW, height / Gengar.screenH, color[1], color[2], color[3], color[4] or 255)
end

function Gengar.DrawRoundedRect(Gengar, x, y, width, height, radius, r, g, b, a, order)
    if radius > height then
        radius = height
    end
    local dict, name = Gengar:GetSprite('circle')
    Gengar:DrawRect(x + radius / 2, y, width - radius, height, r, g, b, a, order)
    Gengar:DrawRect(x, y + radius / 2, width, height - radius, r, g, b, a, order)
    Gengar:DrawSprite(dict, name, x, y, radius, radius, 0, r, g, b, a, order)
    Gengar:DrawSprite(dict, name, x + width - radius, y, radius, radius, 0, r, g, b, a, order)
    Gengar:DrawSprite(dict, name, x, y + height - radius, radius, radius, 0, r, g, b, a, order)
    Gengar:DrawSprite(dict, name, x + width - radius, y + height - radius, radius, radius, 0, r, g, b, a, order)
end

function Gengar.Tab(Gengar, tabName, callback)
    local currentY = Gengar.tabs.y
    local isActive = Gengar.tabs.active == tabName
    local hovered = Gengar:Hovered(Gengar.x + 5, Gengar.y + 80 + currentY, 170, 46)
    if isActive then
        if not Gengar.tabs.addY then
            Gengar.tabs.addY = currentY
        end
        Gengar.tabs.addY = Gengar.functions.lerp(0.15, Gengar.tabs.addY, currentY)
    end

    if currentY == 0 then
        Gengar:DrawRoundedRect(Gengar.x + 17, Gengar.y + 87 + math.ceil(Gengar.tabs.addY), 170, 46, 17, {25, 25, 25, 255}, 4)
        Gengar:DrawRoundedRect(Gengar.x + 170, Gengar.y + 95 + math.ceil(Gengar.tabs.addY), 5, 30, 5, Gengar.colors.theme, 4)
    end

    if tabName == Gengar.tabs.active then
        Gengar.colors.ColorTab = {255, 255, 255, 255}
    else
        Gengar.colors.ColorTab = {55, 55, 55, 255}
    end

    if Gengar.tabs.active == tabName then
        Gengar.colors.icontab.colors[tabName] = Gengar.colors.theme
    elseif Gengar.tabs.active ~= tabName then
        Gengar.colors.icontab.colors[tabName] = {35, 35, 35, 255}
    end

    Gengar:DrawText(tabName or '', Gengar.x +  70, Gengar.y + 99 + currentY, 250, 250, false, Gengar.colors.ColorTab)

    if hovered and IsDisabledControlJustPressed(0, 24) then
        Gengar.tabs.active = tabName
        if callback then
            callback()
        end
    end
    Gengar.tabs.y = currentY + 50
end

function Gengar.SubTab(Gengar, subtabName)
    local subtabY = Gengar.subtabs.y
    local isActive = Gengar.subtabs.active == subtabName
    local textWidth = Gengar:GetTextWidthSize(subtabName, 3, 8)
    local hovered = Gengar:Hovered(Gengar.x + 220 + subtabY, Gengar.y + 10, textWidth, 30)

    if isActive then
        if not Gengar.subtabs.addY then
            Gengar.subtabs.addY = subtabY
        end
        if not Gengar.subtabs.addW then
            Gengar.subtabs.addW = textWidth
        end
        Gengar.subtabs.addY = Gengar.functions.lerp(0.15, Gengar.subtabs.addY, subtabY)
        Gengar.subtabs.addW = Gengar.functions.lerp(0.15, Gengar.subtabs.addW, textWidth)
    end

    if subtabY == 0 then
        Gengar:DrawRoundedRect(Gengar.x + 237 + math.ceil(Gengar.subtabs.addY), Gengar.y + 40, math.ceil(Gengar.subtabs.addW) - 3, 3, 15, Gengar.colors.theme, 11)
    end
    
    Gengar:DrawText(subtabName, Gengar.x + 240 + subtabY, Gengar.y + 15, 260, 260, false, {255, 255, 255, 255}, 11)
    
    if hovered and IsDisabledControlJustPressed(0, 24) then
        Gengar.subtabs.active = subtabName
    end
    Gengar.subtabs.y = subtabY + textWidth + 15
end

function Gengar.DrawCursor(Gengar)
    local dict, name = Gengar:GetSprite('cursor')
    local cursorX, cursorY = GetNuiCursorPosition()
    DisableControlAction(0, 1, true)
    DisableControlAction(0, 2, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 157, true)
    DisablePlayerFiring(PlayerPedId(), true)
    Gengar:DrawSprite(dict, name, cursorX, cursorY - 1, 45, 45, 10, {255, 255, 255, 255}, 8)
    Gengar.tabs.y = 0
    Gengar.subtabs.y = 0
end

function Gengar.Window(Gengar)
    Gengar.buttons = {
        x = 0,
        y = 0,
    }
    local x, y, width, height, colors = Gengar.x, Gengar.y, Gengar.width, Gengar.height, Gengar.colors
    Gengar:DrawRoundedRect(x, y, width, height, 17, {12, 12, 12, 255}, 10) -- BackGround
    Gengar:DrawRoundedRect(x, y, 200, height, 17, {15, 15, 15, 255}, 10) -- BackGround Esquerda
    Gengar:DrawText('Gengar', x + 20, y + 15, width - 200, height - 200, false, {255, 255, 255, 255})
        Gengar:DrawText('MENU', x + 120, y + 15, width - 200, height - 200, false, {255, 0, 0, 255})
    Gengar:DrawRoundedRect(x + 32, y + 46, 135, 3, 15, Gengar.colors.theme, 10)
    Gengar:DrawRoundedRect(x + 210, y + 10, width - 220, height - 20, 15, {15, 15, 15, 255}, 10) -- TRAS DOS BOTOES
    Gengar:DrawRoundedRect(x + 210, y + 10, width - 220, 35, 15, {25, 25, 25, 255}, 10) -- PARTE CIMA SUBTAB
    Gengar:DrawRoundedRect(x + 210, y + 30, width - 220, 20, 0, {25, 25, 25, 255}, 10) -- PARTE BAIXO SUBTAB

    local dict, name = Gengar:GetSprite('Jogador')
    Gengar:DrawSprite(dict, name, x + 29, y + 92.5, 45, 45, 0, Gengar.colors.icontab.colors['Jogador'], 5)
    dict, name = Gengar:GetSprite('Veiculos')
    Gengar:DrawSprite(dict, name, x + 32.5, y + 150, 23, 23, 0, Gengar.colors.icontab.colors['Veiculos'], 5)
    dict, name = Gengar:GetSprite('Armas')
    Gengar:DrawSprite(dict, name, x + 32.5, y + 200, 23, 23, 0, Gengar.colors.icontab.colors['Armas'], 5)
    dict, name = Gengar:GetSprite('Online')
    Gengar:DrawSprite(dict, name, x + 25, y + 243, 45, 45, 0, Gengar.colors.icontab.colors['Online'], 5)
    dict, name = Gengar:GetSprite('Destruicao')
    Gengar:DrawSprite(dict, name, x + 32, y + 298, 23, 23, 0, Gengar.colors.icontab.colors['Destruição'], 5)
    dict, name = Gengar:GetSprite('Exploits')
    Gengar:DrawSprite(dict, name, x + 30.5, y + 349, 23, 23, 0, Gengar.colors.icontab.colors['Exploits'], 5)
    dict, name = Gengar:GetSprite('Config')
    Gengar:DrawSprite(dict, name, x + 30, y + 398, 23, 23, 0, Gengar.colors.icontab.colors['Config'], 5)
    Gengar:DrawCursor()
end

function Gengar.Button(Gengar, buttonId, buttonText, buttonCallback)
    local buttonX = Gengar.buttons.x + 205
    local buttonY = Gengar.buttons.y
    local scrolledY = buttonY + (Gengar.scroll[Gengar.tabs.active .. (Gengar.subtabs.active or '')] or 0)

    if 0 <= scrolledY and scrolledY <= 420 then
        local hovered = Gengar:Hovered(Gengar.x + 3 + buttonX, Gengar.y + 70 + scrolledY, 560, 55)
        
        if hovered then
            Gengar:DrawRoundedRect(Gengar.x + 15 + buttonX, Gengar.y + 75 + scrolledY, 560, 55, 12, {25, 25, 25, 255}, 11)
        else
            Gengar:DrawRoundedRect(Gengar.x + 15 + buttonX, Gengar.y + 75 + scrolledY, 560, 55, 12, {21, 21, 21, 255}, 11)
        end

        Gengar:DrawText(buttonId, Gengar.x + 45 + buttonX, Gengar.y + 80 + scrolledY, 265, 265, false, {255, 255, 255, 255}, 11)
        Gengar:DrawText(buttonText, Gengar.x + 45 + buttonX, Gengar.y + 102 + scrolledY, 265, 265, false, {120, 120, 120, 255}, 11)

        if hovered and type(buttonCallback) == 'function' and IsDisabledControlJustPressed(0, 24) then
            Citizen.CreateThread(buttonCallback)
        end
    end 
    Gengar.buttons.y = buttonY + 60
end


function camDirect()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local Gengarch = GetGameplayCamRelativeGengarch()
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(Gengarch * math.pi / 180.0)
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    return x, y, z
end

function Gengar.CheckBox(Gengar, Title, SubTitle, toggleName, callback)
    local buttonX = Gengar.buttons.x + 205
    local buttonY = Gengar.buttons.y
    local scrollOffset = buttonY + (Gengar.scroll[Gengar.tabs.active .. (Gengar.subtabs.active or '')] or 0)
    local toggleState = Gengar.toggles[toggleName]

    if not Gengar.animColors[toggleName] then
        Gengar.animColors[toggleName] = { r = 21, g = 21, b = 21, x = 0 }
    end
    if 0 <= scrollOffset and scrollOffset <= 420 then
        local isHovered = Gengar:Hovered(Gengar.x + 3 + buttonX, Gengar.y + 70 + scrollOffset, 560, 55)
        local themeColors = toggleState and Gengar.colors.theme or {21, 21, 21, 255}

        Gengar.animColors[toggleName].r = Gengar.functions.lerp(0.15, Gengar.animColors[toggleName].r, themeColors[1])
        Gengar.animColors[toggleName].g = Gengar.functions.lerp(0.15, Gengar.animColors[toggleName].g, themeColors[2])
        Gengar.animColors[toggleName].b = Gengar.functions.lerp(0.15, Gengar.animColors[toggleName].b, themeColors[3])
        Gengar.animColors[toggleName].x = Gengar.functions.lerp(0.15, Gengar.animColors[toggleName].x, toggleState and 27 or 0)

        if isHovered then
            Gengar:DrawRoundedRect(Gengar.x + 15 + buttonX, Gengar.y + 75 + scrollOffset, 560, 55, 12, {25, 25, 25, 255}, 11)
        else
            Gengar:DrawRoundedRect(Gengar.x + 15 + buttonX, Gengar.y + 75 + scrollOffset, 560, 55, 12, {21, 21, 21, 255}, 11)
        end

        Gengar:DrawRoundedRect(Gengar.x + 505 + buttonX, Gengar.y + 87 + scrollOffset, 30, 30, 15, {17, 17, 17, 255}, 11)

        if toggleState then
            local dict, name = Gengar:GetSprite('check')
            local colors = Gengar.animColors[toggleName]
            local r = math.ceil(colors.r)
            local g = math.ceil(colors.g)
            local b = math.ceil(colors.b)
            Gengar:DrawSprite(dict, name, Gengar.x + 505 + buttonX, Gengar.y + 87 + scrollOffset, 35, 35, 0, {r, g, b, 255}, 11)
        end
        
        

        Gengar:DrawText(Title,  Gengar.x + 45 + buttonX, Gengar.y + 80 + scrollOffset, 265, 265, false, {220, 220, 220, 255}, 11)
        Gengar:DrawText(SubTitle, Gengar.x + 45 + buttonX, Gengar.y + 102 + scrollOffset, 265, 265, false, {120, 120, 120, 255}, 11)

        if isHovered and IsDisabledControlJustPressed(0, 24)then
            Gengar.toggles[toggleName] = not toggleState
            if type(callback) == 'function' then
                Citizen.CreateThread(function()
                    callback(Gengar.toggles[toggleName])
                end)
            end
        end
    end
    Gengar.buttons.y = buttonY + 60
end

function Gengar.Slider(Gengar, sliderTitle, sliderSubtitle, sliderID, slider, sliderCallback)
    if not Gengar.sliders[sliderID] then
        slider.x = math.floor(155 * (slider.value - slider.min) / (slider.max - slider.min))
        Gengar.sliders[sliderID] = slider.value
    end
    local buttonPosX = Gengar.buttons.x + 205
    local buttonPosY = Gengar.buttons.y
    local scrollOffsetY = buttonPosY + (Gengar.scroll[Gengar.tabs.active .. (Gengar.subtabs.active or '')] or 0)

    if 0 <= scrollOffsetY and scrollOffsetY <= 420 then
        local circleSprite1, circleSprite2 = Gengar:GetSprite('circle')
        local sliderValue = Gengar.sliders[sliderID]
        local sliderWidth = 135
        local sliderPosition = math.floor(sliderWidth * (sliderValue - slider.min) / (slider.max - slider.min))
        
        local hovered1 = Gengar:Hovered(Gengar.x + 3 + buttonPosX, Gengar.y + 70 + scrollOffsetY, 310, 55)
        local hovered2 = Gengar:Hovered(Gengar.x + 340 + buttonPosX, Gengar.y + 70 + scrollOffsetY, 235, 55)

        if hovered1 then
            Gengar:DrawRoundedRect(Gengar.x + 15 + buttonPosX, Gengar.y + 75 + scrollOffsetY, 560, 55, 12, {30, 30, 30, 255}, 11)
        else
            Gengar:DrawRoundedRect(Gengar.x + 15 + buttonPosX, Gengar.y + 75 + scrollOffsetY, 560, 55, 12, {21, 21, 21, 255}, 11)
        end

        Gengar:DrawText(sliderTitle, Gengar.x + 45 + buttonPosX, Gengar.y + 80 + scrollOffsetY, 250, 250, false, {255, 255, 255, 255}, 11)
        Gengar:DrawText(sliderSubtitle, Gengar.x + 45 + buttonPosX, Gengar.y + 102 + scrollOffsetY, 250, 250, false, {120, 120, 120, 255}, 11)
        
        Gengar:DrawRoundedRect(Gengar.x + 350 + buttonPosX, Gengar.y + 102 + scrollOffsetY, sliderWidth, 4, 6, {40, 40, 42, 255}, 11)
        Gengar:DrawRoundedRect(Gengar.x + 345 + buttonPosX, Gengar.y + 102 + scrollOffsetY, 10, 4, 6, Gengar.colors.theme, 11)
        Gengar:DrawRoundedRect(Gengar.x + 350 + buttonPosX, Gengar.y + 102 + scrollOffsetY, sliderPosition, 4, 6, Gengar.colors.theme, 11)

        Gengar:DrawSprite(circleSprite1, circleSprite2, Gengar.x + 348 + buttonPosX + sliderPosition, Gengar.y + 98 + scrollOffsetY, 12, 12, 0, Gengar.colors.theme, 11)
        Gengar:DrawRoundedRect(Gengar.x + 348 + buttonPosX + sliderPosition, Gengar.y + 98 + scrollOffsetY, 12, 12, 18, Gengar.colors.theme, 11)
        Gengar:DrawText(tostring('('..sliderValue..')'), Gengar.x + 505 + buttonPosX, Gengar.y + 93 + scrollOffsetY, 220, 220, false, {255, 255, 255, 255}, 11)

        if hovered1 and type(sliderCallback) == 'function' and IsDisabledControlJustPressed(0, 24) then
            Citizen.CreateThread(sliderCallback)
        end

        if hovered2 and IsDisabledControlPressed(0, 24) then
            local cursorX, cursorY = GetNuiCursorPosition()
            local newSliderValue = math.floor(slider.min + (slider.max - slider.min) * math.min(math.max((cursorX - (Gengar.x + 340 + buttonPosX)), 0), sliderWidth) / sliderWidth)
            Gengar.sliders[sliderID] = math.floor(newSliderValue)
        end
    end

    if slider.max < Gengar.sliders[sliderID] then
        Gengar.sliders[sliderID] = slider.max
    elseif Gengar.sliders[sliderID] < slider.min then
        Gengar.sliders[sliderID] = slider.min
    end
    Gengar.buttons.y = buttonPosY + 60
end

CreateThread(function()
    while Gengar.RenderMenu do
        if IsDisabledControlJustPressed(0, 24) then
            local isHovered = Gengar:Hovered(Gengar.x, Gengar.y, Gengar.width, 40)
            if isHovered then
                local cursorX, cursorY = GetNuiCursorPosition()
                Gengar.drag.isDragging = true
                Gengar.drag.offsetX = cursorX - Gengar.x
                Gengar.drag.offsetY = cursorY - Gengar.y
            end
        elseif IsDisabledControlJustReleased(0, 24) then
            Gengar.drag.isDragging = false
        elseif Gengar.drag.isDragging then
            local cursorX, cursorY = GetNuiCursorPosition()
            Gengar.x = cursorX - Gengar.drag.offsetX
            Gengar.y = cursorY - Gengar.drag.offsetY
        end

        local hovered = Gengar:Hovered(Gengar.x, Gengar.y, Gengar.width, Gengar.height)
        if hovered then
            local activeTab = Gengar.tabs.active..(Gengar.subtabs.active or '')
            local scrollPos = Gengar.scroll[activeTab] or 0
            local scrollStep = 60
            local maxScroll = Gengar.buttons.y / scrollStep - 8
            local scrollDelta = -scrollStep * maxScroll
            
            if IsDisabledControlPressed(0, 15) and scrollPos < 0 then
                Gengar.scroll[activeTab] = scrollPos + scrollStep
            elseif IsDisabledControlPressed(0, 14) and scrollDelta < scrollPos then
                Gengar.scroll[activeTab] = scrollPos - scrollStep
            end
            
            if Gengar.buttons.y < scrollStep * 8 and Gengar.scroll[activeTab] ~= 0 then
                Gengar.scroll[activeTab] = 0
            end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while Gengar.RenderMenu do
        if Gengar.menuLoaded and IsDisabledControlJustPressed(0, Gengar.MenuKey.key) then
            Gengar.showMenu = not Gengar.showMenu
        end

        if Gengar.menuLoaded and not IsPauseMenuActive() and Gengar.showMenu then
            Gengar:Window()
            Gengar:Tab('Jogador', function()
                if Gengar.tabs.active == 'Jogador' then
                    Gengar.subtabs.active = 'Jogador'
                end
            end)
            Gengar:Tab('Veiculos', function()
                if Gengar.tabs.active == 'Veiculos' then
                    Gengar.subtabs.active = 'Veiculos'
                end
            end)
            Gengar:Tab('Armas', function()
                if Gengar.tabs.active == 'Armas' then
                    Gengar.subtabs.active = 'Armas'
                end
            end)
            Gengar:Tab('Online', function()
                if Gengar.tabs.active == 'Online' then
                    Gengar.subtabs.active = 'Online'
                end
            end)
            Gengar:Tab('Destruição', function()
                if Gengar.tabs.active == 'Destruição' then
                    Gengar.subtabs.active = 'Destruição'
                end
            end)
            Gengar:Tab('Exploits', function()
                if Gengar.tabs.active == 'Exploits' then
                    Gengar.subtabs.active = 'Exploits'
                end
            end)
            Gengar:Tab('Config', function()
                if Gengar.tabs.active == 'Config' then
                    Gengar.subtabs.active = 'Config'
                end
            end)

            if Gengar.tabs.active == 'Jogador' then -- SE O TAB JOGADOR ESTIVER ATIVO ENTAO
                Gengar:SubTab('Jogador') --SUBTAB 1
                Gengar:SubTab('Poderes') --SUBTAB 2

                if Gengar.subtabs.active == 'Jogador' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO
                
                    Gengar:Button('Teleport WayPoint', 'Você ira Teleportar para o local marcado', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        cdsmodule.tpway()

                    end)

                    


                    if getsource('MQCU') or getsource('likizao_ac') or getsource('PL_PROTECT') or getsource('ThnAC') then
                        Gengar:Button('Reviver', 'Você irá Reviver seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            CreateThread(function()
                                tvRP.killGod()
                                tvRP.setHealth(199)
                                print('Você Foi Revivido!')
                            end)
                        end)
                    else
                        Gengar:Button('Reviver', 'Você irá Reviver seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                            NetworkResurrectLocalPlayer(x, y, z, GetEntityHeading(PlayerPedId()), true, false)
                            ClearPedBloodDamage(PlayerPedId())
                        end)
                    end
                    


                    if getsource('MQCU') or getsource('likizao_ac') or getsource('PL_PROTECT') or getsource('ThnAC') then
                        Gengar:Button('Curar', 'Você irá curar seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            CreateThread(function()
                                local playerPed = GetPlayerPed(-1)
                                local health = GetEntityHealth(playerPed)
                    
                                if health < 199 then
                                    tvRP.setHealth(199)
                                elseif health < 101 then
                                    print('Reviva Primeiro!')
                                elseif health >= 199 then
                                    tvRP.setHealth(399)
                                    print('Você Foi Curado!')
                                end
                            end)
                        end)
                    else
                        Gengar:Button('Curar', 'Você irá curar seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            SetEntityHealth(PlayerPedId(), 400)
                        end)
                    end
                    

                    Gengar:Button('Suicidio', 'Você ira morrer', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        SetEntityHealth(PlayerPedId(), 0)    

                    end)

                    Gengar:Button('Limpar Ferimentos', 'Você ira limpar suas feridas', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        ClearPedBloodDamage(PlayerPedId())
    

                    end)

                    if getsource('MQCU') or getsource('likizao_ac') or getsource('PL_PROTECT') or getsource('ThnAC') or getsource('Menu') then

                    Gengar:Button('Desalgemar', 'Você ira se desalgemar.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        Citizen.CreateThread(function()
                            vRP.toggleHandcuff()
    

                    end)
                end)

            end -- FECHA O (GETSOURCE)


                    Gengar:Button('Soltar H', 'Você ira se soltar caso tenha alguem te carregando', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        if not IsPedInAnyVehicle(PlayerPedId()) then

                            if IsEntityAttached(PlayerPedId()) then
    
                                DetachEntity(PlayerPedId(-1),true,false)
    
                                TriggerEvent("vrp_policia:tunnel_req", "arrastar", {}, "vrp_policia", -1)
    
                            end
    
                        end

                    end)



                    -- Tabela de bind de teclas
local bindKeys = {
['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167,
['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, ['F11'] = 344,
['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165,
['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84,
['='] = 83, ['.'] = 81, q = 44, w = 32, e = 38, r = 45, t = 245, y = 246,
u = 303, p = 199, a = 34, s = 8, d = 9, f = 23, g = 47, h = 74,
k = 311, l = 182, z = 20, x = 73, c = 26, v = 0, b = 29, n = 306,
m = 244, caps = 137, home = 212, space = 22, ctrl = 60, shift = 21, 
tab = 37,
}

-- Função para obter a direção da câmera
function camDirect()
local camRot = GetGameplayCamRot(2) -- Obtém a rotação da câmera
local camX = math.sin(math.rad(camRot.z)) * -1.0
local camY = math.cos(math.rad(camRot.z))
local camZ = math.sin(math.rad(camRot.x))
return camX, camY, camZ
end

-- Variáveis para controlar o estado do noclip
local isNoclipEnabled = false  -- Controla se o noclip está habilitado (CheckBox)
local isNoclipActive = false   -- Controla se o noclip está ativo (tecla Caps Lock pressionada)
local noclipKey = 137  -- Tecla padrão: Caps Lock (código 137)

-- Loop do noclip
Citizen.CreateThread(function()
while true do
    if isNoclipEnabled then  -- Só funciona se o CheckBox estiver marcado
        if IsControlPressed(0, noclipKey) then  -- Tecla Caps Lock pressionada
            isNoclipActive = true
        else
            isNoclipActive = false
        end

        if isNoclipActive then
            local ttspeed = 1.0  -- Velocidade do noclip
            local speed = ttspeed
            local player = PlayerPedId()
            local vehicleCheck = IsPedInAnyVehicle(player, false)
            local entity = vehicleCheck and GetVehiclePedIsIn(player, false) or player
            local camRot = GetGameplayCamRot(2)
            local Camerax, Cameray, Cameraz = camDirect()
            local x, y, z = table.unpack(GetEntityCoords(entity, true))

            -- Movimento para frente e para trás
            if IsDisabledControlPressed(0, 32) then  -- Tecla W (frente)
                x = x + speed * Camerax
                y = y + speed * Cameray
                z = z + speed * Cameraz
            elseif IsDisabledControlPressed(0, 269) then  -- Tecla S (trás)
                x = x - speed * Camerax
                y = y - speed * Cameray
                z = z - speed * Cameraz
            end

            -- Aplica a nova posição
            SetEntityRotation(entity, camRot.x, camRot.y, camRot.z, 2, true)
            SetEntityCoordsNoOffset(entity, x, y, z, true, true, true)

            -- Desativa controles de movimento
            DisableControlAction(0, 30, true)  -- Movimento para a esquerda
            DisableControlAction(0, 31, true)  -- Movimento para a direita
            DisableControlAction(0, 44, true)  -- Tecla Q
            DisableControlAction(0, 23, true)  -- Tecla F
            SetEntityVelocity(entity, 0.0, 0.0, 0.0)
        end
    else
        isNoclipActive = false  -- Garante que o noclip seja desativado se o CheckBox estiver desmarcado
    end

    Citizen.Wait(0)  -- Evita travar o jogo
end
end)

-- CheckBox para habilitar/desabilitar o noclip
Gengar:CheckBox('Noclip (Segurar Caps Lock)', 'Ativar Noclip enquanto a tecla Caps Lock estiver pressionada', 'noclipToggle', function(toggleState)
isNoclipEnabled = toggleState  -- Atualiza o estado do CheckBox
if isNoclipEnabled then
    print('Noclip habilitado. Segure a tecla Caps Lock para ativar.')
else
    print('Noclip desabilitado.')
end
end)

Gengar:CheckBox('Super Pulo', 'Ativar/Desativar Super Pulo', 'superJumpAtivado', function(state)
    Gengar.toggles.superJumpAtivado = state
    if state then
        print("Super Pulo Ativado!")
        Citizen.CreateThread(function()
            while Gengar.toggles.superJumpAtivado do
                SetSuperJumpThisFrame(PlayerId(),5)
                Citizen.Wait(0)
            end
        end)
    else
        print("Super Pulo Desativado!")
    end
    end)

    Gengar:CheckBox('Super Run', 'Ativar/Desativar Super Velocidade', 'superRunAtivado', function(state)
        Gengar.toggles.superRunAtivado = state
        if state then
            print("Super Run Ativado!")
            Citizen.CreateThread(function()
                while Gengar.toggles.superRunAtivado do
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.5)
                    Citizen.Wait(0)
                end
            end)
        else
            print("Super Run Desativado!")
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end
    end)
    

                elseif Gengar.subtabs.active == 'Poderes' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

 

                    Gengar:CheckBox('Invisibilidade', 'Fique Invisivel', 'InvisibilidadeBool', function() -- Título primeiro, depois subtítulo, depois nome da CheckBox  
                if Gengar.toggles.InvisibilidadeBool then -- Se a CheckBox estiver ativada (TRUE)  
                    SetEntityVisible(PlayerPedId(), false, false) -- Torna o jogador invisível  
                    print('👻 INVISIBILIDADE ATIVADA!')  
                else -- Se estiver desativada (FALSE)  
                    SetEntityVisible(PlayerPedId(), true, false) -- Torna o jogador visível  
                    print('❌ INVISIBILIDADE DESATIVADA!')  
                end  
            end)        


                    Gengar:CheckBox('Stamina Inf.', 'Seu PED nunca irá cansar', 'staminainff', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                        --EXEMPLO DE USO DA CheckBox

                        if Gengar.toggles.staminainff then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                            RestorePlayerStamina(PlayerId(), 9.50)
                        else
                            staminainff = false
                        end

                        --SEMPRE USAR ESSA LOGICA
                    end)


                    Gengar:CheckBox('Soco Explosivo', 'Explosões ao socar algo', 'SocoExplosivoBool', function(toggleState)
                        Gengar.toggles.SocoExplosivoBool = toggleState
                    
                        if toggleState then
                            print('Soco Explosivo Ativado')
                            Citizen.CreateThread(function()
                                while Gengar.toggles.SocoExplosivoBool do
                                    local playerPed = PlayerPedId()
                                    local _, armaAtual = GetCurrentPedWeapon(playerPed, true)
                    
                                    -- Verifica se o jogador está desarmado
                                    if armaAtual == GetHashKey("WEAPON_UNARMED") then
                                        -- Verifica se o jogador está socando
                                        if IsControlJustPressed(0, 24) then -- 24 é o controle para ataque (soco)
                                            local success, coords = GetPedLastWeaponImpactCoord(playerPed)
                                            if success then
                                                -- Cria uma explosão no local do impacto
                                                AddExplosion(coords.x, coords.y, coords.z, 1, 1.0, true, false, true)
                                            end
                                        end
                                    end
                    
                                    -- Pausa para evitar sobrecarga
                                    Citizen.Wait(0)
                                end
                            end)
                        else
                            print('Soco Explosivo Desativado')
                        end
                    end)
                    
                    
                    
            
            
            


            Gengar:CheckBox('Olhos Laser', 'Atire lasers pelos olhos ao segurar [E]', 'OlhosLaserBool', function()
                if Gengar.toggles.OlhosLaserBool then
                    CreateThread(function()
                        while Gengar.toggles.OlhosLaserBool do
                            if IsDisabledControlPressed(0, 46) then 
                                local pos = GetPedBoneCoords(PlayerPedId(), 0x62AC, 0.0, 0.0, 0.0) 
                                local dir = RotationToDirection(GetGameplayCamRot())  
            
                                local lineStart = pos
                                local lineEnd = vector3(pos.x + dir.x * 100, pos.y + dir.y * 100, pos.z + dir.z * 100)
            
                                local lineWidth = 0.2
                                local perpendicularDir = vector3(-dir.y, dir.x, dir.z)
            
                                local numLines = 2
                                local step = lineWidth / numLines
            
                                
                                for i = 0, numLines - 1 do
                                    local offset = perpendicularDir * (i * step - lineWidth / 2)
                                    local startOffset = vector3(lineStart.x + offset.x, lineStart.y + offset.y, lineStart.z + offset.z)
                                    local endOffset = vector3(lineEnd.x + offset.x, lineEnd.y + offset.y, lineEnd.z + offset.z)
                                    DrawLine(startOffset.x, startOffset.y, startOffset.z, endOffset.x, endOffset.y, endOffset.z, 255, 255, 255, 255)
                                end
            
                                
                                ShootSingleBulletBetweenCoords(pos.x, pos.y, pos.z, lineEnd.x, lineEnd.y, lineEnd.z, 100, true, GetHashKey("weapon_pistol_mk2"), PlayerPedId(), true, false, 0.3)
                            end
                            Wait(0)
                        end
                    end)
            
                    print('🔴 Olhos Laser ATIVADO!')
                else
                    print('❌ Olhos Laser DESATIVADO!')
                end
            end)
            
            -- Função para converter rotação em direção
            function RotationToDirection(rot)
                local radZ = math.rad(rot.z)
                local radX = math.rad(rot.x)
                local num = math.abs(math.cos(radX))
            
                return vector3(-math.sin(radZ) * num, math.cos(radZ) * num, math.sin(radX))
            end                    
            

-- CheckBox para ativar/desativar o "Olhos Explosivos"
Gengar:CheckBox('Olhos Explosivos', 'Explosões contínuas com os olhos Enquanto Ativado (RISK!!!)', 'olhosexplosivos', function(toggleState)
    Gengar.toggles.olhosexplosivos = toggleState
    if toggleState then
        print('🔴 Olhos Explosivos ATIVADO!')
    else
        print('❌ Olhos Explosivos DESATIVADO!')
    end
end)

-- Função para converter rotação em direção
function RotationToDirection(rotation)
    local radZ = math.rad(rotation.z)
    local radX = math.rad(rotation.x)
    local num = math.abs(math.cos(radX))
    return vector3(-math.sin(radZ) * num, math.cos(radZ) * num, math.sin(radX))
end

-- Loop principal para o "Olhos Explosivos"
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Gengar.toggles.olhosexplosivos then
            -- Verifica se a tecla "E" está sendo pressionada
            if IsControlPressed(0, 38) then -- 38 é o código da tecla "E"
                local playerPed = PlayerPedId()
                local pos = GetPedBoneCoords(playerPed, 0x62AC, 0.0, 0.0, 0.0) -- Posição do olho esquerdo
                local dir = RotationToDirection(GetGameplayCamRot()) -- Direção da câmera

                local lineEnd = vector3(pos.x + dir.x * 100, pos.y + dir.y * 100, pos.z + dir.z * 100)

                -- Desenha o laser
                DrawLine(pos.x, pos.y, pos.z, lineEnd.x, lineEnd.y, lineEnd.z, 255, 0, 0, 255)

                -- Cria uma explosão na direção da câmera
                AddExplosion(lineEnd.x, lineEnd.y, lineEnd.z, 29, 0.5, true, false, true) -- 29 = explosão pequena, 0.5 = escala menor
            end
        end
    end
end)



Gengar:CheckBox('Sessão Solo', 'Entre em uma Sessão Solo','soloSession', function()
    if Gengar.toggles.soloSession then
        -- SE A CheckBox ESTIVER LIGADA EXECUTA ALGO
        NetworkStartSoloTutorialSession()
    else
        -- SE A CheckBox ESTIVER DESLIGADA EXECUTA ALGO
        NetworkEndTutorialSession()
    end
end, 'right')


                Gengar:CheckBox('GodMod', 'Ficar com vida Infinita', 'ToggleGodMode', function(toggleState)
                    if toggleState then 
                        godmod3r()
                            print('GodMode ativado.')
                    else
                        print('GodMode desativado.')
                    end
                end)

            end

            elseif Gengar.tabs.active == 'Veiculos' then

                Gengar:SubTab('Veiculos') --SUBTAB 1
                Gengar:SubTab('Seu Veiculo') --SUBTAB 3
                Gengar:SubTab('Selecionado') --SUBTAB 4

                if Gengar.subtabs.active == 'Veiculos' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO
                
                    for _, veh in pairs(GetGamePool('CVehicle')) do
                        local vehs = GetEntityCoords(veh)
                        local player = GetEntityCoords(PlayerPedId())
                        local dist = tonumber(string.format('%.0f', GetDistanceBetweenCoords(player.x, player.y, player.z, vehs.x, vehs.y, vehs.z, true)))
                        local nomeveh = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                        local vidaveh = GetEntityHealth(veh)
                        local status = (GetPedInVehicleSeat(veh, -1) == 0) and 'Livre' or 'Ocupado'

                        local isSelected = Gengar.SelectedVehicle == veh
                        local SelecTionText = isSelected and 'Sim' or 'Não'

                        local Title = 'Nome: '..nomeveh..' | Distancia: '..dist..'m'
                        local SubTitle = ' Vida: '..vidaveh..' | '..status..' | Selecionado: '..SelecTionText

                        if dist < 250 then
                            if isSelected then
                                Gengar.toggles[nomeveh..veh] = true
                            else
                                Gengar.toggles[nomeveh..veh] = false
                            end
                            if Gengar.SelectedVehicle == veh then
                                Gengar:CheckBox(Title, SubTitle, nomeveh..veh, function()
                                    Gengar.SelectedVehicle = not Gengar.SelectedVehicle
                                end)
                            else
                                Gengar:CheckBox(Title, SubTitle, nomeveh..veh, function()
                                    Gengar.SelectedVehicle = veh
                                end)
                            end
                        end
                    end
                end

                    
                elseif Gengar.subtabs.active == 'Selecionado' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    Gengar:CheckBox('Spectar Veículo', 'Ativar/Desativar Spectador de Veículo', 'isSpectateVehicleActive', function(state)
                        Gengar.toggles.isSpectateVehicleActive = state
                        local spectate_cam = nil
                    
                        if state then
                            local playerPed = PlayerPedId()
                            local vehicle = Gengar.SelectedVehicle
                    
                            if DoesEntityExist(vehicle) then
                                local coords = GetEntityCoords(vehicle)
                    
                                spectate_cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                                SetCamCoord(spectate_cam, coords.x, coords.y, coords.z + 5.0)
                                SetCamActive(spectate_cam, true)
                                RenderScriptCams(true, false, 0, true, true)
                    
                                FreezeEntityPosition(playerPed, true)
                                SetEntityVisible(playerPed, false, false)
                    
                                Citizen.CreateThread(function()
                                    while Gengar.toggles.isSpectateVehicleActive do
                                        Citizen.Wait(0)
                                        if DoesEntityExist(vehicle) then
                                            local vehicleCoords = GetEntityCoords(vehicle)
                                            SetCamCoord(spectate_cam, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 5.0)
                                            PointCamAtEntity(spectate_cam, vehicle, 0.0, 0.0, 0.0, true)
                                        else
                                            Gengar.toggles.isSpectateVehicleActive = false
                                        end
                                    end
                                end)
                    
                                print("Spectador de Veículo Ativado!")
                            else
                                print("Nenhum veículo selecionado!")
                                Gengar.toggles.isSpectateVehicleActive = false
                            end
                        else
                            RenderScriptCams(false, false, 0, true, true)
                            DestroyCam(spectate_cam, false)
                            spectate_cam = nil
                    
                            local playerPed = PlayerPedId()
                            FreezeEntityPosition(playerPed, false)
                            SetEntityVisible(playerPed, true, false)
                            SetFocusEntity(playerPed)
                    
                            print("Spectador de Veículo Desativado!")
                        end
                    end)
                    
                
Gengar:Button('Puxar Veículo', 'Você Vai Puxar O Veículo Selecionado', function() 

if Gengar.SelectedVehicle then 
    local playerPed = PlayerPedId()
    local veh = Gengar.SelectedVehicle
    local playerCoords = GetEntityCoords(playerPed)
    local vehicleCoords = GetEntityCoords(veh)
    SetVehicleOnGroundProperly(veh)  
    SetEntityCoordsNoOffset(playerPed, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)  
    NetworkRequestControlOfEntity(veh)  
    SetEntityCollision(veh, false)  
    Wait(500)
    TaskWarpPedIntoVehicle(playerPed, veh, -1)  
    Wait(500)
    for i = 1, 50 do
        SetPedCoordsKeepVehicle(playerPed, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)  
        Wait(1)
    end
    SetEntityCollision(veh, true)  
else
    print('Aviso! Selecione o veículo') 
end
end)


local destrancarVeiculos = false

Gengar:CheckBox('Destrancar Veículos Próximos', 'Destranca continuamente todos os veículos próximos', function(state)
    destrancarVeiculos = state
    Citizen.CreateThread(function()
        while destrancarVeiculos do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            for _, vehicle in pairs(GetGamePool('CVehicle')) do
                local vehicleCoords = GetEntityCoords(vehicle)
                if #(playerCoords - vehicleCoords) < 20.0 then -- Raio de 20 metros
                    SetVehicleDoorsLocked(vehicle, 1)
                    SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                end
            end
            Citizen.Wait(500) -- Aguarda meio segundo antes de repetir
        end
    end)
end, 'right')

local trancarVeiculos = false

Gengar:CheckBox('Trancar Veículos Próximos', 'Tranca continuamente todos os veículos próximos', function(state)
    trancarVeiculos = state
    Citizen.CreateThread(function()
        while trancarVeiculos do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            for _, vehicle in pairs(GetGamePool('CVehicle')) do
                local vehicleCoords = GetEntityCoords(vehicle)
                if #(playerCoords - vehicleCoords) < 20.0 then 
                    SetVehicleDoorsLocked(vehicle, 2)
                    SetVehicleDoorsLockedForAllPlayers(vehicle, true)
                end
            end
            Citizen.Wait(500) 
        end
    end)
end, 'right')

-- Botão para destrancar o veículo selecionado
Gengar:Button('Destrancar Veículo Sel', 'Destranca o veículo selecionado', function()
if Gengar.SelectedVehicle then
    SetVehicleDoorsLocked(Gengar.SelectedVehicle, 1)  -- Destranca as portas do veículo
    SetVehicleDoorsLockedForPlayer(Gengar.SelectedVehicle, PlayerId(), false)  -- Destranca para o jogador
    SetVehicleDoorsLockedForAllPlayers(Gengar.SelectedVehicle, false)  -- Destranca para todos os jogadores
    print('O veículo foi destrancado!') -- Exibe no console
else
    print('Nenhum veículo selecionado!') -- Exibe no console se não houver um veículo selecionado
end
end, 'right')

-- Botão para trancar o veículo selecionado
Gengar:Button('Trancar Veículo Sel', 'Tranca o veículo selecionado', function()
if Gengar.SelectedVehicle then
    if DoesEntityExist(Gengar.SelectedVehicle) then
        SetVehicleDoorsLocked(Gengar.SelectedVehicle, 1)  -- Tranca as portas do veículo
        SetVehicleDoorsLockedForPlayer(Gengar.SelectedVehicle, PlayerId(), true)  -- Tranca para o jogador
        SetVehicleDoorsLockedForAllPlayers(Gengar.SelectedVehicle, true)  -- Tranca para todos os jogadores
        print('O veículo foi trancado!') -- Exibe no console
    else
        print('O veículo não existe!') -- Exibe no console se o veículo não existir
    end
else
    print('Nenhum veículo selecionado!') -- Exibe no console se não houver um veículo selecionado
end
end, 'right')





Gengar:Button('Tp Veículo Sel', 'Teleporta o jogador até o veículo selecionado', function()
if Gengar.SelectedVehicle then
    local vehCoords = GetEntityCoords(Gengar.SelectedVehicle)  
    SetEntityCoordsNoOffset(PlayerPedId(), vehCoords)  
    Citizen.Wait(1000)
    TaskWarpPedIntoVehicle(PlayerPedId(), Gengar.SelectedVehicle, -1)  
    print('Veículo teleportado com sucesso!') 
else
    print('Erro: Nenhum veículo selecionado!') 
end
end, 'right')

-- Função para explodir o veículo e removê-lo
function BoomBoomCar(vehicle)
    if DoesEntityExist(vehicle) then
        -- Tentar obter controle do veículo
        if not NetworkHasControlOfEntity(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local startTime = GetGameTimer()
            while not NetworkHasControlOfEntity(vehicle) and (GetGameTimer() - startTime) < 5000 do
                Citizen.Wait(10)
            end
        end
        
        if NetworkHasControlOfEntity(vehicle) then
            local vehicleCoords = GetEntityCoords(vehicle)
            
            
            AddExplosion(vehicleCoords, 5, 100.0, true, true, 1.0)  
            print('Veículo explodido com sucesso!')

            
            Citizen.Wait(500)

            
            DeleteEntity(vehicle)
        else
            print('Erro: Não foi possível obter controle do veículo para explodir!')
        end
    else
        print('Erro: Nenhum veículo válido para explodir!')
    end
end

-- Função para lançar o veículo para o ar
function SkyBoomCar()
    if Gengar.SelectedVehicle and DoesEntityExist(Gengar.SelectedVehicle) then
        print('Lançando veículo para o ar...')

        -- Tenta obter controle do veículo
        if not NetworkHasControlOfEntity(Gengar.SelectedVehicle) then
            NetworkRequestControlOfEntity(Gengar.SelectedVehicle)

            local startTime = GetGameTimer()
            while not NetworkHasControlOfEntity(Gengar.SelectedVehicle) and (GetGameTimer() - startTime) < 5000 do
                Citizen.Wait(10)
            end
        end

        -- Aplica força para lançar o veículo para o ar
        if NetworkHasControlOfEntity(Gengar.SelectedVehicle) then
            local force = math.random(100.0, 200.0) -- Aleatoriza um pouco a força para ficar mais dinâmico
            ApplyForceToEntity(Gengar.SelectedVehicle, 1, 0.0, 0.0, force, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
            SetEntityVelocity(Gengar.SelectedVehicle, 0.0, 0.0, force) -- Define velocidade para cima
            print('Veículo lançado para o ar!')
        else
            print('Erro: Não foi possível obter controle do veículo!')
        end
    else
        print('Erro: Nenhum veículo selecionado ou veículo inválido!')
    end
end

-- Botão para lançar o veículo selecionado
Gengar:Button('Lançar Veículo', 'Lança o veículo selecionado para o ar', function()
    SkyBoomCar()
end, 'right')

-- Botão para explodir o veículo selecionado
Gengar:Button('Explodir Veículo', 'Explode o veículo selecionado', function()
    if Gengar.SelectedVehicle then
        BoomBoomCar(Gengar.SelectedVehicle)
    else
        print('Erro: Selecione um carro antes!')
    end
end, 'right')




                    

                
                    

            elseif Gengar.subtabs.active == 'Seu Veiculo' then -- SE O SUBTAB 3 JOGADOR ESTIVER ATIVO ENTAO

                Gengar:Button('Reparar Veículo', 'Voce Vai reparar seu veiculo', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
            
                    SetVehicleOnGroundProperly(GetVehiclePedIsIn(PlayerPedId(), 0))
                    SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), false))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(PlayerPedId(), false), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(PlayerPedId(), false), false)
                    SetVehicleLightsMode(GetVehiclePedIsIn(PlayerPedId(), false), 0)
                end) 
                

                    Gengar:Button('Tunning Veiculo', 'Voce Vai tunar seu veiculo', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

                        if DoesEntityExist(Vehicle) then
                            NetworkRequestEntityControl(Vehicle)
    
                            SetVehicleModKit(Vehicle, 0)
    
                            SetVehicleWheelType(Vehicle, 7)
    
                            SetVehicleMod(Vehicle, 0, GetNumVehicleMods(Vehicle, 0) - 1, false)
    
                            SetVehicleMod(Vehicle, 1, GetNumVehicleMods(Vehicle, 1) - 1, false)
    
                            SetVehicleMod(Vehicle, 2, GetNumVehicleMods(Vehicle, 2) - 1, false)
    
                            SetVehicleMod(Vehicle, 3, GetNumVehicleMods(Vehicle, 3) - 1, false)
    
                            SetVehicleMod(Vehicle, 4, GetNumVehicleMods(Vehicle, 4) - 1, false)
    
                            SetVehicleMod(Vehicle, 5, GetNumVehicleMods(Vehicle, 5) - 1, false)
    
                            SetVehicleMod(Vehicle, 6, GetNumVehicleMods(Vehicle, 6) - 1, false)
    
                            SetVehicleMod(Vehicle, 7, GetNumVehicleMods(Vehicle, 7) - 1, false)
    
                            SetVehicleMod(Vehicle, 8, GetNumVehicleMods(Vehicle, 8) - 1, false)
    
                            SetVehicleMod(Vehicle, 9, GetNumVehicleMods(Vehicle, 9) - 1, false)
    
                            SetVehicleMod(Vehicle, 10, GetNumVehicleMods(Vehicle, 10) - 1, false)
    
                            SetVehicleMod(Vehicle, 11, GetNumVehicleMods(Vehicle, 11) - 1, false)
    
                            SetVehicleMod(Vehicle, 12, GetNumVehicleMods(Vehicle, 12) - 1, false)
    
                            SetVehicleMod(Vehicle, 13, GetNumVehicleMods(Vehicle, 13) - 1, false)
    
                            SetVehicleMod(Vehicle, 15, GetNumVehicleMods(Vehicle, 15) - 2, false)
    
                            SetVehicleMod(Vehicle, 16, GetNumVehicleMods(Vehicle, 16) - 1, false)
    
                            ToggleVehicleMod(Vehicle, 17, true)
    
                            ToggleVehicleMod(Vehicle, 18, true)
    
                            ToggleVehicleMod(Vehicle, 19, true)
    
                            ToggleVehicleMod(Vehicle, 20, true)
    
                            ToggleVehicleMod(Vehicle, 21, true)
    
                            ToggleVehicleMod(Vehicle, 22, true)
    
                            SetVehicleMod(Vehicle, 25, GetNumVehicleMods(Vehicle, 25) - 1, false)
    
                            SetVehicleMod(Vehicle, 27, GetNumVehicleMods(Vehicle, 27) - 1, false)
    
                            SetVehicleMod(Vehicle, 28, GetNumVehicleMods(Vehicle, 28) - 1, false)
    
                            SetVehicleMod(Vehicle, 30, GetNumVehicleMods(Vehicle, 30) - 1, false)
    
                            SetVehicleMod(Vehicle, 33, GetNumVehicleMods(Vehicle, 33) - 1, false)
    
                            SetVehicleMod(Vehicle, 34, GetNumVehicleMods(Vehicle, 34) - 1, false)
    
                            SetVehicleMod(Vehicle, 35, GetNumVehicleMods(Vehicle, 35) - 1, false)
    
                            NetworkRequestControlOfEntity(PlayerPedId())
    
                            SetVehicleModKit(Vehicle, 0.0)
    
                            SetVehicleMod(Vehicle, 11, GetNumVehicleMods(Vehicle, 11) - 1, false)
    
                            SetVehicleMod(Vehicle, 12, GetNumVehicleMods(Vehicle, 12) - 1, false)
    
                            SetVehicleMod(Vehicle, 13, GetNumVehicleMods(Vehicle, 13) - 1, false)
    
                            SetVehicleMod(Vehicle, 15, GetNumVehicleMods(Vehicle, 15) - 2, false)
    
                            SetVehicleMod(Vehicle, 16, GetNumVehicleMods(Vehicle, 16) - 1, false)
    
                            ToggleVehicleMod(Vehicle, 17, true)
    
                            ToggleVehicleMod(Vehicle, 18, true)
    
                            ToggleVehicleMod(Vehicle, 19, true)
    
                            ToggleVehicleMod(Vehicle, 21, true)
                        end
                    end)
                    

                    Gengar:Button('Tp veiculo Prox', 'Voce Vai teleportar para um veiculo proximo', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
            
                        Tp_veiculoProx()
                    end)

                    

                    Gengar:Button('Deletar Veículo', 'Você vai deletar seu veículo ou o mais próximo vazio', function()
                        local playerPed = PlayerPedId()
                        local veiculo = GetVehiclePedIsIn(playerPed, false)
                    
                        if not DoesEntityExist(veiculo) then
                            local playerCoords = GetEntityCoords(playerPed)
                            veiculo = GetClosestVehicle(playerCoords.x, playerCoords.y, playerCoords.z, 10.0, 0, 71)
                    
                            if DoesEntityExist(veiculo) and IsVehicleSeatFree(veiculo, -1) then
                                NetworkRequestControlOfEntity(veiculo)
                                DeleteEntity(veiculo)
                            end
                        else
                            NetworkRequestControlOfEntity(veiculo)
                            DeleteEntity(veiculo)
                        end
                    end)
                    


                    Gengar:CheckBox('Boozina Boost [E]', 'Ira Acelerar seu carro ao maximo apertando o [E]', 'H07nB00st33r', function(buzinabost)
                        if buzinabost then
                            Citizen.CreateThread(function()
                                while Gengar.toggles.H07nB00st33r do
                                    if IsControlPressed(0, 38) then
                                        local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                        if DoesEntityExist(vehicle) and IsVehicleOnAllWheels(vehicle) then
                                            SetVehicleForwardSpeed(vehicle, 80.0)
                                        end
                                    end
                                    Citizen.Wait(0) 
                                end
                            end)
                        end
                    end)
                    
                    Gengar:CheckBox('Freio de Avião', 'Freia o carro instantaneamente', 'FreioAviao', function(freioaviao)
                        if freioaviao then
                            Citizen.CreateThread(function()
                                while Gengar.toggles.FreioAviao do
                                    if IsControlPressed(0, 8) then
                                        local playerPed = PlayerPedId()
                                        local vehicle = GetVehiclePedIsIn(playerPed, false)
                                        if DoesEntityExist(vehicle) and IsPedInAnyVehicle(playerPed, false) then
                                            SetVehicleForwardSpeed(vehicle, 0.0)
                                        end
                                    end
                                    Citizen.Wait(0)
                                end
                            end)
                        end
                    end)
                    
    

            elseif Gengar.tabs.active == 'Armas' then

                Gengar:SubTab('Armas') --SUBTAB 1
                Gengar:SubTab('Spawn') --SUBTAB 2

                if Gengar.subtabs.active == 'Armas' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO
                    

                    Gengar:Button('Adicionar Attachs', 'Você irá adicionar equipamentos a sua arma.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        local p333dd = PlayerPedId()

                        local a7mm44 = GetSelectedPedWeapon(p333dd)
    
                        if GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_PISTOL_MK2") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_PI_RAIL"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_PI_FLSH_02"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_PI_SUPP_02"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_MACHINEPISTOL") then
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_SMG_MK2") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_FLSH"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_PUMPSHOTGUN") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_FLSH"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_SR_SUPP"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_SMG") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_FLSH"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_PI_SUPP"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") or GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_CARBINERIFLE_MK2") or GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_FLSH"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_MUZZLE_02"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_CARBINERIFLE") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_FLSH"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_AR_AFGRIP"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_COMBATPDW") then
    
                            GiveWeaponComponentToPed(p333dd,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_FLSH"))
    
                            GiveWeaponComponentToPed(p333dd,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
    
                            GiveWeaponComponentToPed(p333dd,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
    
                        elseif GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_HEAVYPISTOL") or GetSelectedPedWeapon(p333dd) == GetHashKey("WEAPON_COMBATPISTOL") then
    
                            GiveWeaponComponentToPed(p333dd,a7mm44,GetHashKey("COMPONENT_AT_PI_FLSH"))
    
                        end
                    end)


                    Gengar:Button('Remover Armas', 'Você irá remover todas suas armas.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        RemoveAllPedWeapons(PlayerPedId())

    
                    end)

                    Gengar:CheckBox('No Reload', 'Não irá recarregar sua arma.', 'norrrecarregar', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                        --EXEMPLO DE USO DA CheckBox

                        if Gengar.toggles.norrrecarregar then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                            local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                            SetPedInfiniteAmmoClip(PlayerPedId(), true, Ped_W)
                        else
                            local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                            SetPedInfiniteAmmoClip(PlayerPedId(), false, Ped_W)
                        end
                        end)

                        Gengar:CheckBox('Munição Infinita', 'Não irá acabar a munição da sua arma.', 'nomuniinf', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                            --EXEMPLO DE USO DA CheckBox
    
                            if Gengar.toggles.nomuniinf then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                                local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                                SetPedInfiniteAmmo(PlayerPedId(), true, Ped_W)
                            else
                                local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                                SetPedInfiniteAmmo(PlayerPedId(), false, Ped_W)
                            end
                            end)


                elseif Gengar.subtabs.active == 'Spawn' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    if getsource('MQCU') or getsource('likizao_ac') then
                    Gengar:Button('Spawnar Pistol Mk2', 'Irá spawnar uma pistol mk2.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        Citizen.CreateThread(function()
                            local Tunnel = module("vrp","lib/Tunnel")
                            local Proxy = module("vrp","lib/Proxy")
                            vRP = Proxy.getInterface("vRP")
                             vRP.giveWeapons({['WEAPON_PISTOL_MK2'] = {ammo = 200}})
                    end)
                end)
        end

        if getsource('MQCU') or getsource('likizao_ac') then

            Gengar:Button('Spawnar SpecialCarbine Mk2', 'Irá spawnar uma G3 mk2.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp","lib/Tunnel")
                    local Proxy = module("vrp","lib/Proxy")
                    vRP = Proxy.getInterface("vRP")
                     vRP.giveWeapons({['WEAPON_SPECIALCARBINE_MK2'] = {ammo = 200}})
            end)
        end)
    end

if getsource('MQCU') or getsource('likizao_ac') then

    Gengar:Button('Spawnar AssaultRifle Mk2', 'Irá spawnar uma Ak47 mk2.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
        Citizen.CreateThread(function()
            local Tunnel = module("vrp","lib/Tunnel")
            local Proxy = module("vrp","lib/Proxy")
            vRP = Proxy.getInterface("vRP")
             vRP.giveWeapons({['WEAPON_ASSAULTRIFLE_MK2'] = {ammo = 200}})
    end)
end)

end

if getsource('MQCU') or getsource('likizao_ac') then

Gengar:Button("Spawnar Pistol Mk2", function()
    Citizen.CreateThread(function()
        local Tunnel = module("vrp","lib/Tunnel")
        local Proxy = module("vrp","lib/Proxy")
        vRP = Proxy.getInterface("vRP")
         vRP.giveWeapons({['WEAPON_PISTOL_MK2'] = {ammo = 200}})

         
end)
end)
end



Gengar:CheckBox('Bugar Arma na Mão', 'Buga a Arma na sua Mão', 'Togglearmitanamaozita', function(toggleState)
    if toggleState then 
        armitanamaozita()
            print('GodMode ativado.')
    else
        print('GodMode desativado.')
    end
end)

if getsource('PL_PROTECT') or getsource('ThnAC')  then
Gengar:Button('Indisponivel', 'Servidor sem suporte de [BYPASS].', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
print('Indisponivel')
end)
end 
                    
                end

            elseif Gengar.tabs.active == 'Online' then

                Gengar:SubTab('Online') --SUBTAB 1
                Gengar:SubTab('Servers') --SUBTAB 2
                Gengar:SubTab('Players') --SUBTAB 2

                if Gengar.subtabs.active == 'Online' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

                
                
                    local playersModule = {}

                    Gengar:Button('Remover do Veículo', 'Você Vai Remover O Jogador Selecionado Do Veículo', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                    if Gengar.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
                        local playerselped = GetPlayerPed(Gengar.SelectedPlayer)
                        
                        if playerselped ~= PlayerPedId() then 
                            local vehicle = GetVehiclePedIsIn(playerselped) 
                            if vehicle and vehicle ~= 0 then
                                Citizen.InvokeNative(0xB5C51B5502E85E83, vehicle, PlayerPedId(), 1)
                                print('✔️ Jogador removido do veículo com sucesso!')
                            else
                                print('⚠ Jogador não está em um veículo!')
                            end
                        else
                            print('⚠ Você não pode remover a si mesmo do veículo!')
                        end
                    else
                        print('⚠ Aviso! Selecione um jogador antes de remover do veículo.') -- SE NÃO HOUVER PLAYER SELECIONADO
                    end
                end)                                
            
                Gengar:CheckBox('Simular H', 'O jogador selecionado ficará segurando você no H.', 'fingirArrasto', function()
                    if Gengar.toggles.fingirArrasto then -- Se a CheckBox estiver ativada (TRUE)
                        local player = GetPlayerPed(Gengar.SelectedPlayer)
                        if DoesEntityExist(player) and player ~= PlayerPedId() then
                            -- Faz o jogador selecionado "segurar" o jogador atual
                            AttachEntityToEntity(PlayerPedId(), player, 4103, 0.7, 0, 0, 0, 0, 0, false, false, false, false, 2, true)
                            print('🖐 Jogador segurando você no H!')
                        else
                            print('⚠ Jogador selecionado não existe ou você está tentando se segurar!')
                        end
                    else -- Se estiver desativada (FALSE)
                        if IsEntityAttachedToEntity(PlayerPedId(), GetPlayerPed(Gengar.SelectedPlayer)) then
                            -- Desanexa o jogador se a CheckBox for desmarcada e estiver anexado
                            DetachEntity(PlayerPedId(), true, true)
                            print('❌ Desanexado do jogador!')
                        end
                    end
                end)
                

                

                Gengar:Button('Copiar Roupa', 'Você Vai Copiar A Roupa Do Player Selecionado', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                    if Gengar.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
                        local playerselped = GetPlayerPed(Gengar.SelectedPlayer)
                
                        if playerselped ~= PlayerPedId() then -- EVITA COPIAR A SI MESMO
                            ClonePedToTarget(playerselped, PlayerPedId()) -- CLONA A ROUPA DO PLAYER SELECIONADO
                            print('✔️ Roupa copiada com sucesso!')
                        else
                            print('⚠ Você não pode copiar suas próprias roupas!')
                        end
                    else
                        print('⚠ Aviso! Selecione um jogador antes de copiar a roupa.') -- SE NÃO HOUVER PLAYER SELECIONADO
                    end
                end)

                Gengar:Button('Copiar PED', 'Voce Vai Copiar o PED Do Player Selecionado', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                    Copy_PED()
                end)

                if getsource == "likizão_ac" then
                Gengar:Button('Chuva do Anti Rp no Jogador Selecionado (SANTAS)', 'Faz uma chuva de Veículos Anti Rp no player selecionado', function()
                    if Gengar.SelectedPlayer then -- Verifica se há um jogador selecionado
                        local playerselped = GetPlayerPed(Gengar.SelectedPlayer)
                
                        if playerselped ~= PlayerPedId() then -- Evita fazer a ação em si mesmo
                            local coords = GetEntityCoords(playerselped) -- Coordenadas do jogador selecionado
                
                            -- Lista de Veículos Anti Rp
                            local Veiculos = {
                                "titan",        -- Titan
                                "cargoplane",   -- Cargo Plane
                                "jetmax",       -- Jetmax
                                "submersible",  -- Submersible
                                "yacht",        -- Yacht
                                "cargobob",     -- Cargobob
                                "mammatus",     -- Mammatus
                                "marquis",      -- Marquis
                                "dodo"          -- Dodo
                            }
                
                            -- Loop para criar os Veículos
                            for i = 1, 1000 do -- Cria 1000 Veículos (ajuste conforme necessário)
                                local veiculoNome = Veiculos[math.random(#Veiculos)] -- Seleciona um veículo aleatório da lista
                                local mhash = GetHashKey(veiculoNome)
                                RequestModel(mhash)
                
                                while not HasModelLoaded(mhash) do
                                    Citizen.Wait(0)
                                end
                
                                -- Cria o veículo em cima do jogador
                                local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false)
                                NetworkRegisterEntityAsNetworked(veiculo)
                                ApplyForceToEntity(veiculo, 1, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, true, true, true, true, true, true) -- Aplica força para "chover"
                                Wait(100) -- Intervalo entre a criação de cada veículo
                            end
                
                            -- Notificação de sucesso
                            print('✔️ Chuva de Anti Rp ativada no player com sucesso!')
                        else
                            print('⚠ Você não pode fazer a chuva de Anti Rp em si mesmo!')
                        end
                    else
                        print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de Anti Rp.') -- Se não houver jogador selecionado
                    end
                end)
            end

            if getsource == "likizão_ac" then
Gengar:Button('Chuva de Barco no Player (SANTAS)', 'Faz uma chuva de barcos no player selecionado', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
if Gengar.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
    local playerselped = GetPlayerPed(Gengar.SelectedPlayer)

    if playerselped ~= PlayerPedId() then -- EVITA FAZER A CHUVA DE BARCO EM SI MESMO
        local coords = GetEntityCoords(playerselped) -- COORDENADAS DO PLAYER SELECIONADO
        local car = "JetMax" -- MODELO DO VEÍCULO
        local mhash = GetHashKey(car)
        RequestModel(mhash)
        
        while not HasModelLoaded(mhash) do
            Citizen.Wait(0)
        end

        for i = 1, 1000 do
            local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false) -- CRIA O VEÍCULO EM CIMA DO PLAYER
            NetworkRegisterEntityAsNetworked(veiculo)
            Wait(100)
        end

        print('✔️ Chuva de barco ativada no player com sucesso!')
    else
        print('⚠ Você não pode fazer a chuva de barco em si mesmo!')
    end
else
    print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de barco.') -- SE NÃO HOUVER PLAYER SELECIONADO
end
end)
end

if getsource == "likizão_ac" then
Gengar:Button('Chuva de Submarinos Gigantes no Player (SANTAS)', 'Faz uma Submarinos Gigantes no player selecionado', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
    if Gengar.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
        local playerselped = GetPlayerPed(Gengar.SelectedPlayer)

        if playerselped ~= PlayerPedId() then -- EVITA FAZER A CHUVA DE BARCO EM SI MESMO
            local coords = GetEntityCoords(playerselped) -- COORDENADAS DO PLAYER SELECIONADO
            local car = "kosatka" -- MODELO DO VEÍCULO
            local mhash = GetHashKey(car)
            RequestModel(mhash)
            
            while not HasModelLoaded(mhash) do
                Citizen.Wait(0)
            end

            for i = 1, 1000 do
                local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false) -- CRIA O VEÍCULO EM CIMA DO PLAYER
                NetworkRegisterEntityAsNetworked(veiculo)
                Wait(100)
            end

            print('✔️ Chuva de barco ativada no player com sucesso!')
        else
            print('⚠ Você não pode fazer a chuva de barco em si mesmo!')
        end
    else
        print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de barco.') -- SE NÃO HOUVER PLAYER SELECIONADO
    end
end)
end

if getsource == "likizão_ac" then
    Gengar:Button('Chuva de Barco Gigante no Player (SANTAS)', 'Faz uma Barco Gigante no player selecionado', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
        if Gengar.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
            local playerselped = GetPlayerPed(Gengar.SelectedPlayer)
    
            if playerselped ~= PlayerPedId() then -- EVITA FAZER A CHUVA DE BARCO EM SI MESMO
                local coords = GetEntityCoords(playerselped) -- COORDENADAS DO PLAYER SELECIONADO
                local car = "tug" -- MODELO DO VEÍCULO
                local mhash = GetHashKey(car)
                RequestModel(mhash)
                
                while not HasModelLoaded(mhash) do
                    Citizen.Wait(0)
                end
    
                for i = 1, 1000 do
                    local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false) -- CRIA O VEÍCULO EM CIMA DO PLAYER
                    NetworkRegisterEntityAsNetworked(veiculo)
                    Wait(100)
                end
    
                print('✔️ Chuva de barco ativada no player com sucesso!')
            else
                print('⚠ Você não pode fazer a chuva de barco em si mesmo!')
            end
        else
            print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de barco.') -- SE NÃO HOUVER PLAYER SELECIONADO
        end
    end)
    end

if getsource == "likizão_ac" then
Gengar:Button('Fuder Player Santa', 'Carros fudem o player selecionado', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
if Gengar.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
    local playerselped = GetPlayerPed(Gengar.SelectedPlayer)

    if playerselped ~= PlayerPedId() then -- EVITA FAZER A AÇÃO EM SI MESMO
        local car = "avisa" -- MODELO DO CARRO
        local coords = GetEntityCoords(playerselped) -- COORDENADAS DO PLAYER SELECIONADO
        local mhash = GetHashKey(car)
        RequestModel(mhash)

        while not HasModelLoaded(mhash) do
            Citizen.Wait(0)
        end

        local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z, 0.0, true, false)
        NetworkRegisterEntityAsNetworked(veiculo)
        SetEntityCoords(veiculo, coords.x, coords.y, coords.z, true, false, false, true)

        Wait(1500)
        for i = 0, 50 do
            local vehCoords = GetEntityCoords(playerselped)
            SetEntityCoords(veiculo, vehCoords.x, vehCoords.y, vehCoords.z, true, true, true, false)
            SetEntityRotation(veiculo, math.random(10, 180), math.random(10, 180), math.random(10, 180), 2, true)
            SetEntityVelocity(veiculo, 0.0, 0.0, -1000.0) -- VELOCIDADE NEGATIVA PARA "FUDER" O PLAYER
            Wait(100)
        end

        print('✔️ Carro ativado para fuder o player com sucesso!')

    else
        print('⚠ Você não pode realizar essa ação em si mesmo!')
    end
else
    print('⚠ Aviso! Selecione um jogador antes de realizar a ação.') -- SE NÃO HOUVER PLAYER SELECIONADO
end
end)
end






GetAllVeh = function()
    local ret = {}
    
    for veh in EnumerateVehicles() do
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
        if model ~= "FREIGHT" and model ~= "CARNOTFOUND" then
            table.insert(ret, veh)
        end
    end
    
    return ret
end

Gengar:CheckBox('Indexar Veículos no Jogador', 'Grudar os Carros no Jogador Selecionado', 'GrudarVeiculosNoJogador', function()
    if Gengar.toggles.GrudarVeiculosNoJogador then
        -- SE A CheckBox ESTIVER LIGADA
        if Gengar.SelectedPlayer then
            for _, vehicle in ipairs(GetAllVeh()) do
                Grudarvehsinplayer(vehicle, Gengar.SelectedPlayer)
            end
        end
    end
end, 'right')

Gengar:CheckBox('Chuva de Carro no player', 'Ativa ou desativa a chuva de carros no player selecionado', 'ChuvaDeCarroBool', function()
    if Gengar.toggles and Gengar.toggles.ChuvaDeCarroBool then
        Citizen.CreateThread(function()
            if Gengar.SelectedPlayer then 
                local playerselped = GetPlayerPed(Gengar.SelectedPlayer)
                
                if playerselped ~= PlayerPedId() then 
                    for _, vehicle in ipairs(GetAllVeh()) do
                        SetEntityCoords(vehicle, GetEntityCoords(playerselped) + vector3(0, 0, 20))
                        SetEntityRotation(vehicle, math.random(10, 180))
                        SetEntityVelocity(vehicle, 0.0, 0.0, -100.0)
                        Wait(100) 
                    end
                    
                    print("🚗 Chuva de carros concluída no jogador selecionado!")
                else
                    print("⚠ Você não pode fazer chover carros em si mesmo!")
                end
            else
                print("⚠ Aviso! Selecione um jogador antes de iniciar a chuva de carros.")
            end
        end)
    else
        print('❌ Chuva de Carro DESATIVADA!')
    end
end)





Gengar:CheckBox('Matar Player Usando Carros', 'Grudar os Carros no Jogador Selecionado e Atropelá-lo', 'MatarPlayer', function()
    if Gengar.toggles.MatarPlayer then
        -- SE A CheckBox ESTIVER LIGADA
        if Gengar.SelectedPlayer then
            for vehicles in EnumerateVehicles() do
                MatarPlayer(vehicle, Gengar.SelectedPlayer)
            end
        end
    end
end, 'right')

Gengar:Button('Teleportar para Jogador', 'Teleporta você até o jogador selecionado', function()
    if Gengar.SelectedPlayer then
        local targetPed = GetPlayerPed(Gengar.SelectedPlayer) -- Obtém o Ped do jogador selecionado
        local playerPed = PlayerPedId() -- Obtém o Ped do jogador atual

        if DoesEntityExist(targetPed) then
            local x, y, z = table.unpack(GetEntityCoords(targetPed, false)) -- Obtém as coordenadas do jogador selecionado

            -- Verifica se o jogador está em um veículo
            local veh = GetVehiclePedIsUsing(playerPed)
            if IsPedInAnyVehicle(playerPed, false) then
                playerPed = veh -- Define o veículo como entidade a ser teleportada
            end

            -- Verifica se o chão foi encontrado
            local groundFound = false
            local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0, 1050.0, 1100.0 }

            -- Itera sobre as alturas para encontrar o chão
            for _, height in ipairs(groundCheckHeights) do
                SetEntityCoordsNoOffset(playerPed, x, y, height, 0, 0, 1) -- Teleporta para a altura atual

                -- Carrega a colisão nas coordenadas
                RequestCollisionAtCoord(x, y, height)
                while not HasCollisionLoadedAroundEntity(playerPed) do
                    RequestCollisionAtCoord(x, y, height)
                    Citizen.Wait(1)
                end

                Citizen.Wait(20)

                -- Verifica se há chão nas coordenadas
                local ground
                ground, z = GetGroundZFor_3dCoord(x, y, height)

                if ground then
                    z = z + 1.0 -- Ajusta a altura para ficar acima do chão
                    groundFound = true
                    break
                end
            end

            -- Carrega a colisão nas coordenadas finais
            RequestCollisionAtCoord(x, y, z)
            while not HasCollisionLoadedAroundEntity(playerPed) do
                RequestCollisionAtCoord(x, y, z)
                Citizen.Wait(1)
            end

            -- Teleporta para as coordenadas finais
            if groundFound then
                SetEntityCoordsNoOffset(playerPed, x, y, z, 0, 0, 1)
                print("^2Teleportado para o jogador com sucesso!") -- Mensagem de sucesso no console
            else
                print("^1Erro: Não foi possível encontrar o chão adequado para teleportar.") -- Mensagem de erro no console
            end
        else
            print("^1Erro: Jogador selecionado não encontrado.") -- Mensagem de erro no console
        end
    else
        print("^1Erro: Nenhum jogador selecionado.") -- Mensagem de erro no console
    end
end, 'right')

Gengar:Button('Attachar Veículo', 'Grude o veículo no Meio Do Jogador Selecionado', function()
    local selectedPlayer = Gengar.SelectedPlayer
    local selectedPed = GetPlayerPed(selectedPlayer)
    local playerCoords = GetEntityCoords(selectedPed)
    local vehicle = nil

    for vehicleId = 1, 1000 do
        vehicle = GetVehiclePedIsIn(selectedPed, false)
        if vehicle == 0 then
            vehicle = GetClosestVehicle(playerCoords.x, playerCoords.y, playerCoords.z, 500.0, 0, 70)
        end
        if vehicle and DoesEntityExist(vehicle) and not IsPedInAnyVehicle(selectedPed, false) then
            break
        end
    end

    if vehicle and selectedPed then
        local boneIndex = GetPedBoneIndex(selectedPed, 0)
        local offsetX, offsetY, offsetZ = 0.0, 0.0, 0.0
        local rotX, rotY, rotZ = 0.0, 0.0, 0.0
        AttachEntityToEntity(vehicle, selectedPed, boneIndex, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, true, true, false, true, true, true)
    end
end)


Gengar:Button('Matar Player com Helicópteros', 'Mata o Selecionado usando Helicopteros (Santa Group)', function() 
    if Gengar.SelectedPlayer then
        local playerPed = GetPlayerPed(Gengar.SelectedPlayer)
        local cordenadas = GetEntityCoords(playerPed)

        
        local spawnHeight = 50.0
        local spawnCoords = vector3(cordenadas.x, cordenadas.y, cordenadas.z + spawnHeight)

        
        local helicopter = CreateVehicle(GetHashKey('polmav'), spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, false)

        
        NetworkRequestControlOfEntity(helicopter)
        SetEntityInvincible(helicopter, true) 

        
        Citizen.CreateThread(function()
            Citizen.Wait(1000) 

            
            local helicoPos = GetEntityCoords(helicopter)
            while helicoPos.z > cordenadas.z do
                helicoPos = GetEntityCoords(helicopter)
                SetEntityCoordsNoOffset(helicopter, helicoPos.x, helicoPos.y, helicoPos.z - 1.0, true, true, true)
                Citizen.Wait(100)
            end

            -- Verifica se o helicóptero está perto o suficiente para causar dano
            local dist = Vdist(cordenadas.x, cordenadas.y, cordenadas.z, GetEntityCoords(helicopter))
            if dist < 5.0 then
                -- Matar o jogador ao entrar em contato com a hélice
                SetEntityHealth(playerPed, 0)

                -- Destruir o helicóptero após o impacto
                SetEntityInvincible(helicopter, false) -- Torna o helicóptero vulnerável
                SetEntityHealth(helicopter, 0) -- Destrói o helicóptero
            end
        end)
    end
end)
       




    Gengar:Button('Bugar Jogador (Santas)', 'Bugar jogador selecionado', function()
        if Gengar.SelectedPlayer then
            Citizen.CreateThread(function()
                redBull(GetPlayerPed(Gengar.SelectedPlayer))
            end)
        end
    end)






Gengar:Button('Chamado de Deus (Santas)', 'Executa o chamado de Deus no jogador selecionado', function()
local target = Gengar.SelectedPlayer
playersModule.chamadoDeDeus(target)
end)



Gengar:Button('Prender Jogador (Lotus)', 'Prende o jogador selecionado em uma gaiola', function()
local target = Gengar.SelectedPlayer
playersModule.cagePlayer(target)
end)


Gengar:CheckBox('Saquear Jogador', 'Saqueia o inventário do jogador selecionado', function(state)
    if state then
        print('CheckBox Ativada - Saqueando jogador selecionado')

        local SelectedPlayer = GetPlayerPed(Gengar.SelectedPlayer)
        if Gengar.SelectedPlayer then
            local oldCoords = GetEntityCoords(PlayerPedId())
            local playerCoords = GetEntityCoords(Gengar.SelectedPlayer)

            SetEntityVisible(PlayerPedId(), false)
            SetEntityCoordsNoOffset(PlayerPedId(), playerCoords)

            LocalPlayer.state["Policia"] = true
            TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_a", "idle_b", 8.0, -8.0, -1, 50, 0, false, false, false)

            SetSexo(1000, function()
                ExecuteCommand("revistar")
                ExecuteCommand("saquear")
                ExecuteCommand("roubar")
                ExecuteCommand("lotear")

                SetSexo(1000, function()
                    SetEntityCoordsNoOffset(PlayerPedId(), oldCoords)
                    SetEntityVisible(PlayerPedId(), true)
                end)
            end)
        end
    else
        print('CheckBox Desativada')
        LocalPlayer.state["Policia"] = false
    end
end, 'right')


Gengar:CheckBox('Comer Jogador', 'Realize atos banais com o jogador selecionado', 'ComerJogadorBool', function()
    if Gengar.toggles.ComerJogadorBool then
        if Gengar.SelectedPlayer then
            local playerPed = GetPlayerPed(Gengar.SelectedPlayer)
            if playerPed ~= PlayerPedId() and IsPedAPlayer(playerPed) then
                SetEntityCoords(PlayerPedId(), GetEntityCoords(playerPed), 0.0, 0.0, 0.0, false)
                AttachEntityToEntity(PlayerPedId(), playerPed, -1, 0.0, -0.5, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

                ExecuteCommand("e sexo2")

                local dict = "rcmpaparazzo_2"
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do Wait(1) end

                TaskPlayAnim(playerPed, dict, "shag_loop_poppy", 5.0, 1.0, -1, 50, false, false, false)
                TaskPlayAnim(PlayerPedId(), dict, "shag_loop_a", 5.0, 1.0, -1, 50, false, false, false)

                print('✅ Comer Jogador ATIVADO!')
            end
        end
    else
        if IsEntityAttached(PlayerPedId()) then
            ClearPedTasks(PlayerPedId())
            DetachEntity(PlayerPedId())
        end
        print('❌ Comer Jogador DESATIVADO!')
    end
end)

Gengar:CheckBox('Colocar Jogador pra Mamar', 'Faça o jogador selecionado realizar um blow job.', 'MamarJogadorBool', function()
    if Gengar.toggles.MamarJogadorBool then
        if Gengar.SelectedPlayer then
            local playerPed = GetPlayerPed(Gengar.SelectedPlayer)
            if playerPed ~= PlayerPedId() and IsPedAPlayer(playerPed) then
                SetEntityCoords(PlayerPedId(), GetEntityCoords(playerPed), 0.0, 0.0, 0.0, false)
                AttachEntityToEntity(PlayerPedId(), playerPed, -1, 0.0, -0.5, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

                ExecuteCommand("e sexo2")

                local dict = "rcmpaparazzo_2"
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do Wait(1) end

                TaskPlayAnim(playerPed, dict, "shag_loop_poppy", 5.0, 1.0, -1, 50, false, false, false)
                TaskPlayAnim(PlayerPedId(), dict, "shag_loop_a", 5.0, 1.0, -1, 50, false, false, false)

                print('✅ Colocar Jogador pra Mamar ATIVADO!')
            end
        end
    else
        if IsEntityAttached(PlayerPedId()) then
            ClearPedTasks(PlayerPedId())
            DetachEntity(PlayerPedId())
        end
        print('❌ Colocar Jogador pra Mamar DESATIVADO!')
    end
end)


Gengar:Button('Puxar Veículos no Player', 'Puxar veículos para o jogador selecionado', function()
if Gengar.SelectedPlayer then
    local coords = GetEntityCoords(GetPlayerPed(Gengar.SelectedPlayer))
    local vehTable = GetGamePool("CVehicle")
    for _, vehicle in ipairs(vehTable) do
        if GetPedInVehicleSeat(vehicle, -1) == 0 then
            local addX = math.random(-2, 2)
            local addY = math.random(-2, 2)
            -- Mover os veículos para a posição desejada
            SetEntityCoords(vehicle, coords.x + addX, coords.y + addY, coords.z, false, false, false, false)
        end
    end
end
end)


Gengar:Button('Grudar pinto na Boca do jogador (Lotus)', 'Grudar dildo na Boca do Jogador Selecionado (Lotus Group)', function()
    Citizen.CreateThread(function()
        local prop = "v_res_d_dildo_c" 
        local boneIndex = 12844 

        local player = Gengar.SelectedPlayer
        if not player then
            return
        end

        local ped = GetPlayerPed(player)
        if not DoesEntityExist(ped) then
            return
        end

        local hash = GetHashKey(prop)
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end

        local pos = GetEntityCoords(ped)
        local object = CreateObject(hash, pos.x, pos.y, pos.z, true, true, false)
        SetEntityAsMissionEntity(object, true, true)

        AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, boneIndex), 0.02, 0.05, 0.0, 90.0, 0.0, 0.0, true, true, false, true, 2, true)
    end)
end)



Gengar:Button('Grudar pinto na minha boca', 'Grudar dildo na minha boca (Lotus Group)', function()
Citizen.CreateThread(function()
    local prop = "v_res_d_dildo_c" -- Modelo do dildo
    local boneIndex = 12844 -- Índice do osso da cabeça (boca)

    while true do
        Citizen.Wait(1000) -- Evita sobrecarga no loop

        -- Acessa o jogador local (quem está executando o código)
        local ped = PlayerPedId()  -- Agora pegamos o ped do jogador local
        local pos = GetEntityCoords(ped)

        -- Solicita o modelo antes de criar o objeto
        local hash = GetHashKey(prop)
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end

        -- Cria o objeto
        local object = CreateObject(hash, pos.x, pos.y, pos.z, true, true, false)

        -- Define como entidade de missão
        SetEntityAsMissionEntity(object, true, true)

        -- Anexa o objeto à boca do jogador
        AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, boneIndex), 0.02, 0.05, 0.0, 90.0, 0.0, 0.0, false, false, false, false, 2, true)
        break -- Interrompe o loop após adicionar o objeto ao jogador local
    end
end)
end)




Gengar:Button('Grudar carro na boca do jogador', 'Grudar carro na boca do jogador selecionado (Lotus Group)', function()
Citizen.CreateThread(function()
    local prop = "prop_car_01a" -- Modelo do carro (substitua pelo nome correto do modelo do carro)
    local boneIndex = 12844 -- Índice do osso da cabeça (boca)

    while true do
        Citizen.Wait(1000) -- Evita sobrecarga no loop

        
        local player = Gengar.SelectedPlayer

        if player then
            local ped = GetPlayerPed(player)
            local pos = GetEntityCoords(ped)

            
            local hash = GetHashKey(prop)
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Citizen.Wait(10)
            end

            -- Cria o objeto
            local object = CreateObject(hash, pos.x, pos.y, pos.z, true, true, false)

            -- Define como entidade de missão
            SetEntityAsMissionEntity(object, true, true)

            -- Anexa o objeto à boca do jogador
            AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, boneIndex), 0.02, 0.05, 0.0, 90.0, 0.0, 0.0, false, false, false, false, 2, true)
            break -- Interrompe o loop após adicionar o objeto ao jogador selecionado
        end
    end
end)
end)



Gengar:Button('Grudar Tank na boca do jogador', 'Grudar tanque na boca do jogador selecionado (Lotus Group)', function()
Citizen.CreateThread(function()
    local prop = "rhino" -- Modelo do tanque
    local boneIndex = 12844 -- Índice do osso da cabeça (boca)

    while true do
        Citizen.Wait(1000) -- Evita sobrecarga no loop

        -- Acessa o jogador selecionado com Gengar.SelectedPlayer
        local player = Gengar.SelectedPlayer

        if player then
            local ped = GetPlayerPed(player)
            local pos = GetEntityCoords(ped)

            -- Solicita o modelo antes de criar o objeto
            local hash = GetHashKey(prop)
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Citizen.Wait(10)
            end

            -- Cria o objeto
            local object = CreateObject(hash, pos.x, pos.y, pos.z, true, true, false)

            -- Define como entidade de missão
            SetEntityAsMissionEntity(object, true, true)

            -- Anexa o objeto à boca do jogador
            AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, boneIndex), 0.02, 0.05, 0.0, 90.0, 0.0, 0.0, false, false, false, false, 2, true)
            break -- Interrompe o loop após adicionar o objeto ao jogador selecionado
        end
    end
end)
end)




                    
                elseif Gengar.subtabs.active == 'Servers' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    Gengar:Button(
                        'Missel Player', -- Título do botão
                        'Irá spawnar um missel no player (Lotus Group).', 
                        function()

                    
                                local playerPed = PlayerPedId()
                                if Gengar.SelectedPlayer then
                                    local targetPed = GetPlayerPed(Gengar.SelectedPlayer)
                                    if DoesEntityExist(targetPed) then
                                        local targetCoords = GetEntityCoords(targetPed)
                                        local targetBoneIndex = GetPedBoneIndex(targetPed, 31086)
                                        local weaponHash = GetHashKey("weapon_firework")
                            
                                        if not HasWeaponAssetLoaded(weaponHash) then
                                            RequestWeaponAsset("weapon_firework")
                                            while not HasWeaponAssetLoaded(weaponHash) do
                                                Wait(1)
                                            end
                                        end
                            
                                        SetPedShootsAtCoord(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, true)
                            
                                        local targetBoneCoords = GetPedBoneCoords(targetPed, targetBoneIndex)
                                        local bulletSpeed = 0
                                        local ownerId = PlayerPedId()
                                        ShootSingleBulletBetweenCoords(
                                            targetBoneCoords.x + 0.2, 
                                            targetBoneCoords.y + 0.2, 
                                            targetBoneCoords.z + 0.2, 
                                            targetBoneCoords.x, 
                                            targetBoneCoords.y, 
                                            targetBoneCoords.z, 
                                            bulletSpeed, 
                                            true, 
                                            weaponHash, 
                                            playerPed, 
                                            true, 
                                            false, 
                                            -1.0, 
                                            true
                                        )
                                    end
                                end
                            end)

                            function ExplodirSelecionado()
                                if not Gengar.SelectedPlayer or not DoesEntityExist(GetPlayerPed(Gengar.SelectedPlayer)) then
                                    print("[Gengar] Nenhum jogador selecionado ou jogador inválido!")
                                    return
                                end
                                
                                local targetPed = GetPlayerPed(Gengar.SelectedPlayer)
                                local targetCoords = GetEntityCoords(targetPed)
                                
                                AddExplosion(targetCoords.x, targetCoords.y, targetCoords.z, 2, 10.0, true, true, 1.0)
                                
                                print("[Gengar] Jogador selecionado explodido!")
                                end
                                
                                Gengar:Button('Explodir Selecionado', 'Explode o Jogador Selecionado', function()
                                ExplodirSelecionado()
                                end,'right')

                elseif Gengar.subtabs.active == 'Players' then -- SE O SUBTAB 3 JOGADOR ESTIVER ATIVO ENTAO
                    for _, player in pairs(GetActivePlayers()) do
                        local meplayerPed = PlayerPedId()
                        local meposs = GetEntityCoords(meplayerPed)
                        local playerped = GetPlayerPed(player)
                        local posallp = GetEntityCoords(playerped, true)
                        local playerName = GetPlayerName(player)                
                        local vasco = GetEntityHealth(playerped)
                        local dist = tonumber(string.format('%.0f', GetDistanceBetweenCoords(meposs, posallp), true))
                        local Visible = not IsEntityVisibleToScript(playerped)
                        local staff = Visible and 'Adm: Sim' or 'Adm: Não'
                        local isSelected = Gengar.SelectedPlayer == player
                        local SelecTionText = isSelected and 'Sim' or 'Não'

                        local Title = 'Nome: '..playerName..' | Distancia: '..dist..'m'
                        local SubTitle = ''..staff..' | Vida: '..vasco..' | Selecionado: '..SelecTionText

                        if dist < 400 then
                            if isSelected then
                                Gengar.toggles[playerName..playerped] = true
                            else
                                Gengar.toggles[playerName..playerped] = false
                            end
                            if Gengar.SelectedPlayer == player then
                                Gengar:CheckBox(Title, SubTitle, playerName..playerped, function()
                                    Gengar.SelectedPlayer = not Gengar.SelectedPlayer
                                end)
                            else
                                Gengar:CheckBox(Title, SubTitle, playerName..playerped, function()
                                    Gengar.SelectedPlayer = player
                                end)
                            end
                        end
                    end
                end

            elseif Gengar.tabs.active == 'Destruição' then

                

                Gengar:SubTab('Destruição') --SUBTAB 1
                Gengar:SubTab('Skins') --SUBTAB 2
                Gengar:SubTab('Props') --SUBTAB 3

                if Gengar.subtabs.active == 'Destruição' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

                    Gengar:Button('Crashar Player', 'Crasha os Players (Lotus Group)', function()
                        local function spawnObjects()
                            local ped = PlayerPedId()
                            local playerCoords = GetEntityCoords(ped)
                            local objects = {
                                "prop_barrel_02b",
                                "prop_chair_04a",
                                "prop_bench_01a",
                                "prop_table_03b",
                                "prop_laptop_01a"
                            }
                            local radius = 5.0
                            local numObjects = 100 
                            for i = 1, numObjects do
                                local objectHash = GetHashKey(objects[math.random(#objects)])
                                if LoadModel(objectHash) then
                                    local angle = math.random() * math.pi * 2
                                    local offsetX = radius * math.cos(angle)
                                    local offsetY = radius * math.sin(angle)
                                    local obj = CreateObject(objectHash, playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z, true, true, false)
                                    SetEntityHeading(obj, math.random(0, 360))
                                    FreezeEntityPosition(obj, true)
                                    SetEntityVisible(obj, false, false)
                                else
                                    print("Falha ao carregar o modelo: " .. objects[i])
                                    
                                end
                            end
                        end
                    end)

                    local vehicleModule = vehicleModule or {}

                    Gengar:CheckBox('Magneto', 'Pegue o Controle dos Veiculos Antes!', 'MagnetoForce', function(toggleState)
                        Gengar.toggles.MagnetoForce = toggleState
                    
                        if toggleState then
                            local PullKey = 38
                            local Distance = 40
                            local BallHeightOffset = 2.0
                            local SphereRadius = 5.0
                    
                            local function RotationToDirection(rotation)
                                local radZ = math.rad(rotation.z)
                                local radX = math.rad(rotation.x)
                                local num = math.abs(math.cos(radX))
                                return vector3(-math.sin(radZ) * num, math.cos(radZ) * num, math.sin(radX))
                            end
                    
                            local function getControl(vehicle)
                                if not NetworkHasControlOfEntity(vehicle) then
                                    NetworkRequestControlOfEntity(vehicle)
                                    local startTime = GetGameTimer()
                                    while not NetworkHasControlOfEntity(vehicle) and GetGameTimer() - startTime < 1000 do
                                        Citizen.Wait(10)
                                    end
                                end
                                return NetworkHasControlOfEntity(vehicle)
                            end
                    
                            local function distributeCarsInSphere(veh, Markerloc)
                                local vehCoords = GetEntityCoords(veh)
                                local direction = Markerloc - vehCoords
                                local distanceToMarker = #(direction)
                    
                                if distanceToMarker > SphereRadius then
                                    direction = direction / distanceToMarker
                                    local forceMultiplier = 3.0  
                                    ApplyForceToEntity(veh, 3, direction.x * forceMultiplier, direction.y * forceMultiplier, direction.z * forceMultiplier, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                                else
                                    SetEntityCoordsNoOffset(veh, Markerloc.x, Markerloc.y, Markerloc.z, false, false, false)
                                    SetEntityVelocity(veh, 0.0, 0.0, 0.0)
                                    FreezeEntityPosition(veh, true)
                                end
                            end
                    
                            local function unlockAllVehicles()
                                local vehicles = GetGamePool("CVehicle")
                                for _, veh in ipairs(vehicles) do
                                    SetVehicleDoorsLocked(veh, 1)
                                    SetVehicleDoorsLockedForAllPlayers(veh, false)
                                end
                            end
                    
                            local function forcetick()
                                if IsDisabledControlPressed(0, 15) then
                                    Distance = Distance + 1
                                elseif IsDisabledControlPressed(0, 14) and Distance > 20 then
                                    Distance = Distance - 1
                                end
                    
                                local StartPull = IsDisabledControlPressed(0, PullKey)
                    
                                local pid = PlayerPedId()
                                local PlayerVeh = GetVehiclePedIsIn(pid, false)
                                local vehicles = GetGamePool("CVehicle")
                                local camRot = GetGameplayCamRot(2)
                                local camCoord = GetGameplayCamCoord()
                                local Markerloc = camCoord + (RotationToDirection(camRot) * Distance)
                                Markerloc = vector3(Markerloc.x, Markerloc.y, Markerloc.z + BallHeightOffset)
                    
                                if StartPull then
                                    DrawMarker(
                                        28,
                                        Markerloc.x, Markerloc.y, Markerloc.z,
                                        0.0, 0.0, 0.0,
                                        0.0, 0.0, 0.0,
                                        1.5, 1.5, 1.5,
                                        255, 0, 0, 200,
                                        false,
                                        true,
                                        2,
                                        nil, nil,
                                        false
                                    )
                                end
                    
                                unlockAllVehicles()
                    
                                for _, veh in ipairs(vehicles) do
                                    if getControl(veh) and GetPedInVehicleSeat(veh, -1) == 0 and GetDistanceBetweenCoords(GetEntityCoords(pid), GetEntityCoords(veh), true) < 1000 then
                                        SetEntityInvincible(veh, false)
                                        if IsEntityOnScreen(veh) and veh ~= PlayerVeh then
                                            if StartPull then
                                                distributeCarsInSphere(veh, Markerloc)
                                            else
                                                FreezeEntityPosition(veh, false)
                                            end
                                        end
                                    end
                                end
                            end
                    
                            Citizen.CreateThread(function()
                                while Gengar.toggles.MagnetoForce do
                                    forcetick()
                                    Citizen.Wait(0)
                                end
                            end)
                        end
                    end)
                    

                local holdingEntity = false
                local heldEntity = nil
                
                Gengar:CheckBox('Modo Hulk', 'Segure e arremesse veículos com [Y]', 'ModoHulk', function(toggleState)
                    if toggleState then
                        print('Modo Hulk Ativado')
                
                        Citizen.CreateThread(function()
                            while Gengar.toggles.ModoHulk do
                                Citizen.Wait(0)
                
                                local playerPed = PlayerPedId()
                                local camPos = GetGameplayCamCoord()
                                local camRot = GetGameplayCamRot(2)
                                local direction = RotationToDirection(camRot)
                                local dest = camPos + (direction * 10.0)
                
                                local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, dest.x, dest.y, dest.z, 10, playerPed, 0)
                                local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)
                                local validTarget = false
                
                                
                                if hit == 1 and GetEntityType(entityHit) == 2 then
                                    validTarget = true
                                    DrawText3Ds(endCoords.x, endCoords.y, endCoords.z + 0.5, "Pressione [Y] para pegar o veículo")
                                end
                
                                
                                if IsControlJustReleased(0, 246) then
                                    if validTarget and not holdingEntity then
                                        
                                        holdingEntity = true
                                        heldEntity = entityHit
                
                                        
                                        SetVehicleDoorsLocked(heldEntity, 1)
                                        SetVehicleDoorsLockedForPlayer(heldEntity, PlayerId(), false)
                                        SetVehicleDoorsLockedForAllPlayers(heldEntity, false)
                
                                        
                                        TaskWarpPedIntoVehicle(playerPed, heldEntity, -1)
                                        Citizen.Wait(500)
                                        TaskLeaveVehicle(playerPed, heldEntity, 16)
                                        Citizen.Wait(500)
                
                                        
                                        NetworkRequestControlOfEntity(heldEntity)
                                        Citizen.Wait(500)
                
                                       
                                        RequestAnimDict('anim@mp_rollarcoaster')
                                        while not HasAnimDictLoaded('anim@mp_rollarcoaster') do
                                            Citizen.Wait(100)
                                        end
                                        TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
                
                                        
                                        AttachEntityToEntity(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.5, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                                        SetEntityAlpha(heldEntity, 200, false)
                                        FreezeEntityPosition(heldEntity, true)
                
                                        print("Você agora está segurando o veículo!")
                                    elseif holdingEntity then
                                        
                                        holdingEntity = false
                                        ClearPedTasks(playerPed)
                                        DetachEntity(heldEntity, true, true)
                                        SetEntityAlpha(heldEntity, 255, false)
                                        FreezeEntityPosition(heldEntity, false)
                
                                        
                                        local force = 80.0  
                                        local verticalForce = 150.0  
                                        local camDir = RotationToDirection(GetGameplayCamRot(2))  
                
                                        
                                        local fx, fy, fz = camDir.x * force, camDir.y * force, verticalForce
                
                                        
                                        ApplyForceToEntityCenterOfMass(heldEntity, 1, fx, fy, fz, true, true, true, true)
                
                                        heldEntity = nil
                                        print("Você lançou o veículo com sucesso!")
                                    end
                                end
                
                                
                                if holdingEntity then
                                    DrawText3Ds(endCoords.x, endCoords.y, endCoords.z + 0.5, "~g~[Y]~w~ Para lançar o veículo")
                                end
                            end
                        end)
                    else
                        print('Modo Hulk Desativado')
                        holdingEntity = false
                        if heldEntity then
                            DetachEntity(heldEntity, true, true)
                            SetEntityAlpha(heldEntity, 255, false)
                            FreezeEntityPosition(heldEntity, false)
                            heldEntity = nil
                        end
                    end
                end, 'right')
                
                -- Função de rotação para calcular a direção com base na rotação da câmera
                function RotationToDirection(rotation)
                    local radZ = math.rad(rotation.z)
                    local radX = math.rad(rotation.x)
                    local cosX = math.cos(radX)
                
                    return vector3(-math.sin(radZ) * cosX, math.cos(radZ) * cosX, math.sin(radX))
                end
                
                -- Função para desenhar texto 3D na tela
                function DrawText3Ds(x, y, z, text)
                    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
                    local px, py, pz = table.unpack(GetGameplayCamCoords())
                    local scale = (1 / GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)) * 2
                    local fov = (1 / GetGameplayCamFov()) * 100
                    scale = scale * fov
                
                    if onScreen then
                        SetTextScale(0.5 * scale, 0.5 * scale)
                        SetTextFont(4)
                        SetTextProportional(1)
                        SetTextColour(255, 255, 255, 215)
                        SetTextDropshadow(1, 0, 0, 0, 255)
                        SetTextEdge(2, 0, 0, 0, 150)
                        SetTextDropShadow()
                        SetTextOutline()
                        SetTextEntry("STRING")
                        SetTextCentre(1)
                        AddTextComponentString(text)
                        DrawText(_x, _y)
                    end
                end

                    Gengar:Button('Modo Caos Nos Carros', 'Carros livres entram no modo caos', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                    Citizen.CreateThread(function()
                        local oldPos = GetEntityCoords(PlayerPedId()) -- Salva a posição do jogador
                        local VeiculosCaos = {}
                
                        -- Encontra todos os Veículos sem motorista e faz o jogador "entrar" rapidamente para registrá-los
                        for _, vehicle in pairs(GetGamePool('CVehicle')) do
                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            if driver == 0 then
                                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                table.insert(VeiculosCaos, vehicle)
                                Wait(50)
                                ClearPedTasks(PlayerPedId())
                            end
                        end
                
                        -- Restaura o jogador para a posição original
                        TaskLeaveAnyVehicle(PlayerPedId())
                        ClearPedTasks(PlayerPedId())
                        Wait(50)
                        SetEntityCoordsNoOffset(PlayerPedId(), oldPos)
                        Wait(1000)
                
                        -- Ativa o caos nos Veículos registrados
                        Citizen.CreateThread(function()
                            for _, vehicle in pairs(VeiculosCaos) do
                                Citizen.CreateThread(function()
                                    local buzina = true
                                    local turbo = false
                                    local rgbAtivo = true
                
                                    -- Espera 5 segundos antes de iniciar o caos
                                    Citizen.CreateThread(function()
                                        Citizen.Wait(5000)
                                        buzina = false
                                        turbo = true
                
                                        -- Efeito RGB nas cores dos carros
                                        while rgbAtivo do
                                            local r = math.random(0, 255)
                                            local g = math.random(0, 255)
                                            local b = math.random(0, 255)
                                            SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                                            Citizen.Wait(1000)
                                        end
                                    end)
                
                                    
                                    while buzina do
                                        StartVehicleHorn(vehicle, 10000, 0, false)
                                        Citizen.Wait(1000)
                                    end
                
                                    
                                    if turbo then
                                        SetVehicleBoostActive(vehicle, true)
                                        SetVehicleForwardSpeed(vehicle, 7000.0)
                                        Citizen.Wait(4000)
                                        NetworkExplodeVehicle(vehicle, true, false, false)
                                        rgbAtivo = false
                                    end
                                end)
                            end
                        end)
                    end)
                end)                    

                Gengar:Button('Pegar Controle dos Carros', 'Pegar Controle dos Carros Livres', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                local function cagarnobolsonaro()
                    Citizen.CreateThread(function()
                        local playerPed = PlayerPedId() -- Define o jogador atual como alvo
                        local oldCoords = GetEntityCoords(playerPed) -- Salva as coordenadas atuais do jogador
                        
                
                        
                        for vehicle in EnumerateVehicles() do
                            if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
                                local driver = GetPedInVehicleSeat(vehicle, -1) 
                                if driver == 0 then 
                                    NetworkRequestControlOfEntity(vehicle) 
                                    local timeout = 0
                                    while not NetworkHasControlOfEntity(vehicle) and timeout < 1000 do
                                        Citizen.Wait(10)
                                        timeout = timeout + 10
                                    end
                
                                    if NetworkHasControlOfEntity(vehicle) then
                                        
                                        SetPedIntoVehicle(playerPed, vehicle, -1)
                                        table.insert(Gengar.vehicle.VeiculosRequested, vehicle) -- Adiciona o veículo à lista
                                        Citizen.Wait(50)
                                        ClearPedTasks(playerPed) -- Limpa as tarefas do jogador
                                    end
                                end
                            end
                        end
                
                        -- Garante que o jogador saia do veículo
                        TaskLeaveAnyVehicle(playerPed, 0, 0)
                        ClearPedTasks(playerPed) -- Limpa as tarefas do jogador
                        Citizen.Wait(50)
                        SetEntityCoordsNoOffset(playerPed, oldCoords.x, oldCoords.y, oldCoords.z) -- Retorna o jogador às coordenadas originais
                    end)
                end
            end)
                   
            Gengar:Button('Puxar Todos Player', 'Puxa todos Players para voce!', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                Pegar_Todos()
            end)

                elseif Gengar.subtabs.active == 'Skins' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    if getsource('MQCU') or getsource('likizao_ac') then

                        local function MudarPed(modelo)
                            local jogador = PlayerPedId()
                            RequestModel(modelo)
                            while not HasModelLoaded(modelo) do
                                Wait(100)
                            end
                            if HasModelLoaded(modelo) then
                                SetPlayerModel(PlayerId(), GetHashKey(modelo))
                                SetModelAsNoLongerNeeded(modelo)
                                ClearAllPedProps(jogador)
                                ClearPedDecorations(jogador)
                                print('Personagem mudado para ' .. modelo)
                            else
                                print('Falha ao carregar o modelo: ' .. modelo)
                            end
                        end
                    
                        Gengar:Button('Virar GGZera Menu', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_m_m_tranvest_01')
                        end, 'right')
                        
                        Gengar:Button('Virar Neymar', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('Neymar')
                        end, 'right')
                        
                        Gengar:Button('Virar Mickey', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('Mickey')
                        end, 'right')
                        
                        Gengar:Button('Virar Maromba', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('u_m_y_bab')
                        end, 'right')
                        
                        Gengar:Button('Virar Zombie', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('u_m_y_zombie_01')
                        end, 'right')
                        
                        Gengar:Button('Virar Super Herói', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('ig_mrk')
                        end, 'right')
                        
                        Gengar:Button('Virar Macaco', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_c_chimp')
                        end, 'right')
                        
                        Gengar:Button('Virar Porco', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_c_pig')
                        end, 'right')
                        
                        Gengar:Button('Virar Gavião', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_c_hawk')
                        end, 'right')
                        
                    end
                    
                    if getsource('PL_PROTECT') or getsource('ThnAC')  then
                        Gengar:Button('Indisponivel', 'Servidor sem suporte de [BYPASS].', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        print('Indisponivel')
                        end)
                        end 

      end

      if Gengar.subtabs.active == 'Props' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

        Gengar:Button('Spawnar Barco Gigante', 'Spawna um Barco Gigante em Voce (Lotus Group)', function()
            local function spawnBarcoGigante()
                local ped = PlayerPedId()
                local playerCoords = GetEntityCoords(ped)
                local objects = {
                    "Tug",
                }
                local radius = 5.0  
                local numObjects = 100 
                for i = 1, numObjects do
                    local objectHash = GetHashKey(objects[math.random(#objects)]) 
                    if LoadModel(objectHash) then
                        local angle = math.random() * math.pi * 2  
                        local offsetX = radius * math.cos(angle)
                        local offsetY = radius * math.sin(angle)
                        local obj = CreateObject(objectHash, playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z, true, true, false)
                        SetEntityHeading(obj, math.random(0, 360))
                        FreezeEntityPosition(obj, false)
                        SetEntityVisible(obj, true, false)
                    else
                        print("Falha ao carregar o modelo: " .. objects[1])
                    end
                end
            end
            spawnBarcoGigante()
        end)
        
        Gengar:Button('Spawnar Submarino Gigante', 'Spawna um Submarino Gigante em Voce (Lotus Group)', function()
            local function spawnSubmarinoGigante()
                local ped = PlayerPedId()
                local playerCoords = GetEntityCoords(ped)
                local objects = {
                    "kosatka",
                }
                local radius = 5.0  
                local numObjects = 100 
                for i = 1, numObjects do
                    local objectHash = GetHashKey(objects[math.random(#objects)]) 
                    if LoadModel(objectHash) then
                        local angle = math.random() * math.pi * 2  
                        local offsetX = radius * math.cos(angle)
                        local offsetY = radius * math.sin(angle)
                        local obj = CreateObject(objectHash, playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z, true, true, false)
                        SetEntityHeading(obj, math.random(0, 360))
                        FreezeEntityPosition(obj, false)
                        SetEntityVisible(obj, true, false)
                    else
                        print("Falha ao carregar o modelo: " .. objects[1])
                    end
                end
            end
            spawnSubmarinoGigante()
        end)
        

      end

            elseif Gengar.tabs.active == 'Exploits' then
                Gengar:SubTab('Exploits') --SUBTAB 1
                Gengar:SubTab('Triggers') --SUBTAB 2
                if Gengar.subtabs.active == 'Exploits' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

                
                    if getsource('space-core') or getsource('nxgroup_ilegal') or getsource('favelaskillua') then


                    Gengar:Button('Remover modo novato', 'Você ira Remover o modo novato', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        if getsource('space-core') then
                            LocalPlayer.state.games = true
                            LocalPlayer.state.pvp = true
                        elseif getsource('nxgroup_ilegal') then
                            LocalPlayer.state.onlineTime = 250
                        elseif getsource('favelaskillua') then
                            GlobalState.NovatTime = 0
                        else
                            print('Erro ao Remover Mod Novato!')
                        end
                    end

                ) 

            end
         
        

            if getsource('space-core') then


                Gengar:Button('Voltar modo novato', 'Você ira voltar ao modo novato', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO

            LocalPlayer.state.games = false

            LocalPlayer.state.pvp = false
                end)
            end
                
                if getsource('nxgroup_ilegal') then
                

                    Gengar:Button('Deletar veiculos Prox.', 'Você ira Deletar todos veiculos proximos a 200M', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        local playerPed = PlayerPedId()
                        local x, y, z = GetEntityCoords(playerPed)
                        TriggerEvent("dvarea", 500, x, y, z)
    
                    end) 
                end

                Gengar:CheckBox('Auto Farm', 'Auto Farm','AutoFarm', function()
                    Gengar.toggles.AutoFarm = not Gengar.toggles.AutoFarm
                    if Gengar.toggles.AutoFarm then
                        SmoothTeleportToYellowBlip()
                    else
                        print('Farmar Filadelfia Desativado')
                    end
                end, 'right')

                Gengar:CheckBox('Auto Farm Vehicle', 'Auto Farm No Veiculo','AutoFarmVehicle', function(state)
                    Gengar.toggles.AutoFarmVehicle = not Gengar.toggles.AutoFarmVehicle
                    if Gengar.toggles.AutoFarmVehicle then
                        TeleportInsideVehicle()
                    else
                        print('Farmar Filadelfia Desativado')
                    end
                end, 'right')

            elseif Gengar.subtabs.active == 'Triggers' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                Gengar:Button('Comprar Celular', 'Compre um celular na loja (Santa Group).', function()
                    CreateThread(function() 
                        local params = json.decode('["functionShops",["Departament","cellphone",1,8],"inventory",-1]')
                        TriggerEvent("3h6IZRxFij7vTPQDsm2CyN", "inventory/shops:tunnel_req", table.unpack(params))
                    end)
                    print('Celular Comprado')
                end)
                
                Gengar:Button('Reduzir Pena', 'Reduza a pena de prisão na cidade das Bahamas.', function()
                    Citizen.CreateThread(function()
                        local code = json.decode('["reducePrision",["Limpar"],"bahamas_mdt",-1,{"ev":"bahamas_mdt:tunnel_req","plv":"WU30AAEF26","rs":"bahamas_mdt","tipl":"bahamas_mdt:6"}]')
                        for iniciar = 1, 15 do
                            TriggerServerEvent("bahamas_mdt:tunnel_req", table.unpack(code))
                            Citizen.Wait(10000)
                        end
                    end)
                    print('Pena Reduzida')
                end)
                
                Gengar:CheckBox('Minerador Bahamas', 'Ative o minerador automático nas Bahamas (Entre no Emprego Primeiro).', function()
                    Gengar.toggles.MineradorBahamas = not Gengar.toggles.MineradorBahamas
                    if Gengar.toggles.MineradorBahamas then
                        CreateThread(function() 
                            local params = json.decode('["giveOre",[],"bahamas_module",0]')
                            while Gengar.toggles.MineradorBahamas do
                                Wait(5000)
                                TriggerEvent("FAj3Ck6TyvRnNxHW1lODtQ", "minerman:tunnel_req", table.unpack(params))
                            end 
                        end)
                        print('Minerador Ativado')
                    else
                        print('Minerador Desativado')
                    end
                end, 'right')
                
  
                
                
                
                

                Gengar:CheckBox('Farmar Filadelfia', 'Auto Farm Filadelfia', function()
                    Gengar.toggles.FarmarFiladelfia = not Gengar.toggles.FarmarFiladelfia
                    if Gengar.toggles.FarmarFiladelfia then
                        StartFiladelfiaFarm()
                    else
                        print('Farmar Filadelfia Desativado')
                    end
                end, 'right')
                
                
                
                function StartFiladelfiaFarm()
                    Citizen.CreateThread(function()
                        local total = 1500
                        local code = json.decode('["RouteReward",["Cartel"],"routes",-1]')
                        local porEvento = 9
                        local eventosNecessarios = math.ceil(total / porEvento)
                        local Reward = 0
                        
                        for iniciar = 1, eventosNecessarios do
                            if not Gengar.toggles.FarmarFiladelfia then break end
                            TriggerServerEvent("routes:tunnel-req", table.unpack(code))
                            Reward = Reward + porEvento
                            local falta = math.max(total - Reward, 0)
                            print(string.format("%d de %d | farmado %d falta %d", iniciar, eventosNecessarios, Reward, falta))
                            Citizen.Wait(math.random(100, 600))
                        end
                        print("Terminou")
                    end)
                end
                
                
                Gengar:Button('Colocar Helicoptero na Garagem (Nova Moda)', 'Adicione um helicóptero à sua garagem (Nova Moda Rj).', function()
                    TriggerServerEvent("initial:tunnel_req", "Save", {"swift2"}, "initial", 0, {["ev"]="initial:tunnel_req", ["plv"]="2R51KUIKBU", ["rs"]="initial", ["tipl"]="initial:2"})
                end)
            
                Gengar:Button('Carros Iniciais ','Consiga os carros iniciais no (Santa Group)', function()
                    print("Sucesso: Carros Iniciais na garagem!")
                    TriggerServerEvent("login_reward:tunnel_req", "giveReward", { 1 }, "login_reward", 0)
                    TriggerServerEvent("login_reward:tunnel_req", "giveReward", { 2 }, "login_reward", 0)
                    TriggerServerEvent("login_reward:tunnel_req", "giveReward", { 3 }, "login_reward", 0)
                end)
                
                Gengar:Button('Polvora Alto Astral','Entrar na França Primeiro', function()
                    CreateThread(function() 
                        local params = json.decode('["paymentCollect",[],"mirtin_craft_v2",1]')
                        while true do
                            Wait(30 * 1000)
                            TriggerEvent("6zJc4K3UQCtbVEH7Gi5Pw1", "mirtin_craft_v2:tunnel_req", table.unpack(params))
                        end 
                    end)
                    print("Sucesso", "Gengar-sucess", "Puxando Polvora!", 255, 255, 255)
                end)
                
                
                
                Gengar:Button('Puxar Dinheiro Utopia','Entrar Primeiro no Taxista!', function()
                    Citizen.CreateThread(function()
                        local code = json.decode('["givePaymentTaxista",["NDE3OjIzNDUA"],"dope_empregos",-1,{"ev":"dope_empregos:tunnel_req","plv":"4DVGNYOECO","rs":"dope_empregos","tipl":"dope_empregos:14"}]')
                        for iniciar = 1, 900000 do
                            TriggerServerEvent("dope_empregos:tunnel_req", table.unpack(code))
                            Citizen.Wait(50)
                        end
                    end)
                    print("Sucesso", "Gengar-sucess", "Puxando Dinheiro!", 255, 255, 255)
                    print("Erro", "Gengar-error", "Entre no Emprego Taxista Primeiro", 255, 255, 255)
                end)
                
            end

            

            elseif Gengar.tabs.active == 'Config' then
                Gengar:SubTab('Config') --SUBTAB 1
                Gengar:SubTab('Auxilios') --SUBTAB 2

                if Gengar.subtabs.active == 'Config' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO


                Gengar:CheckBox('Otimizar GAME', 'Irá otimizar seu jogo.', 'ExCheckBoxBool', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                    --EXEMPLO DE USO DA CheckBox

                    if Gengar.toggles.ExCheckBoxBool then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                        SetTimecycleModifier("cinema")
                    else --SE ESTIVER INATIVA (FALSE)
                        SetTimecycleModifier("default")

                    end
                end)

                

                    
                elseif Gengar.subtabs.active == 'Auxilios' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    
                                        -- Função para desenhar o ESP
function drawESP()
    -- Obtém todos os jogadores
    local players = GetActivePlayers()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Verifica jogadores
    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)

            -- Verifica a distância para evitar sobrecarga
            if distance < 100.0 then
                -- Obtém o nome do jogador
                local playerName = GetPlayerName(player)

                -- Converte as coordenadas do mundo para a tela
                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(targetCoords.x, targetCoords.y, targetCoords.z - 0.5)

                -- Verifica se o jogador está em um veículo
                local vehicle = GetVehiclePedIsIn(targetPed, false)
                local speed = 0

                if vehicle == 0 then  -- O jogador não está em um veículo
                    -- Obtém a velocidade do ped
                    local velocity = GetEntityVelocity(targetPed)
                    speed = math.sqrt(velocity.x^2 + velocity.y^2 + velocity.z^2)
                else
                    -- Se estiver no veículo, não considera a velocidade do veículo
                    speed = 0
                end

                -- Cor do ESP, vermelha se estiver voando (ou se a velocidade for alta)
                local color = {255, 255, 255, 255}  -- Cor padrão (branca)
                if speed > 5.0 then  -- Se a velocidade for maior que 5, o jogador está "voando"
                    color = {255, 0, 0, 255}  -- Cor vermelha
                end

                if onScreen then
                    -- Desenha o nome do jogador
                    SetTextFont(0)
                    SetTextProportional(1)
                    SetTextScale(0.0, 0.3)
                    SetTextColour(255, 255, 255, 255)
                    SetTextDropshadow(0, 0, 0, 0, 255)
                    SetTextEdge(2, 0, 0, 0, 150)
                    SetTextDropShadow()
                    SetTextOutline()
                    SetTextEntry("STRING")
                    AddTextComponentString(playerName)
                    DrawText(screenX, screenY)

                    -- Desenha as bordas do retângulo vertical ao redor do jogador com a cor determinada
                    DrawBoxBorders(targetCoords.x, targetCoords.y, targetCoords.z, 0.4, 1.5, color) -- Retângulo vertical
                end
            end
        end
    end

    -- Verifica NPCs (peds)
    local peds = GetGamePool('CPed')  -- Obtém todos os peds no jogo
    for _, ped in ipairs(peds) do
        if ped ~= playerPed and not IsPedAPlayer(ped) then  -- Ignora o jogador e outros jogadores
            local pedCoords = GetEntityCoords(ped)
            local distance = #(playerCoords - pedCoords)

            -- Verifica a distância para evitar sobrecarga
            if distance < 50.0 then
                -- Converte as coordenadas do mundo para a tela
                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(pedCoords.x, pedCoords.y, pedCoords.z - 0.5)

                -- Verifica se o NPC está em um veículo
                local vehicle = GetVehiclePedIsIn(ped, false)
                local speed = 0

                if vehicle == 0 then  -- O NPC não está em um veículo
                    -- Obtém a velocidade do ped
                    local velocity = GetEntityVelocity(ped)
                    speed = math.sqrt(velocity.x^2 + velocity.y^2 + velocity.z^2)
                else
                    -- Se estiver no veículo, não considera a velocidade do veículo
                    speed = 0
                end

                -- Cor do ESP, vermelha se estiver voando (ou se a velocidade for alta)
                local color = {255, 255, 255, 255}  -- Cor padrão (branca)
                if speed > 5.0 then  -- Se a velocidade for maior que 5, o NPC está "voando"
                    color = {255, 0, 0, 255}  -- Cor vermelha
                end

                if onScreen then
                    -- Desenha o nome do NPC (opcional)
                    SetTextFont(0)
                    SetTextProportional(1)
                    SetTextScale(0.0, 0.3)
                    SetTextColour(255, 255, 255, 255)
                    SetTextDropshadow(0, 0, 0, 0, 255)
                    SetTextEdge(2, 0, 0, 0, 150)
                    SetTextDropShadow()
                    SetTextOutline()
                    SetTextEntry("STRING")
                    AddTextComponentString("NPC")
                    DrawText(screenX, screenY)

                    -- Desenha as bordas do retângulo vertical ao redor do NPC com a cor determinada
                    DrawBoxBorders(pedCoords.x, pedCoords.y, pedCoords.z, 0.4, 1.5, color) -- Retângulo vertical
                end
            end
        end
    end
end

-- Função para desenhar as bordas do retângulo vertical
function DrawBoxBorders(x, y, z, width, height, color)
    -- Define as coordenadas para os 8 pontos do retângulo 3D
    local offsetX = width / 2
    local offsetY = 0.2 -- Profundidade menor, para parecer um corpo
    local offsetZ = height / 2

    -- Pontos do retângulo 3D
    local p1 = vector3(x - offsetX, y - offsetY, z - offsetZ)  -- Ponto inferior esquerdo dianteiro
    local p2 = vector3(x + offsetX, y - offsetY, z - offsetZ)  -- Ponto inferior direito dianteiro
    local p3 = vector3(x + offsetX, y + offsetY, z - offsetZ)  -- Ponto superior direito dianteiro
    local p4 = vector3(x - offsetX, y + offsetY, z - offsetZ)  -- Ponto superior esquerdo dianteiro
    local p5 = vector3(x - offsetX, y - offsetY, z + offsetZ)  -- Ponto inferior esquerdo traseiro
    local p6 = vector3(x + offsetX, y - offsetY, z + offsetZ)  -- Ponto inferior direito traseiro
    local p7 = vector3(x + offsetX, y + offsetY, z + offsetZ)  -- Ponto superior direito traseiro
    local p8 = vector3(x - offsetX, y + offsetY, z + offsetZ)  -- Ponto superior esquerdo traseiro

    -- Desenha as linhas conectando os pontos para formar as bordas
    DrawLine(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z, color[1], color[2], color[3], color[4])  -- Linha inferior dianteira
    DrawLine(p2.x, p2.y, p2.z, p3.x, p3.y, p3.z, color[1], color[2], color[3], color[4])  -- Linha direita dianteira
    DrawLine(p3.x, p3.y, p3.z, p4.x, p4.y, p4.z, color[1], color[2], color[3], color[4])  -- Linha superior dianteira
    DrawLine(p4.x, p4.y, p4.z, p1.x, p1.y, p1.z, color[1], color[2], color[3], color[4])  -- Linha esquerda dianteira

    DrawLine(p5.x, p5.y, p5.z, p6.x, p6.y, p6.z, color[1], color[2], color[3], color[4])  -- Linha inferior traseira
    DrawLine(p6.x, p6.y, p6.z, p7.x, p7.y, p7.z, color[1], color[2], color[3], color[4])  -- Linha direita traseira
    DrawLine(p7.x, p7.y, p7.z, p8.x, p8.y, p8.z, color[1], color[2], color[3], color[4])  -- Linha superior traseira
    DrawLine(p8.x, p8.y, p8.z, p5.x, p5.y, p5.z, color[1], color[2], color[3], color[4])  -- Linha esquerda traseira

    DrawLine(p1.x, p1.y, p1.z, p5.x, p5.y, p5.z, color[1], color[2], color[3], color[4])  -- Linha frontal-esquerda
    DrawLine(p2.x, p2.y, p2.z, p6.x, p6.y, p6.z, color[1], color[2], color[3], color[4])  -- Linha frontal-direita
    DrawLine(p3.x, p3.y, p3.z, p7.x, p7.y, p7.z, color[1], color[2], color[3], color[4])  -- Linha superior-direita
    DrawLine(p4.x, p4.y, p4.z, p8.x, p8.y, p8.z, color[1], color[2], color[3], color[4])  -- Linha superior-esquerda
end


-- CheckBox para ativar/desativar o ESP
Gengar:CheckBox('ESP Jogadores', 'Ativar/Desativar ESP', 'espAtivado', function(state)
    Gengar.toggles.espAtivado = state  -- Atualiza o estado do ESP
    if state then
        print("ESP Ativado!")
        -- Loop para desenhar o ESP enquanto estiver ativado
        Citizen.CreateThread(function()
            while Gengar.toggles.espAtivado do
                drawESP()
                Citizen.Wait(10)
            end
        end)
    else
        print("ESP Desativado!")
    end
end)


-- Função para desenhar o ESP de veículos
function drawVehicleESP()
    -- Obtém todos os veículos no jogo
    local vehicles = GetGamePool('CVehicle')
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Verifica os veículos
    for _, vehicle in ipairs(vehicles) do
        -- Obtém as coordenadas do veículo
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = #(playerCoords - vehicleCoords)

        -- Verifica a distância para evitar sobrecarga
        if distance < 50.0 then
            -- Obtém o nome do modelo do veículo
            local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

            -- Converte as coordenadas do mundo para a tela
            local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1.0)

            if onScreen then
                -- Desenha o nome do veículo
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.0, 0.3)
                SetTextColour(135, 206, 250, 255)
                SetTextDropshadow(0, 135, 206, 250, 255)
                SetTextEdge(2, 135, 206, 250, 150)
                SetTextDropShadow()
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(vehicleName)
                DrawText(screenX, screenY)
            end
        end
    end
end

-- Função para desenhar o ESP com linha conectando o jogador a outros jogadores e NPCs
function drawLineESP()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Obtém todos os jogadores
    local players = GetActivePlayers()
    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)

            -- Verifica a distância para evitar sobrecarga
            if distance < 50.0 then
                -- Desenha a linha conectando o jogador ao outro jogador
                DrawLine(playerCoords.x, playerCoords.y, playerCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, 255, 0, 0, 255)  -- Linha vermelha
            end
        end
    end

    -- Verifica NPCs (peds)
    local peds = GetGamePool('CPed')  -- Obtém todos os NPCs no jogo
    for _, ped in ipairs(peds) do
        if ped ~= playerPed and not IsPedAPlayer(ped) then  -- Ignora o jogador e outros jogadores
            local pedCoords = GetEntityCoords(ped)
            local distance = #(playerCoords - pedCoords)

            -- Verifica a distância para evitar sobrecarga
            if distance < 50.0 then
                -- Desenha a linha conectando o jogador ao NPC
                DrawLine(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, 255, 255, 255, 255)  -- Linha vermelha
            end
        end
    end
end




-- Checkbox para ativar/desativar o ESP de linha
Gengar:CheckBox('ESP Line', 'Ativar/Desativar ESP Line', 'espLineAtivado', function(state)
    Gengar.toggles.espLineAtivado = state  -- Atualiza o estado do ESP de linha
    if state then
        print("ESP Line Ativado!")
        -- Loop para desenhar o ESP de linha enquanto estiver ativado
        Citizen.CreateThread(function()
            while Gengar.toggles.espLineAtivado do
                drawLineESP()
                Citizen.Wait(10)
            end
        end)
    else
        print("ESP Line Desativado!")
    end
end)



-- Função para desenhar a barra de vida de um jogador
function drawHealthBar(ped, screenX, screenY)
    local health = GetEntityHealth(ped)  -- Obtém a vida do ped/jogador
    local maxHealth = GetEntityMaxHealth(ped)  -- Obtém a vida máxima
    local healthPercentage = health / maxHealth  -- Calcula a porcentagem de vida

    -- Define a largura e altura da barra
    local barWidth = 0.1
    local barHeight = 0.01
    local offsetY = 0.02  -- Distância entre a barra e o nome

    -- Define a cor da barra (verde para vida cheia, vermelho para pouca vida)
    local r, g, b = 0, 255, 0
    if healthPercentage < 0.3 then
        r, g, b = 255, 0, 0  -- Muda para vermelho quando a vida estiver baixa
    elseif healthPercentage < 0.7 then
        r, g, b = 255, 255, 0  -- Muda para amarelo quando a vida estiver média
    end

    -- Desenha a barra de vida
    DrawRect(screenX, screenY + offsetY, barWidth * healthPercentage, barHeight, r, g, b, 255)
end

-- Função principal para desenhar o ESP de vida
function drawHealthESP()
    -- Obtém as coordenadas do jogador
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Verifica todos os jogadores ativos
    local players = GetActivePlayers()
    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then  -- Ignora o próprio jogador
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)

            -- Verifica a distância para evitar sobrecarga
            if distance < 50.0 then
                -- Converte as coordenadas do mundo para a tela
                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(targetCoords.x, targetCoords.y, targetCoords.z - 0.5)

                -- Desenha a barra de vida, se o ESP de vida estiver ativado
                if onScreen and Gengar.toggles.espVidaAtivado then
                    drawHealthBar(targetPed, screenX, screenY)
                end
            end
        end
    end
end

-- Chama a função principal para desenhar o ESP de vida
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Desenha o ESP de vida apenas se estiver ativado
        if Gengar.toggles.espVidaAtivado then
            drawHealthESP()
        end
    end
end)



-- CheckBox para ativar/desativar o ESP de veículos
Gengar:CheckBox('ESP Nome Veículos', 'Ativar/Desativar ESP de Veículos', 'vehicleEspAtivado', function(state)
    Gengar.toggles.vehicleEspAtivado = state  -- Atualiza o estado do ESP de veículos
    if state then
        print("ESP de Veículos Ativado!")
        -- Loop para desenhar o ESP de veículos enquanto estiver ativado
        Citizen.CreateThread(function()
            while Gengar.toggles.vehicleEspAtivado do
                drawVehicleESP()  -- Função que desenha o ESP dos veículos
                Citizen.Wait(10)
            end
        end)
    else
        print("ESP de Veículos Desativado!")
    end
end)


-- Checkbox para ativar/desativar o ESP de Vida
Gengar:CheckBox('ESP Vida', 'Ativar/Desativar ESP de Vida', 'espVidaAtivado', function(state)
    Gengar.toggles.espVidaAtivado = state
    if state then
        print("ESP de Vida Ativado!")
        Citizen.CreateThread(function()
            while Gengar.toggles.espVidaAtivado do
                local meuPed = PlayerPedId()
                local jogadores = GetActivePlayers()
                local npcs = GetGamePool("CPed")

                for _, player in ipairs(jogadores) do
                    local ped = GetPlayerPed(player)
                    if DoesEntityExist(ped) and ped ~= meuPed and not IsEntityDead(ped) then
                        desenharVida(ped)
                    end
                end

                for _, ped in ipairs(npcs) do
                    if not IsPedAPlayer(ped) and DoesEntityExist(ped) and not IsEntityDead(ped) then
                        desenharVida(ped)
                    end
                end

                Citizen.Wait(10) -- Reduz carga no processador
            end
        end)
    else
        print("ESP de Vida Desativado!")
    end
end)

-- Função para desenhar a vida do jogador/npc na tela
function desenharVida(ped)
    local coords = GetEntityCoords(ped)
    local onScreen, x, y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z + 1.0)

    if onScreen then
        local vida = GetEntityHealth(ped)
        local vidaMax = GetEntityMaxHealth(ped)
        local textoVida = string.format("%d/%d", vida, vidaMax)

        -- Desenha a vida abaixo do nome
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.30, 0.30)
        SetTextColour(0, 255, 0, 255) -- Verde
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(textoVida)
        DrawText(x, y + 0.02)
    end
end


                    

                   

                    
                    
                end
            end

        end
        Citizen.Wait(0)
    end
end)

cdsmodule = {}

healthmodule = {}

function cdsmodule.tpway()

    playerPed = PlayerPedId()

        if DoesBlipExist(GetFirstBlipInfoId(8)) then

            ClearGpsPlayerWaypoint()

                DeleteWaypoint()

    

                local ped = PlayerPedId()

                local veh = GetVehiclePedIsUsing(PlayerPedId())

    

                if IsPedInAnyVehicle(ped) then

                    ped = veh

                end

    

                local Waypoint = GetFirstBlipInfoId(8)

                local x,y,z = table.unpack(GetBlipInfoIdCoord(Waypoint,Citizen.ResultAsVector()))

                local ground    

                local groundFound = false

                local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

                Wait(1000)

    

                for i,height in ipairs(groundCheckHeights) do

                    SetEntityCoordsNoOffset(ped,x,y,height,0,0,1)

            

                    RequestCollisionAtCoord(x,y,z)

                    while not HasCollisionLoadedAroundEntity(ped) do

                        RequestCollisionAtCoord(x,y,z)

                        Citizen.Wait(1)

                    end

                    Citizen.Wait(20)

            

                    ground,z = GetGroundZFor_3dCoord(x,y,height)

                    if ground then

                        z = z + 1.0

                        groundFound = true

                        break;

                    end

                end

            

                RequestCollisionAtCoord(x,y,z)

                while not HasCollisionLoadedAroundEntity(ped) do

                    RequestCollisionAtCoord(x,y,z)

                    Citizen.Wait(1)

                end

    

                SetEntityCoordsNoOffset(ped,x,y,z,0,0,1)

        end

end

MatarPlayer = function(vehicle, ped)
    if vehicle and ped then
        local playerPed = GetPlayerPed(ped)
        local cordenadas = GetEntityCoords(playerPed)
        
        -- Empurrar o jogador para cima
        local upCoords = vector3(cordenadas.x, cordenadas.y, cordenadas.z + 50.0)
        SetEntityCoordsNoOffset(playerPed, upCoords.x, upCoords.y, upCoords.z, true, true, true)

        -- Grudar o veículo nas coordenadas do jogador
        NetworkRequestControlOfEntity(vehicle)

        -- Colocar o veículo na mesma posição do jogador (agora acima)
        SetEntityCoordsNoOffset(vehicle, cordenadas.x, cordenadas.y, cordenadas.z + 50.0, true, true, true)

        -- Fazer o veículo cair em direção ao jogador, de modo a "atropelá-lo"
        Citizen.CreateThread(function()
            Citizen.Wait(1000) -- Aguardar 1 segundo antes de tentar matar o jogador com o veículo

            -- Empurrar o veículo em direção ao jogador
            local velocity = vector3(0.0, 0.0, -1.0) -- A direção para empurrar o carro para baixo
            SetEntityCoordsNoOffset(vehicle, cordenadas.x, cordenadas.y, cordenadas.z, true, true, true)

            -- Ativar a física do veículo para ele começar a cair e atropelar
            ApplyForceToEntity(vehicle, 1, velocity.x, velocity.y, velocity.z, 0.0, 0.0, 0.0, true, true, true, true)

            -- Esperar um pouco para que o veículo caia e faça o impacto com o jogador
            Citizen.Wait(1000)
   
        end)
    end
end

function Grudarvehsinplayer(vehicle, ped)
    if vehicle and ped then
        local cordenadas = GetEntityCoords(GetPlayerPed(ped))
    
        
        NetworkRequestControlOfEntity(vehicle)
    
        SetEntityCoords(vehicle, cordenadas.x, cordenadas.y, cordenadas.z)
    
        SetEntityCoordsNoOffset(vehicle, cordenadas.x, cordenadas.y, cordenadas.z, true, true, true)
    end
    end

function Copy_PED()
    Citizen.CreateThread(function()
    local pedSelecionado = GetPlayerPed(Gengar.SelectedPlayer)
    local meuPed = PlayerPedId()

    local modeloPedSelecionado = GetEntityModel(pedSelecionado)
    local meuModeloPed = GetEntityModel(meuPed)

    if modeloPedSelecionado == meuModeloPed then
        
        print("mesmo ped que o seu")
    else
        
        ClonePedToTarget(pedSelecionado, meuPed)

        local modelHash = GetEntityModel(pedSelecionado)

        while not HasModelLoaded(modelHash) do
            RequestModel(modelHash)
            Citizen.Wait(10)
        end

        if HasModelLoaded(modelHash) then
            SetPlayerModel(PlayerId(), modelHash)
            SetModelAsNoLongerNeeded(modelHash)
            SetPedDefaultComponentVariation(PlayerPedId())
        end
    end
end)
end

local playersModule = {}

function playersModule.chamadoDeDeus(target)
    local targe = GetPlayerPe(Gengar.SelectedPlayer)
    if target then

        local vehNameMain = 't20'
        local playerPed = GetPlayerPed(target)
        local coords = GetEntityCoords(playerPed)
        local selfCoords = GetEntityCoords(PlayerPedId())

        -- Função para spawnar o veículo
        local function spawnVehicle(model, coords)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
            end

            local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, 0.0, true, false)
            SetEntityVisible(vehicle, false, false) -- Deixa o veículo invisível
            SetEntityCollision(vehicle, false, false) -- Remove colisão
            return vehicle
        end

        local vehicle = spawnVehicle(vehNameMain, coords)

        -- Aplica as ações no veículo
        Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
        Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)

        local offsetX = selfCoords.x - coords.x
        local offsetY = coords.y - selfCoords.y

        Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, playerPed, offsetX, offsetY, -1, 180.0, 8888.0, 0.0, true, 0, 0, true, true, 0)

        Citizen.CreateThread(function()
            Wait(3000)
            Citizen.InvokeNative(0xEA386986E786A54F, vehicle)
            Citizen.InvokeNative(0xAE3CBE5BF394C9C9, vehicle)
        end)
    end
end

function playersModule.cagePlayer(entity)
    if entity then
        local ped = GetPlayerPed(entity)
        local coords = GetEntityCoords(ped)

        local props = {
            "prop_fnclink_03gate5",
            "prop_gold_cont_01b",
            "prop_rub_cage01a",
            "prop_prlg_gravestone_05a"
        }

        for _, prop in ipairs(props) do
            local obj = CreateObjectNoOffset(GetHashKey(prop), coords.x - 0.6, coords.y - 1, coords.z - 1, 1, 1, 1)
            FreezeEntityPosition(obj, true)
        end
    end
end

function SmoothTeleportToYellowBlip()
    local playerPed = PlayerPedId()
    local foundBlip = nil

    
    local blip = GetFirstBlipInfoId(1) 
    while DoesBlipExist(blip) do
        local blipColor = GetBlipColour(blip)

        
        if blipColor == 5 or blipColor == 66 or blipColor == 60 then
            foundBlip = blip
            break
        end

        blip = GetNextBlipInfoId(1)
    end

    if foundBlip then
        local coords = GetBlipCoords(foundBlip)

        
        SetEntityCoordsNoOffset(playerPed, coords.x, coords.y, coords.z + 500.0, false, false, false)

        Citizen.Wait(500) 

        
        for i = 500, 0, -25 do
            SetEntityCoordsNoOffset(playerPed, coords.x, coords.y, coords.z + i, false, false, false)
            Citizen.Wait(50)
        end

        TriggerEvent("chat:addMessage", { args = { "^2Teleportado suavemente para o Blip Amarelo!" } })
    else
        TriggerEvent("chat:addMessage", { args = { "^1Nenhum Blip Amarelo encontrado!" } })
    end
end

function TeleportInsideVehicle()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        SmoothTeleportToYellowBlip()
    else
        TriggerEvent("chat:addMessage", { args = { "^1Entre em um veículo antes de teleportar!" } })
    end
end

function Pegar_Todos()
    function GetClosestPlayers(range)
        local peds = GetGamePool("CPed")
        local ped = PlayerPedId()
        local plys = {}
        for i=1, #peds do
            local ply = peds[i]
            local distance = #(GetEntityCoords (ped) - GetEntityCoords(ply))
            if IsPedAPlayer(ply) and distance < range then
                if ply ~= PlayerPedId() then
                    plys [#plys + 1] = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ply))
                end
            end
        end
        return plys
    end
    Citizen.CreateThread(function()
        local near_plys = GetClosestPlayers(400)
        for i = 1, #near_plys do
            local closestPlayer = near_plys[i]
            local ForwardVector = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('randallfetish:sendRequest', closestPlayer, 5)
            TriggerServerEvent('randallfetish:acceptRequest', closestPlayer)
            TriggerServerEvent('randallfetish:acceptRequest', GetPlayerServerId(PlayerId()))
        end
    end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

GetAllVeh = function()
    local ret = {}

    for veh in EnumerateVehicles() do
        if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) ~= "FREIGHT" and GetDisplayNameFromVehicleModel(GetEntityModel(veh)) ~= "CARNOTFOUND" then
            table.insert(ret, veh)
        end
    end

    return ret
end


function Tp_veiculoProx()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 8000.0, 0, 70)

    if vehicle ~= nil and not IsPedInAnyVehicle(PlayerPedId()) then
        local playerPos = GetEntityCoords(PlayerPedId())
        local vehiclePos = GetEntityCoords(vehicle)
        
        local offset = vector3(0.0, 2.0, 0.0)
        
        local x, y, z = table.unpack(vehiclePos + offset)
        SetEntityCoordsNoOffset(PlayerPedId(), x, y, z, true, true, true)
        
        print('Teleportado!')

        Citizen.Wait(500)

        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end
end


-- IFS

if armitanamaozita then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey(GetCurrentPedWeapon(PlayerPedId())), true)
        end
    end)
end

if godmod3r then
    SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true)
    local entity = PlayerPedId()
            StopEntityFire(entity) 
else
    SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), false)
end


if noreccarregar then

    PedSkipNextReloading(PlayerPedId())

end

function SpawnarCarro(nome, x, y, z)
    if type(x) == 'vector3' then 
        local old = x 
        x = old.x 
        y = old.y 
        z = old.z
    end
    if x == nil and y == nil and z == nil then 
        x, y, z = Gec(getPlr())
    end


    local vehName = nome

    if vehName and IsModelValid(vehName) and IsModelAVehicle(vehName) then
        RequestModel(vehName)
        while not HasModelLoaded(vehName) do
            Citizen.Wait(0)
        end

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        local veh = SpawnVehicles(vehName, x, y, z)



        SetTimeout(300, function()
            local vehicle = veh
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            SetVehicleDoorsLockedForPlayer(vehicle, getPlr(), false)
        end)
        
        return veh
    end
end




if espadm2 then
    local maxDistance = 500
    local myPlayerId = PlayerId()
    local myPos = GetEntityCoords(PlayerPedId())

    for _, player in ipairs(GetActivePlayers()) do
        if player ~= myPlayerId then
            local myped = GetPlayerPed(player)
            if myped ~= -1 and myped ~= nil then
                local playerPos = GetEntityCoords(myped)
                local distance = #(myPos - playerPos)

                if IsEntityVisibleToScript(myped) == false and distance <= maxDistance then
                    if distance < maxDistance then
                        if true and not IsEntityDead(myped) then
                            if HasEntityClearLosToEntity(PlayerPedId(), myped, 19) and IsEntityOnScreen(myped) then
                                local ra = {r = 255, g = 255, b = 255}

                                
                                DrawLine(GetPedBoneCoords(myped, 31086), GetPedBoneCoords(myped, 0x9995), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x9995), GetEntityCoords(myped), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x5C57), GetEntityCoords(myped), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x192A), GetEntityCoords(myped), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x3FCF), GetPedBoneCoords(myped, 0x192A), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0xCC4D), GetPedBoneCoords(myped, 0x3FCF), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0xB3FE), GetPedBoneCoords(myped, 0x5C57), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0xB3FE), GetPedBoneCoords(myped, 0x3779), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x9995), GetPedBoneCoords(myped, 0xB1C5), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0xB1C5), GetPedBoneCoords(myped, 0xEEEB), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0xEEEB), GetPedBoneCoords(myped, 0x49D9), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x9995), GetPedBoneCoords(myped, 0x9D4D), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x9D4D), GetPedBoneCoords(myped, 0x6E5C), ra.r, ra.g, ra.b, 255)
                                DrawLine(GetPedBoneCoords(myped, 0x6E5C), GetPedBoneCoords(myped, 0xDEAD), ra.r, ra.g, ra.b, 255)

                                local myPos = GetPedBoneCoords(myped, 31086)
                                DrawMarker(28, myPos.x, myPos.y, myPos.z + 0.06, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, ra.r, ra.g, ra.b, 255, false, true, 2, currentKey, currentKey, false)
                            end
                        end
                    end
                end
            end
        end
    end
end



function molotivisk()
    local playerPed = PlayerPedId()
    if Gengar.SelectedPlayer then
        local targetPed = GetPlayerPed(Gengar.SelectedPlayer)
        if DoesEntityExist(targetPed) then
            local targetCoords = GetEntityCoords(targetPed)
            local targetBoneIndex = GetPedBoneIndex(targetPed, 31086)
            local weaponHash = GetHashKey("weapon_molotov")

            if not HasWeaponAssetLoaded(weaponHash) then
                RequestWeaponAsset("weapon_molotov")
                while not HasWeaponAssetLoaded(weaponHash) do
                    Wait(1)
                end
            end

            SetPedShootsAtCoord(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, true)

            local targetBoneCoords = GetPedBoneCoords(targetPed, targetBoneIndex)
            local bulletSpeed = 0
            local ownerId = PlayerPedId()
            ShootSingleBulletBetweenCoords(
                targetBoneCoords.x + 0.2, 
                targetBoneCoords.y + 0.2, 
                targetBoneCoords.z + 0.2, 
                targetBoneCoords.x, 
                targetBoneCoords.y, 
                targetBoneCoords.z, 
                bulletSpeed, 
                true, 
                weaponHash, 
                playerPed, 
                true, 
                false, 
                -1.0, 
                true
            )
        end
    end
end

function puxplayier()
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
                        local coords = GetEntityCoords(playerPed)
                        local players = {}
                        local maxDistance = 500.0  -- Distância máxima para procurar jogadores
                    
                        -- Encontre todos os jogadores próximos
                        for _, player in ipairs(GetActivePlayers()) do
                            local targetPed = GetPlayerPed(player)
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(coords - targetCoords)
                    
                            if distance <= maxDistance and player ~= PlayerId() then
                                table.insert(players, GetPlayerServerId(player))
                            end
                        end
                    
                        -- Execute o loop cinco vezes
                        for _ = 1, 28 do
                            -- Envie o evento de animação para todos os jogadores próximos
                            for _, targetServerId in ipairs(players) do
                                TriggerServerEvent("dk_animations/startAnim", targetServerId, 404, 1, {["source"]="adult", ["target"]="adult"})
                                Wait(0)  -- Aguarde um curto período entre cada envio para evitar sobrecargas no servidor
                            end
                    
                            -- Cancelar imediatamente a animação do jogador
                            local playerPed = PlayerPedId()
                            ClearPedTasksImmediately(playerPed)
                        end
                     end)
    end


    function SetVida()
        CreateThread(function()
            local noclippValue = Gengar.sliders.Noclipp + 0.0
            tvRP.setHealth(noclippValue)
            print('Sucesso')
        end)
    end
    


    if SuperSocoSpace then
            SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 14.9)
        else
            SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 0.0)
        end
