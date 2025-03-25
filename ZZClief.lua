


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
local ZZClief = {
    UserName = 'ZZClief',
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
        ['listaADM'] = {'https://github.com/arthur9727/ZZClief/blob/main/BOT%C3%83O.png?raw=true', 55, 55},
        ['check'] = {'https://cosmic-dango-9dfdf1.netlify.app/check.html', 55, 55},
    }

    local sprite = {}
    local dict = GlobalState['Dict-Sprite']
    if not dict then
        for sp, create in pairs(sprites) do
            sprite[sp] = ZZClief:CreateSprite(sp, create[1], {create[2], create[3]})
        end
        GlobalState['Dict-Sprite'] = ZZClief.DictSprite
    else
        ZZClief.DictSprite = dict
    end
    
    print('')
    print('')
    print('')
    print('^1[ZZClief MENU]: ^2MENU AUTENTICADO COM SUCESSO')
    print('^1[ZZClief Menu]: ^2Aperte: ' ..ZZClief.MenuKey.Text.. ' Para abrir o menu')
            
    local value = 0
    while not ZZClief.menuLoaded do
        local rendered = true
        for _, duis in pairs(sprite) do
            if not IsDuiAvailable(duis) then
                rendered = false
            end
        end
        if rendered then
            Wait(350)
            ZZClief.menuLoaded = rendered
        else
            value = value + 1
        end
        Wait(10)
    end
    
    if ZZClief.menuLoaded then
        print('^1[ZZClief Menu]: ^2Menu Carregado Com Sucesso, Aproveite A Experiência!')

        
    
        local detected = false
    
        if getsource('MQCU') then
            print('^1[ZZClief Menu]: ^2MQCU DETECTADO')
            detected = true
        end
    
        if getsource('likizao_ac') then
            print('^1[ZZClief Menu]: ^2LIKIZAO DETECTADO')
            detected = true
        end
    
        if getsource('PL_PROTECT') then
            print('^1[ZZClief Menu]: ^2PL_PROTECT DETECTADO')
            detected = true
        end
    
        if getsource('ThnAC') then
            print('^1[ZZClief Menu]: ^2THUNDER_AC DETECTADO')
            detected = true
        end
    
        if not detected then
            print('^1[ZZClief Menu]: ^1NENHUM AntiCheat DETECTADO')
        end
    else
        print('^1[ZZClief Menu]: ^1Menu não carregado.')
    end
end)       



function ZZClief.Hovered(ZZClief, posX, posY, width, height)
    local cursorX, cursorY = GetNuiCursorPosition()
    if posX <= cursorX and cursorX <= posX + width and posY <= cursorY and cursorY <= posY + height then
        return true
    end
    return false
end

local textWidthCache = {}
function ZZClief.GetTextWidthSize(ZZClief, text, size, font)
    local screenWidth = ZZClief.screenW
    local screenHeight = ZZClief.screenH
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

function ZZClief.DrawText(ZZClief, name, posX, posY, width, height, isoutline, color, order)
    local scaleX = 1 / ZZClief.screenW
    local scaleY = 1 / ZZClief.screenH
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



function ZZClief.DrawText2(ZZClief, name, posX, posY, width, height, isoutline, color, justify, order)
    SetScriptGfxDrawOrder(order or 10)
    local scaleX = 1 / ZZClief.screenW
    local scaleY = 1 / ZZClief.screenH
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

function ZZClief.CreateSprite(ZZClief, spriteName, textureWidth, duiProperties)
    local dictString = tostring(ZZClief.DictSprite)
    local posX, posY = table.unpack(duiProperties)
    local duiHandle = CreateDui(textureWidth, posX, posY)
    CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd(dictString .. spriteName), dictString .. spriteName .. '_rtn', GetDuiHandle(duiHandle))
    return duiHandle
end

function ZZClief.GetSprite(ZZClief, spriteName)
    local dictString = tostring(ZZClief.DictSprite)
    return dictString .. spriteName, dictString .. spriteName .. '_rtn'
end

function ZZClief.DrawSprite(ZZClief, textureDict, textureName, posX, posY, width, height, heading, color, drawOrder)
    local scaleX = 1 / ZZClief.screenW
    local scaleY = 1 / ZZClief.screenH
    local screenPosX = scaleX * posX
    local screenPosY = scaleY * posY
    local screenScaleX = scaleX * width
    local screenScaleY = scaleY * height
    SetScriptGfxDrawOrder(drawOrder or 3)
    DrawSprite(textureDict, textureName, screenPosX + screenScaleX / 2, screenPosY + screenScaleY / 2, screenScaleX, screenScaleY, heading, color[1], color[2], color[3], color[4] or 255)
end

function ZZClief.DrawRect(ZZClief, posX, posY, width, height, color, drawOrder)
    local screenPosX = posX / ZZClief.screenW + width / ZZClief.screenW / 2
    local screenPosY = posY / ZZClief.screenH + height / ZZClief.screenH / 2
    SetScriptGfxDrawOrder(drawOrder or 3)
    DrawRect(screenPosX, screenPosY, width / ZZClief.screenW, height / ZZClief.screenH, color[1], color[2], color[3], color[4] or 255)
end

function ZZClief.DrawRoundedRect(ZZClief, x, y, width, height, radius, r, g, b, a, order)
    if radius > height then
        radius = height
    end
    local dict, name = ZZClief:GetSprite('circle')
    ZZClief:DrawRect(x + radius / 2, y, width - radius, height, r, g, b, a, order)
    ZZClief:DrawRect(x, y + radius / 2, width, height - radius, r, g, b, a, order)
    ZZClief:DrawSprite(dict, name, x, y, radius, radius, 0, r, g, b, a, order)
    ZZClief:DrawSprite(dict, name, x + width - radius, y, radius, radius, 0, r, g, b, a, order)
    ZZClief:DrawSprite(dict, name, x, y + height - radius, radius, radius, 0, r, g, b, a, order)
    ZZClief:DrawSprite(dict, name, x + width - radius, y + height - radius, radius, radius, 0, r, g, b, a, order)
end

function ZZClief.Tab(ZZClief, tabName, callback)
    local currentY = ZZClief.tabs.y
    local isActive = ZZClief.tabs.active == tabName
    local hovered = ZZClief:Hovered(ZZClief.x + 5, ZZClief.y + 80 + currentY, 170, 46)
    if isActive then
        if not ZZClief.tabs.addY then
            ZZClief.tabs.addY = currentY
        end
        ZZClief.tabs.addY = ZZClief.functions.lerp(0.15, ZZClief.tabs.addY, currentY)
    end

    if currentY == 0 then
        ZZClief:DrawRoundedRect(ZZClief.x + 17, ZZClief.y + 87 + math.ceil(ZZClief.tabs.addY), 170, 46, 17, {25, 25, 25, 255}, 4)
        ZZClief:DrawRoundedRect(ZZClief.x + 170, ZZClief.y + 95 + math.ceil(ZZClief.tabs.addY), 5, 30, 5, ZZClief.colors.theme, 4)
    end

    if tabName == ZZClief.tabs.active then
        ZZClief.colors.ColorTab = {255, 255, 255, 255}
    else
        ZZClief.colors.ColorTab = {55, 55, 55, 255}
    end

    if ZZClief.tabs.active == tabName then
        ZZClief.colors.icontab.colors[tabName] = ZZClief.colors.theme
    elseif ZZClief.tabs.active ~= tabName then
        ZZClief.colors.icontab.colors[tabName] = {35, 35, 35, 255}
    end

    ZZClief:DrawText(tabName or '', ZZClief.x +  70, ZZClief.y + 99 + currentY, 250, 250, false, ZZClief.colors.ColorTab)

    if hovered and IsDisabledControlJustPressed(0, 24) then
        ZZClief.tabs.active = tabName
        if callback then
            callback()
        end
    end
    ZZClief.tabs.y = currentY + 50
end

function ZZClief.SubTab(ZZClief, subtabName)
    local subtabY = ZZClief.subtabs.y
    local isActive = ZZClief.subtabs.active == subtabName
    local textWidth = ZZClief:GetTextWidthSize(subtabName, 3, 8)
    local hovered = ZZClief:Hovered(ZZClief.x + 220 + subtabY, ZZClief.y + 10, textWidth, 30)

    if isActive then
        if not ZZClief.subtabs.addY then
            ZZClief.subtabs.addY = subtabY
        end
        if not ZZClief.subtabs.addW then
            ZZClief.subtabs.addW = textWidth
        end
        ZZClief.subtabs.addY = ZZClief.functions.lerp(0.15, ZZClief.subtabs.addY, subtabY)
        ZZClief.subtabs.addW = ZZClief.functions.lerp(0.15, ZZClief.subtabs.addW, textWidth)
    end

    if subtabY == 0 then
        ZZClief:DrawRoundedRect(ZZClief.x + 237 + math.ceil(ZZClief.subtabs.addY), ZZClief.y + 40, math.ceil(ZZClief.subtabs.addW) - 3, 3, 15, ZZClief.colors.theme, 11)
    end
    
    ZZClief:DrawText(subtabName, ZZClief.x + 240 + subtabY, ZZClief.y + 15, 260, 260, false, {255, 255, 255, 255}, 11)
    
    if hovered and IsDisabledControlJustPressed(0, 24) then
        ZZClief.subtabs.active = subtabName
    end
    ZZClief.subtabs.y = subtabY + textWidth + 15
end

function ZZClief.DrawCursor(ZZClief)
    local dict, name = ZZClief:GetSprite('cursor')
    local cursorX, cursorY = GetNuiCursorPosition()
    DisableControlAction(0, 1, true)
    DisableControlAction(0, 2, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 157, true)
    DisablePlayerFiring(PlayerPedId(), true)
    ZZClief:DrawSprite(dict, name, cursorX, cursorY - 1, 45, 45, 10, {255, 255, 255, 255}, 8)
    ZZClief.tabs.y = 0
    ZZClief.subtabs.y = 0
end



function ZZClief.Window(ZZClief)
    ZZClief.buttons = {
        x = 0,
        y = 0,
    }
    local x, y, width, height, colors = ZZClief.x, ZZClief.y, ZZClief.width, ZZClief.height, ZZClief.colors
    ZZClief:DrawRoundedRect(x, y, width, height, 17, {12, 12, 12, 255}, 10) -- BackGround
    ZZClief:DrawRoundedRect(x, y, 200, height, 17, {15, 15, 15, 255}, 10) -- BackGround Esquerda
    ZZClief:DrawText('ZZClief', x + 20, y + 15, width - 200, height - 200, false, {255, 255, 255, 255})
    ZZClief:DrawText('MENU', x + 120, y + 15, width - 200, height - 200, false, {255, 0, 0, 255})
    ZZClief:DrawRoundedRect(x + 32, y + 46, 135, 3, 15, ZZClief.colors.theme, 10)
    ZZClief:DrawRoundedRect(x + 210, y + 10, width - 220, height - 20, 15, {15, 15, 15, 255}, 10) -- TRAS DOS BOTOES
    ZZClief:DrawRoundedRect(x + 210, y + 10, width - 220, 35, 15, {25, 25, 25, 255}, 10) -- PARTE CIMA SUBTAB
    ZZClief:DrawRoundedRect(x + 210, y + 30, width - 220, 20, 0, {25, 25, 25, 255}, 10) -- PARTE BAIXO SUBTAB

    local dict, name = ZZClief:GetSprite('Jogador')
    ZZClief:DrawSprite(dict, name, x + 29, y + 92.5, 45, 45, 0, ZZClief.colors.icontab.colors['Jogador'], 5)
    dict, name = ZZClief:GetSprite('Veiculos')
    ZZClief:DrawSprite(dict, name, x + 32.5, y + 150, 23, 23, 0, ZZClief.colors.icontab.colors['Veiculos'], 5)
    dict, name = ZZClief:GetSprite('Armas')
    ZZClief:DrawSprite(dict, name, x + 32.5, y + 200, 23, 23, 0, ZZClief.colors.icontab.colors['Armas'], 5)
    dict, name = ZZClief:GetSprite('Online')
    ZZClief:DrawSprite(dict, name, x + 25, y + 243, 45, 45, 0, ZZClief.colors.icontab.colors['Online'], 5)
    dict, name = ZZClief:GetSprite('Destruicao')
    ZZClief:DrawSprite(dict, name, x + 32, y + 298, 23, 23, 0, ZZClief.colors.icontab.colors['Destruição'], 5)
    dict, name = ZZClief:GetSprite('Exploits')
    ZZClief:DrawSprite(dict, name, x + 30.5, y + 349, 23, 23, 0, ZZClief.colors.icontab.colors['Exploits'], 5)
    dict, name = ZZClief:GetSprite('Config')
    ZZClief:DrawSprite(dict, name, x + 30, y + 398, 23, 23, 0, ZZClief.colors.icontab.colors['Config'], 5)
    ZZClief:DrawCursor()
end

function ZZClief.Button(ZZClief, buttonId, buttonText, buttonCallback)
    local buttonX = ZZClief.buttons.x + 205
    local buttonY = ZZClief.buttons.y
    local scrolledY = buttonY + (ZZClief.scroll[ZZClief.tabs.active .. (ZZClief.subtabs.active or '')] or 0)

    if 0 <= scrolledY and scrolledY <= 420 then
        local hovered = ZZClief:Hovered(ZZClief.x + 3 + buttonX, ZZClief.y + 70 + scrolledY, 560, 55)
        
        if hovered then
            ZZClief:DrawRoundedRect(ZZClief.x + 15 + buttonX, ZZClief.y + 75 + scrolledY, 560, 55, 12, {25, 25, 25, 255}, 11)
        else
            ZZClief:DrawRoundedRect(ZZClief.x + 15 + buttonX, ZZClief.y + 75 + scrolledY, 560, 55, 12, {21, 21, 21, 255}, 11)
        end

        ZZClief:DrawText(buttonId, ZZClief.x + 45 + buttonX, ZZClief.y + 80 + scrolledY, 265, 265, false, {255, 255, 255, 255}, 11)
        ZZClief:DrawText(buttonText, ZZClief.x + 45 + buttonX, ZZClief.y + 102 + scrolledY, 265, 265, false, {120, 120, 120, 255}, 11)

        if hovered and type(buttonCallback) == 'function' and IsDisabledControlJustPressed(0, 24) then
            Citizen.CreateThread(buttonCallback)
        end
    end 
    ZZClief.buttons.y = buttonY + 60
end


function camDirect()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local ZZCliefch = GetGameplayCamRelativeZZCliefch()
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(ZZCliefch * math.pi / 180.0)
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    return x, y, z
end

function ZZClief.CheckBox(ZZClief, Title, SubTitle, toggleName, callback)
    local buttonX = ZZClief.buttons.x + 205
    local buttonY = ZZClief.buttons.y
    local scrollOffset = buttonY + (ZZClief.scroll[ZZClief.tabs.active .. (ZZClief.subtabs.active or '')] or 0)
    local toggleState = ZZClief.toggles[toggleName]

    if not ZZClief.animColors[toggleName] then
        ZZClief.animColors[toggleName] = { r = 21, g = 21, b = 21, x = 0 }
    end
    if 0 <= scrollOffset and scrollOffset <= 420 then
        local isHovered = ZZClief:Hovered(ZZClief.x + 3 + buttonX, ZZClief.y + 70 + scrollOffset, 560, 55)
        local themeColors = toggleState and ZZClief.colors.theme or {21, 21, 21, 255}

        ZZClief.animColors[toggleName].r = ZZClief.functions.lerp(0.15, ZZClief.animColors[toggleName].r, themeColors[1])
        ZZClief.animColors[toggleName].g = ZZClief.functions.lerp(0.15, ZZClief.animColors[toggleName].g, themeColors[2])
        ZZClief.animColors[toggleName].b = ZZClief.functions.lerp(0.15, ZZClief.animColors[toggleName].b, themeColors[3])
        ZZClief.animColors[toggleName].x = ZZClief.functions.lerp(0.15, ZZClief.animColors[toggleName].x, toggleState and 27 or 0)

        if isHovered then
            ZZClief:DrawRoundedRect(ZZClief.x + 15 + buttonX, ZZClief.y + 75 + scrollOffset, 560, 55, 12, {25, 25, 25, 255}, 11)
        else
            ZZClief:DrawRoundedRect(ZZClief.x + 15 + buttonX, ZZClief.y + 75 + scrollOffset, 560, 55, 12, {21, 21, 21, 255}, 11)
        end

        ZZClief:DrawRoundedRect(ZZClief.x + 505 + buttonX, ZZClief.y + 87 + scrollOffset, 30, 30, 15, {17, 17, 17, 255}, 11)

        if toggleState then
            local dict, name = ZZClief:GetSprite('check')
            local colors = ZZClief.animColors[toggleName]
            local r = math.ceil(colors.r)
            local g = math.ceil(colors.g)
            local b = math.ceil(colors.b)
            ZZClief:DrawSprite(dict, name, ZZClief.x + 505 + buttonX, ZZClief.y + 87 + scrollOffset, 35, 35, 0, {r, g, b, 255}, 11)
        end
        
        

        ZZClief:DrawText(Title,  ZZClief.x + 45 + buttonX, ZZClief.y + 80 + scrollOffset, 265, 265, false, {220, 220, 220, 255}, 11)
        ZZClief:DrawText(SubTitle, ZZClief.x + 45 + buttonX, ZZClief.y + 102 + scrollOffset, 265, 265, false, {120, 120, 120, 255}, 11)

        if isHovered and IsDisabledControlJustPressed(0, 24)then
            ZZClief.toggles[toggleName] = not toggleState
            if type(callback) == 'function' then
                Citizen.CreateThread(function()
                    callback(ZZClief.toggles[toggleName])
                end)
            end
        end
    end
    ZZClief.buttons.y = buttonY + 60
end

function ZZClief.Slider(ZZClief, sliderTitle, sliderSubtitle, sliderID, slider, sliderCallback)
    if not ZZClief.sliders[sliderID] then
        slider.x = math.floor(155 * (slider.value - slider.min) / (slider.max - slider.min))
        ZZClief.sliders[sliderID] = slider.value
    end
    local buttonPosX = ZZClief.buttons.x + 205
    local buttonPosY = ZZClief.buttons.y
    local scrollOffsetY = buttonPosY + (ZZClief.scroll[ZZClief.tabs.active .. (ZZClief.subtabs.active or '')] or 0)

    if 0 <= scrollOffsetY and scrollOffsetY <= 420 then
        local circleSprite1, circleSprite2 = ZZClief:GetSprite('circle')
        local sliderValue = ZZClief.sliders[sliderID]
        local sliderWidth = 135
        local sliderPosition = math.floor(sliderWidth * (sliderValue - slider.min) / (slider.max - slider.min))
        
        local hovered1 = ZZClief:Hovered(ZZClief.x + 3 + buttonPosX, ZZClief.y + 70 + scrollOffsetY, 310, 55)
        local hovered2 = ZZClief:Hovered(ZZClief.x + 340 + buttonPosX, ZZClief.y + 70 + scrollOffsetY, 235, 55)

        if hovered1 then
            ZZClief:DrawRoundedRect(ZZClief.x + 15 + buttonPosX, ZZClief.y + 75 + scrollOffsetY, 560, 55, 12, {30, 30, 30, 255}, 11)
        else
            ZZClief:DrawRoundedRect(ZZClief.x + 15 + buttonPosX, ZZClief.y + 75 + scrollOffsetY, 560, 55, 12, {21, 21, 21, 255}, 11)
        end

        ZZClief:DrawText(sliderTitle, ZZClief.x + 45 + buttonPosX, ZZClief.y + 80 + scrollOffsetY, 250, 250, false, {255, 255, 255, 255}, 11)
        ZZClief:DrawText(sliderSubtitle, ZZClief.x + 45 + buttonPosX, ZZClief.y + 102 + scrollOffsetY, 250, 250, false, {120, 120, 120, 255}, 11)
        
        ZZClief:DrawRoundedRect(ZZClief.x + 350 + buttonPosX, ZZClief.y + 102 + scrollOffsetY, sliderWidth, 4, 6, {40, 40, 42, 255}, 11)
        ZZClief:DrawRoundedRect(ZZClief.x + 345 + buttonPosX, ZZClief.y + 102 + scrollOffsetY, 10, 4, 6, ZZClief.colors.theme, 11)
        ZZClief:DrawRoundedRect(ZZClief.x + 350 + buttonPosX, ZZClief.y + 102 + scrollOffsetY, sliderPosition, 4, 6, ZZClief.colors.theme, 11)

        ZZClief:DrawSprite(circleSprite1, circleSprite2, ZZClief.x + 348 + buttonPosX + sliderPosition, ZZClief.y + 98 + scrollOffsetY, 12, 12, 0, ZZClief.colors.theme, 11)
        ZZClief:DrawRoundedRect(ZZClief.x + 348 + buttonPosX + sliderPosition, ZZClief.y + 98 + scrollOffsetY, 12, 12, 18, ZZClief.colors.theme, 11)
        ZZClief:DrawText(tostring('('..sliderValue..')'), ZZClief.x + 505 + buttonPosX, ZZClief.y + 93 + scrollOffsetY, 220, 220, false, {255, 255, 255, 255}, 11)

        if hovered1 and type(sliderCallback) == 'function' and IsDisabledControlJustPressed(0, 24) then
            Citizen.CreateThread(sliderCallback)
        end

        if hovered2 and IsDisabledControlPressed(0, 24) then
            local cursorX, cursorY = GetNuiCursorPosition()
            local newSliderValue = math.floor(slider.min + (slider.max - slider.min) * math.min(math.max((cursorX - (ZZClief.x + 340 + buttonPosX)), 0), sliderWidth) / sliderWidth)
            ZZClief.sliders[sliderID] = math.floor(newSliderValue)
        end
    end

    if slider.max < ZZClief.sliders[sliderID] then
        ZZClief.sliders[sliderID] = slider.max
    elseif ZZClief.sliders[sliderID] < slider.min then
        ZZClief.sliders[sliderID] = slider.min
    end
    ZZClief.buttons.y = buttonPosY + 60
end

CreateThread(function()
    while ZZClief.RenderMenu do
        if IsDisabledControlJustPressed(0, 24) then
            local isHovered = ZZClief:Hovered(ZZClief.x, ZZClief.y, ZZClief.width, 40)
            if isHovered then
                local cursorX, cursorY = GetNuiCursorPosition()
                ZZClief.drag.isDragging = true
                ZZClief.drag.offsetX = cursorX - ZZClief.x
                ZZClief.drag.offsetY = cursorY - ZZClief.y
            end
        elseif IsDisabledControlJustReleased(0, 24) then
            ZZClief.drag.isDragging = false
        elseif ZZClief.drag.isDragging then
            local cursorX, cursorY = GetNuiCursorPosition()
            ZZClief.x = cursorX - ZZClief.drag.offsetX
            ZZClief.y = cursorY - ZZClief.drag.offsetY
        end

        local hovered = ZZClief:Hovered(ZZClief.x, ZZClief.y, ZZClief.width, ZZClief.height)
        if hovered then
            local activeTab = ZZClief.tabs.active..(ZZClief.subtabs.active or '')
            local scrollPos = ZZClief.scroll[activeTab] or 0
            local scrollStep = 60
            local maxScroll = ZZClief.buttons.y / scrollStep - 8
            local scrollDelta = -scrollStep * maxScroll
            
            if IsDisabledControlPressed(0, 15) and scrollPos < 0 then
                ZZClief.scroll[activeTab] = scrollPos + scrollStep
            elseif IsDisabledControlPressed(0, 14) and scrollDelta < scrollPos then
                ZZClief.scroll[activeTab] = scrollPos - scrollStep
            end
            
            if ZZClief.buttons.y < scrollStep * 8 and ZZClief.scroll[activeTab] ~= 0 then
                ZZClief.scroll[activeTab] = 0
            end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while ZZClief.RenderMenu do
        if ZZClief.menuLoaded and IsDisabledControlJustPressed(0, ZZClief.MenuKey.key) then
            ZZClief.showMenu = not ZZClief.showMenu
        end

        if ZZClief.menuLoaded and not IsPauseMenuActive() and ZZClief.showMenu then
            ZZClief:Window()
            ZZClief:Tab('Jogador', function()
                if ZZClief.tabs.active == 'Jogador' then
                    ZZClief.subtabs.active = 'Jogador'
                end
            end)
            ZZClief:Tab('Veiculos', function()
                if ZZClief.tabs.active == 'Veiculos' then
                    ZZClief.subtabs.active = 'Veiculos'
                end
            end)
            ZZClief:Tab('Armas', function()
                if ZZClief.tabs.active == 'Armas' then
                    ZZClief.subtabs.active = 'Armas'
                end
            end)
            ZZClief:Tab('Online', function()
                if ZZClief.tabs.active == 'Online' then
                    ZZClief.subtabs.active = 'Online'
                end
            end)
            ZZClief:Tab('Destruição', function()
                if ZZClief.tabs.active == 'Destruição' then
                    ZZClief.subtabs.active = 'Destruição'
                end
            end)
            ZZClief:Tab('Exploits', function()
                if ZZClief.tabs.active == 'Exploits' then
                    ZZClief.subtabs.active = 'Exploits'
                end
            end)
            ZZClief:Tab('Config', function()
                if ZZClief.tabs.active == 'Config' then
                    ZZClief.subtabs.active = 'Config'
                end
            end)

            if ZZClief.tabs.active == 'Jogador' then -- SE O TAB JOGADOR ESTIVER ATIVO ENTAO
                ZZClief:SubTab('Jogador') --SUBTAB 1
                ZZClief:SubTab('Poderes') --SUBTAB 2

                if ZZClief.subtabs.active == 'Jogador' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO
                
                    ZZClief:Button('Teleport WayPoint', 'Você ira Teleportar para o local marcado', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        cdsmodule.tpway()

                    end)

                    


                    if getsource('MQCU') or getsource('likizao_ac') or getsource('PL_PROTECT') or getsource('ThnAC') then
                        ZZClief:Button('Reviver', 'Você irá Reviver seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            CreateThread(function()
                                tvRP.killGod()
                                tvRP.setHealth(199)
                                print('Você Foi Revivido!')
                            end)
                        end)
                    else
                        ZZClief:Button('Reviver', 'Você irá Reviver seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                            NetworkResurrectLocalPlayer(x, y, z, GetEntityHeading(PlayerPedId()), true, false)
                            ClearPedBloodDamage(PlayerPedId())
                        end)
                    end
                    


                    if getsource('MQCU') or getsource('likizao_ac') or getsource('PL_PROTECT') or getsource('ThnAC') then
                        ZZClief:Button('Curar', 'Você irá curar seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
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
                        ZZClief:Button('Curar', 'Você irá curar seu PED', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                            SetEntityHealth(PlayerPedId(), 400)
                        end)
                    end
                    

                    ZZClief:Button('Suicidio', 'Você ira morrer', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        SetEntityHealth(PlayerPedId(), 0)    

                    end)

                    ZZClief:Button('Limpar Ferimentos', 'Você ira limpar suas feridas', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        ClearPedBloodDamage(PlayerPedId())
    

                    end)

                    if getsource('MQCU') or getsource('likizao_ac') or getsource('PL_PROTECT') or getsource('ThnAC') or getsource('Menu') then

                    ZZClief:Button('Desalgemar', 'Você ira se desalgemar.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        Citizen.CreateThread(function()
                            vRP.toggleHandcuff()
    

                    end)
                end)

            end 


                    ZZClief:Button('Soltar H', 'Você ira se soltar caso tenha alguem te carregando', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        if not IsPedInAnyVehicle(PlayerPedId()) then

                            if IsEntityAttached(PlayerPedId()) then
    
                                DetachEntity(PlayerPedId(-1),true,false)
    
                                TriggerEvent("vrp_policia:tunnel_req", "arrastar", {}, "vrp_policia", -1)
    
                            end
    
                        end

                    end)

                    ZZClief:CheckBox('Sessão Solo', 'Entre em uma Sessão Solo','soloSession', function()
                        if ZZClief.toggles.soloSession then
                            -- SE A CheckBox ESTIVER LIGADA EXECUTA ALGO
                            NetworkStartSoloTutorialSession()
                        else
                            -- SE A CheckBox ESTIVER DESLIGADA EXECUTA ALGO
                            NetworkEndTutorialSession()
                        end
                    end, 'right')
                    
                    
                    
                    ZZClief:CheckBox('GodMod', 'Ficar com vida Infinita', 'ToggleGodMode', function(toggleState)
                        if toggleState then  
                            
                            NetworkResurrectLocalPlayer(GetEntityCoords(ped), GetEntityHeading(ped), 0, 0)
                            if GetEntityHealth(ped) > 0 then
                                
                                StopEntityFire(ped)
                                
                                SetEntityCanBeDamaged(ped, false)
                                SetEntityProofs(ped, true, true, true, true, true, true, true, true)  
                                print('GodMode ativado.')
                            end
                        else
                            -- Desativa o GodMode
                            SetEntityProofs(ped, false, false, false, false, false, false, false, false)  
                            SetPedCanRagdoll(ped, true)  
                            SetEntityCanBeDamaged(ped, true)  
                            print('GodMode desativado.')
                        end
                    end)
                    




ZZClief:CheckBox('Noclip (Segurar Caps Lock)', 'Ativar Noclip enquanto a tecla Caps Lock estiver pressionada', 'noclipToggle', function(toggleState)
isNoclipEnabled = toggleState  
if isNoclipEnabled then
    print('Noclip habilitado. Segure a tecla Caps Lock para ativar.')
else
    print('Noclip desabilitado.')
end
end)

ZZClief:CheckBox('Super Pulo', 'Ativar/Desativar Super Pulo', 'superJumpAtivado', function(state)
    ZZClief.toggles.superJumpAtivado = state
    if state then
        print("Super Pulo Ativado!")
        Citizen.CreateThread(function()
            while ZZClief.toggles.superJumpAtivado do
                SetSuperJumpThisFrame(PlayerId(),5)
                Citizen.Wait(0)
            end
        end)
    else
        print("Super Pulo Desativado!")
    end
    end)

    ZZClief:CheckBox('Super Run', 'Ativar/Desativar Super Velocidade', 'superRunAtivado', function(state)
        ZZClief.toggles.superRunAtivado = state
        if state then
            print("Super Run Ativado!")
            Citizen.CreateThread(function()
                while ZZClief.toggles.superRunAtivado do
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.5)
                    Citizen.Wait(0)
                end
            end)
        else
            print("Super Run Desativado!")
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end
    end)
    

                elseif ZZClief.subtabs.active == 'Poderes' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

 

                    ZZClief:CheckBox('Invisibilidade', 'Fique Invisivel', 'InvisibilidadeBool', function() -- Título primeiro, depois subtítulo, depois nome da CheckBox  
                if ZZClief.toggles.InvisibilidadeBool then -- Se a CheckBox estiver ativada (TRUE)  
                    SetEntityVisible(PlayerPedId(), false, false) -- Torna o jogador invisível  
                    print('👻 INVISIBILIDADE ATIVADA!')  
                else -- Se estiver desativada (FALSE)  
                    SetEntityVisible(PlayerPedId(), true, false) -- Torna o jogador visível  
                    print('❌ INVISIBILIDADE DESATIVADA!')  
                end  
            end)        


                    ZZClief:CheckBox('Stamina Inf.', 'Seu PED nunca irá cansar', 'staminainff', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                        

                        if ZZClief.toggles.staminainff then 
                            RestorePlayerStamina(PlayerId(), 9.50)
                        else
                            staminainff = false
                        end

                        
                    end)


                    ZZClief:CheckBox('Soco Explosivo', 'Explosões ao socar algo', 'SocoExplosivoBool', function(toggleState)
                        ZZClief.toggles.SocoExplosivoBool = toggleState
                    
                        if toggleState then
                            print('Soco Explosivo Ativado')
                            Citizen.CreateThread(function()
                                while ZZClief.toggles.SocoExplosivoBool do
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
                
                    ZZClief:CheckBox('Super Soco', 'Super Soco (Space)', 'SuperSocoSpace', function()
                        if ZZClief.toggles.SuperSocoSpace then
                            if punch then
                                Bypass = nil
                                Tratamentok()
                                if Bypass then
                                    EnableAllControlActions(Bypass)
                                end
                                Bypass = {Weapon = {'Weapon_Unarmed'}}
                                SetWeaponDamageModifierThisFrame('weapon_unarmed', 12.5)
                            end
                        else
                            SetWeaponDamageModifierThisFrame('weapon_unarmed', 0.0)
                        end
                    end, 'right')
                    

            ZZClief:CheckBox('Olhos Laser', 'Atire lasers pelos olhos ao segurar [E] (Risk)', 'OlhosLaserBool', function()
                if ZZClief.toggles.OlhosLaserBool then
                    CreateThread(function()
                        while ZZClief.toggles.OlhosLaserBool do
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
ZZClief:CheckBox('Olhos Explosivos', 'Explosões contínuas com os olhos Enquanto Ativado (RISK!!!)', 'olhosexplosivos', function(toggleState)
    ZZClief.toggles.olhosexplosivos = toggleState
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

        if ZZClief.toggles.olhosexplosivos then
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




            end

            elseif ZZClief.tabs.active == 'Veiculos' then

                ZZClief:SubTab('Veiculos') --SUBTAB 1
                ZZClief:SubTab('Selecionado') --SUBTAB 2
                ZZClief:SubTab('Seu Veiculo') --SUBTAB 3
                ZZClief:SubTab('Spawn List') --SUBTAB 3

                if ZZClief.subtabs.active == 'Veiculos' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO
                
                    for _, veh in pairs(GetGamePool('CVehicle')) do
                        local vehs = GetEntityCoords(veh)
                        local player = GetEntityCoords(PlayerPedId())
                        local dist = tonumber(string.format('%.0f', GetDistanceBetweenCoords(player.x, player.y, player.z, vehs.x, vehs.y, vehs.z, true)))
                        local nomeveh = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                        local vidaveh = GetEntityHealth(veh)
                        local status = (GetPedInVehicleSeat(veh, -1) == 0) and 'Livre' or 'Ocupado'

                        local isSelected = ZZClief.SelectedVehicle == veh
                        local SelecTionText = isSelected and 'Sim' or 'Não'

                        local Title = 'Nome: '..nomeveh..' | Distancia: '..dist..'m'
                        local SubTitle = ' Vida: '..vidaveh..' | '..status..' | Selecionado: '..SelecTionText

                        if dist < 250 then
                            if isSelected then
                                ZZClief.toggles[nomeveh..veh] = true
                            else
                                ZZClief.toggles[nomeveh..veh] = false
                            end
                            if ZZClief.SelectedVehicle == veh then
                                ZZClief:CheckBox(Title, SubTitle, nomeveh..veh, function()
                                    ZZClief.SelectedVehicle = not ZZClief.SelectedVehicle
                                end)
                            else
                                ZZClief:CheckBox(Title, SubTitle, nomeveh..veh, function()
                                    ZZClief.SelectedVehicle = veh
                                end)
                            end
                        end
                    end
                end

                    
            elseif ZZClief.subtabs.active == 'Selecionado' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    ZZClief:CheckBox('Spectar Veículo', 'Ativar/Desativar Spectador de Veículo', 'isSpectateVehicleActive', function(state)
                        ZZClief.toggles.isSpectateVehicleActive = state
                        local spectate_cam = nil
                    
                        if state then
                            local playerPed = PlayerPedId()
                            local vehicle = ZZClief.SelectedVehicle
                    
                            if DoesEntityExist(vehicle) then
                                local coords = GetEntityCoords(vehicle)
                    
                                spectate_cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                                SetCamCoord(spectate_cam, coords.x, coords.y, coords.z + 5.0)
                                SetCamActive(spectate_cam, true)
                                RenderScriptCams(true, false, 0, true, true)
                    
                                FreezeEntityPosition(playerPed, true)
                                SetEntityVisible(playerPed, false, false)
                    
                                Citizen.CreateThread(function()
                                    while ZZClief.toggles.isSpectateVehicleActive do
                                        Citizen.Wait(0)
                                        if DoesEntityExist(vehicle) then
                                            local vehicleCoords = GetEntityCoords(vehicle)
                                            SetCamCoord(spectate_cam, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 5.0)
                                            PointCamAtEntity(spectate_cam, vehicle, 0.0, 0.0, 0.0, true)
                                        else
                                            ZZClief.toggles.isSpectateVehicleActive = false
                                        end
                                    end
                                end)
                    
                                print("Spectador de Veículo Ativado!")
                            else
                                print("Nenhum veículo selecionado!")
                                ZZClief.toggles.isSpectateVehicleActive = false
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
                    
                
ZZClief:Button('Puxar Veículo', 'Você Vai Puxar O Veículo Selecionado', function() 

if ZZClief.SelectedVehicle then 
    local playerPed = PlayerPedId()
    local veh = ZZClief.SelectedVehicle
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

local Target = ZZClief.SelectedVehicle

function BugPlayerVeh()
    if DoesEntityExist(Target) then
        NetworkRequestEntityControl(Target)
        local Cordenadas = GetEntityCoords(PlayerPedId())
        ApplyForceToEntity(Target, 3, Cordenadas, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
    else
        print("Veículo selecionado não existe ou não é válido.")
    end
end

function BugPlayerVeh2()
    if DoesEntityExist(Target) then
        NetworkRequestEntityControl(Target)
        local Cordenadas = GetEntityCoords(PlayerPedId())
        ApplyForceToEntity(Target, 3, Cordenadas, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
    else
        print("Veículo selecionado não existe ou não é válido.")
    end
end

ZZClief:Checkbox('Bugar Veículo 1', 'Aplica o Bug 1 no veículo selecionado.', false, function(state)
    if state then
        BugPlayerVeh()
    end
end)

ZZClief:Checkbox('Bugar Veículo 2', 'Aplica o Bug 2 no veículo selecionado.', false, function(state)
    if state then
        BugPlayerVeh2()
    end
end)

local destrancarVeiculos = false

ZZClief:CheckBox('Destrancar Veículos Próximos', 'Destranca continuamente todos os veículos próximos', function(state)
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

ZZClief:CheckBox('Trancar Veículos Próximos', 'Tranca continuamente todos os veículos próximos', function(state)
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


ZZClief:Button('Destrancar Veículo Sel', 'Destranca o veículo selecionado', function()
if ZZClief.SelectedVehicle then
    SetVehicleDoorsLocked(ZZClief.SelectedVehicle, 1)  
    SetVehicleDoorsLockedForPlayer(ZZClief.SelectedVehicle, PlayerId(), false)  
    SetVehicleDoorsLockedForAllPlayers(ZZClief.SelectedVehicle, false)  
    print('O veículo foi destrancado!') 
else
    print('Nenhum veículo selecionado!') 
end
end, 'right')


ZZClief:Button('Trancar Veículo Sel', 'Tranca o veículo selecionado', function()
if ZZClief.SelectedVehicle then
    if DoesEntityExist(ZZClief.SelectedVehicle) then
        SetVehicleDoorsLocked(ZZClief.SelectedVehicle, 1)  
        SetVehicleDoorsLockedForPlayer(ZZClief.SelectedVehicle, PlayerId(), true)  
        SetVehicleDoorsLockedForAllPlayers(ZZClief.SelectedVehicle, true)  
        print('O veículo foi trancado!') 
    else
        print('O veículo não existe!') 
    end
else
    print('Nenhum veículo selecionado!') 
end
end, 'right')





ZZClief:Button('Tp Veículo Sel', 'Teleporta o jogador até o veículo selecionado', function()
if ZZClief.SelectedVehicle then
    local vehCoords = GetEntityCoords(ZZClief.SelectedVehicle)  
    SetEntityCoordsNoOffset(PlayerPedId(), vehCoords)  
    Citizen.Wait(1000)
    TaskWarpPedIntoVehicle(PlayerPedId(), ZZClief.SelectedVehicle, -1)  
    print('Veículo teleportado com sucesso!') 
else
    print('Erro: Nenhum veículo selecionado!') 
end
end, 'right')


ZZClief:Button('Deletar Veículo Selecionado', 'Você vai deletar o veículo selecionado', function()
    local target = ZZClief.SelectedVehicle

    if target then
    if DoesEntityExist(vehicle) then
    NetworkRequestEntityControl(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
    DeleteEntity(vehicle)
     end
   end
end)

ZZClief:Button('Reparar Veículo', 'Você vai reparar o veículo selecionado', function()
    local veiculo = ZZClief.SelectedVehicle
    if DoesEntityExist(veiculo) then
        NetworkRequestControlOfEntity(veiculo)
        SetVehicleOnGroundProperly(veiculo)
        SetVehicleFixed(veiculo)
        SetVehicleDirtLevel(veiculo, 0.0)
        SetVehicleLights(veiculo, 0)
        SetVehicleBurnout(veiculo, false)
        SetVehicleLightsMode(veiculo, 0)
    end
end)
                
                    

            elseif ZZClief.subtabs.active == 'Seu Veiculo' then -- SE O SUBTAB 3 JOGADOR ESTIVER ATIVO ENTAO

                ZZClief:Button('Reparar Veículo', 'Voce Vai reparar seu veiculo', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
            
                    SetVehicleOnGroundProperly(GetVehiclePedIsIn(PlayerPedId(), 0))
                    SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), false))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(PlayerPedId(), false), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(PlayerPedId(), false), false)
                    SetVehicleLightsMode(GetVehiclePedIsIn(PlayerPedId(), false), 0)
                end) 
                

                    ZZClief:Button('Tunning Veiculo', 'Voce Vai tunar seu veiculo', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
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
                    
                    ZZClief:Button('Gasolina Vehicle', 'Voce Vai Definir Gasolina 100 No Seu Carro', function()
                        local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    
                        if DoesEntityExist(Vehicle) then
                            NetworkRequestEntityControl(Vehicle)
                            SetVehicleFuelLevel(Vehicle, 100.0)
                        end
                    end)
                    

                    ZZClief:Button('Tp veiculo Prox', 'Voce Vai teleportar para um veiculo proximo', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
            
                        Tp_veiculoProx()
                    end)

                    

                    ZZClief:Button('Deletar Veículo', 'Você vai deletar seu veículo ou o mais próximo vazio', function()
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
                    
                    

                    

                    ZZClief:CheckBox('Boozina Boost [E]', 'Ira Acelerar seu carro ao maximo apertando o [E]', 'H07nB00st33r', function(buzinabost)
                        if buzinabost then
                            Citizen.CreateThread(function()
                                while ZZClief.toggles.H07nB00st33r do
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
                    
                    ZZClief:CheckBox('GodMode Vehicle', 'Deixa o Carro Invencivel', 'ToggleGodModeVehicle', function(toggleState)
                        if toggleState then 
                            local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                            SetVehicleEngineOn(vehicle, true, true, true)
                            SetVehicleTyresCanBurst(vehicle, false)
                            SetVehicleFixed(vehicle)
                        else
                            local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                            SetVehicleTyresCanBurst(vehicle, true)
                        end
                    end)

                    ZZClief:CheckBox('Freio de Avião', 'Freia o carro instantaneamente', 'FreioAviao', function(freioaviao)
                        if freioaviao then
                            Citizen.CreateThread(function()
                                while ZZClief.toggles.FreioAviao do
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
                    
                elseif ZZClief.subtabs.active == 'Spawn List' then -- SE O SUBTAB 4 JOGADOR ESTIVER ATIVO ENTAO
                
                    ZZClief:Button('Spawnar T20', 'Você ira Spawnar um T20', function()
                        SpawnarCarro('t20')
                    end)

                    ZZClief:Button('Spawnar Akuma', 'Você ira Spawnar uma Akuma', function()
                        SpawnarCarro('akuma')
                    end)

                    ZZClief:Button('Spawnar Rhino', 'Você ira Spawnar um Rhino', function()
                        SpawnarCarro('rhino')
                    end)

            elseif ZZClief.tabs.active == 'Armas' then

                ZZClief:SubTab('Armas') --SUBTAB 1
                ZZClief:SubTab('Spawn') --SUBTAB 2

                if ZZClief.subtabs.active == 'Armas' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO
                    

                    ZZClief:Button('Adicionar Attachs', 'Você irá adicionar equipamentos a sua arma.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
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


                    ZZClief:Button('Remover Armas', 'Você irá remover todas suas armas.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        RemoveAllPedWeapons(PlayerPedId())
                    end)

                    ZZClief:CheckBox('No Reload', 'Não irá recarregar sua arma.', 'norrrecarregar', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                        --EXEMPLO DE USO DA CheckBox

                        if ZZClief.toggles.norrrecarregar then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                            local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                            SetPedInfiniteAmmoClip(PlayerPedId(), true, Ped_W)
                        else
                            local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                            SetPedInfiniteAmmoClip(PlayerPedId(), false, Ped_W)
                        end
                        end)

                        ZZClief:CheckBox('Munição Infinita', 'Não irá acabar a munição da sua arma.', 'nomuniinf', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                            --EXEMPLO DE USO DA CheckBox
    
                            if ZZClief.toggles.nomuniinf then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                                local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                                SetPedInfiniteAmmo(PlayerPedId(), true, Ped_W)
                            else
                                local Ped_W = GetSelectedPedWeapon(PlayerPedId())
                                SetPedInfiniteAmmo(PlayerPedId(), false, Ped_W)
                            end
                            end)


                elseif ZZClief.subtabs.active == 'Spawn' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    if getsource('MQCU') or getsource('likizao_ac') then
                    ZZClief:Button('Spawnar Pistol Mk2', 'Irá spawnar uma pistol mk2.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        Citizen.CreateThread(function()
                            local Tunnel = module("vrp","lib/Tunnel")
                            local Proxy = module("vrp","lib/Proxy")
                            vRP = Proxy.getInterface("vRP")
                             vRP.giveWeapons({['WEAPON_PISTOL_MK2'] = {ammo = 200}})
                    end)
                end)
        end

        if getsource('MQCU') or getsource('likizao_ac') then

            ZZClief:Button('Spawnar SpecialCarbine Mk2', 'Irá spawnar uma G3 mk2.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp","lib/Tunnel")
                    local Proxy = module("vrp","lib/Proxy")
                    vRP = Proxy.getInterface("vRP")
                     vRP.giveWeapons({['WEAPON_SPECIALCARBINE_MK2'] = {ammo = 200}})
            end)
        end)
    end

if getsource('MQCU') or getsource('likizao_ac') then

    ZZClief:Button('Spawnar AssaultRifle Mk2', 'Irá spawnar uma Ak47 mk2.', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
        Citizen.CreateThread(function()
            local Tunnel = module("vrp","lib/Tunnel")
            local Proxy = module("vrp","lib/Proxy")
            vRP = Proxy.getInterface("vRP")
             vRP.giveWeapons({['WEAPON_ASSAULTRIFLE_MK2'] = {ammo = 200}})
    end)
end)

end

if getsource('MQCU') or getsource('likizao_ac') then

ZZClief:Button("Spawnar Pistol Mk2", function()
    Citizen.CreateThread(function()
        local Tunnel = module("vrp","lib/Tunnel")
        local Proxy = module("vrp","lib/Proxy")
        vRP = Proxy.getInterface("vRP")
         vRP.giveWeapons({['WEAPON_PISTOL_MK2'] = {ammo = 200}})

         
end)
end)
end

if getsource('MQCU') or getsource('likizao_ac') then
    
    ZZClief:Button("Spawnar Pistol Mk2 (Likizão)", 'Irá spawnar uma Pistol Mk2. Risk De Log', function()
        local weapon = GetHashKey("WEAPON_PISTOL_MK2")
        spawnweapon(weapon)

        
        
         
    end)
end

ZZClief:CheckBox('Bugar Arma na Mão', 'Buga a Arma na sua Mão', 'Togglearmitanamaozita', function(toggleState)
    if toggleState then 
        armitanamaozita()
            print('GodMode ativado.')
    else
        print('GodMode desativado.')
    end
end)

if getsource('PL_PROTECT') or getsource('ThnAC')  then
ZZClief:Button('Indisponivel', 'Servidor sem suporte de [BYPASS].', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
print('Indisponivel')
end)
end 
                    
                end

            elseif ZZClief.tabs.active == 'Online' then

                ZZClief:SubTab('Online') --SUBTAB 1
                ZZClief:SubTab('Outros') --SUBTAB 2
                ZZClief:SubTab('Players') --SUBTAB 2

                if ZZClief.subtabs.active == 'Online' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

                
                
                    local playersModule = {}

                    ZZClief:Button('Remover do Veículo', 'Você Vai Remover O Jogador Selecionado Do Veículo', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                    if ZZClief.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
                        local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                        
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


                ZZClief:Button('Copiar Roupa', 'Você Vai Copiar A Roupa Do Player Selecionado', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                    if ZZClief.SelectedPlayer then -- IDENTIFICADOR DO PLAYER SELECIONADO
                        local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                
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

                ZZClief:Button('Copiar PED', 'Voce Vai Copiar o PED Do Player Selecionado', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                    Copy_PED()
                end)

                if getsource("likizão_ac") then
                    ZZClief:Button('Chuva do Anti Rp no Jogador Selecionado (SANTAS)', 'Faz uma chuva de Veículos Anti Rp no player selecionado', function()
                        if ZZClief.SelectedPlayer then
                            local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                            if playerselped ~= PlayerPedId() then
                                local coords = GetEntityCoords(playerselped)
                                local Veiculos = {
                                    "titan",
                                    "cargoplane",
                                    "jetmax",
                                    "submersible",
                                    "yacht",
                                    "cargobob",
                                    "mammatus",
                                    "marquis",
                                    "dodo"
                                }
                               
                                for i = 1, 1000 do
                                    local veiculoNome = Veiculos[math.random(#Veiculos)]
                                    local mhash = GetHashKey(veiculoNome)
                                    RequestModel(mhash)
                                    while not HasModelLoaded(mhash) do
                                        Citizen.Wait(0)
                                    end
                                    local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false)
                                    NetworkRegisterEntityAsNetworked(veiculo)
                                    ApplyForceToEntity(veiculo, 1, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, true, true, true, true, true, true)
                                    Wait(100)
                                end
                                print('✔️ Chuva de Anti Rp ativada no player com sucesso!')
                            else
                                print('⚠ Você não pode fazer a chuva de Anti Rp em si mesmo!')
                            end
                        else
                            print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de Anti Rp.')
                        end
                    end)
                
                    ZZClief:Button('Chuva de Barco no Player (SANTAS)', 'Faz uma chuva de barcos no player selecionado', function()
                        if ZZClief.SelectedPlayer then
                            local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                            if playerselped ~= PlayerPedId() then
                                local coords = GetEntityCoords(playerselped)
                                local car = "JetMax"
                                local mhash = GetHashKey(car)
                                RequestModel(mhash)
                                while not HasModelLoaded(mhash) do
                                    Citizen.Wait(0)
                                end
                                
                                for i = 1, 1000 do
                                    local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false)
                                    NetworkRegisterEntityAsNetworked(veiculo)
                                    Wait(100)
                                end
                                print('✔️ Chuva de barco ativada no player com sucesso!')
                            else
                                print('⚠ Você não pode fazer a chuva de barco em si mesmo!')
                            end
                        else
                            print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de barco.')
                        end
                    end)
                
                    ZZClief:Button('Chuva de Submarinos Gigantes no Player (SANTAS)', 'Faz uma chuva de submarinos gigantes no player selecionado', function()
                        if ZZClief.SelectedPlayer then
                            local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                            if playerselped ~= PlayerPedId() then
                                local coords = GetEntityCoords(playerselped)
                                local car = "kosatka"
                                local mhash = GetHashKey(car)
                                RequestModel(mhash)
                                while not HasModelLoaded(mhash) do
                                    Citizen.Wait(0)
                                end
                                
                                for i = 1, 1000 do
                                    local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false)
                                    NetworkRegisterEntityAsNetworked(veiculo)
                                    Wait(100)
                                end
                                print('✔️ Chuva de submarinos gigantes ativada no player com sucesso!')
                            else
                                print('⚠ Você não pode fazer a chuva de submarinos em si mesmo!')
                            end
                        else
                            print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de submarinos.')
                        end
                    end)
                
                    ZZClief:Button('Chuva de Barco Gigante no Player (SANTAS)', 'Faz uma chuva de barcos gigantes no player selecionado', function()
                        if ZZClief.SelectedPlayer then
                            local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                            if playerselped ~= PlayerPedId() then
                                local coords = GetEntityCoords(playerselped)
                                local car = "tug"
                                local mhash = GetHashKey(car)
                                RequestModel(mhash)
                                while not HasModelLoaded(mhash) do
                                    Citizen.Wait(0)
                                end
                                
                                for i = 1, 1000 do
                                    local veiculo = CreateVehicle(mhash, coords.x, coords.y, coords.z + 70, 0.0, true, false)
                                    NetworkRegisterEntityAsNetworked(veiculo)
                                    Wait(100)
                                end
                                print('✔️ Chuva de barco gigante ativada no player com sucesso!')
                            else
                                print('⚠ Você não pode fazer a chuva de barco em si mesmo!')
                            end
                        else
                            print('⚠ Aviso! Selecione um jogador antes de ativar a chuva de barco.')
                        end
                    end)
                
                    ZZClief:Button('Fuder Player (Santa)', 'Carros fodem o player selecionado', function()
                        if ZZClief.SelectedPlayer then
                            local playerselped = GetPlayerPed(ZZClief.SelectedPlayer)
                            if playerselped ~= PlayerPedId() then
                                local car = "avisa"
                                local coords = GetEntityCoords(playerselped)
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
                                    SetEntityVelocity(veiculo, 0.0, 0.0, -1000.0)
                                    Wait(100)
                                end
                                print('✔️ Carro ativado para foder o player com sucesso!')
                            else
                                print('⚠ Você não pode realizar essa ação em si mesmo!')
                            end
                        else
                            print('⚠ Aviso! Selecione um jogador antes de realizar a ação.')
                        end
                    end)
                end






                local function GetAllVehicles()
                    local vehicles = {}
                    local handle, vehicle = FindFirstVehicle()
                    local success
                    
                    repeat
                        table.insert(vehicles, vehicle)
                        success, vehicle = FindNextVehicle(handle)
                    until not success
                    
                    EndFindVehicle(handle)
                    return vehicles
                end
                
                local function RequestControl(vehicle)
                    local netId = NetworkGetNetworkIdFromEntity(vehicle)
                    NetworkRequestControlOfNetworkId(netId)
                    local timeout = 2000
                    while not NetworkHasControlOfNetworkId(netId) and timeout > 0 do
                        Citizen.Wait(100)
                        timeout = timeout - 100
                    end
                    return NetworkHasControlOfNetworkId(netId)
                end
                
                ZZClief:CheckBox('Indexar Veículos no Jogador', 'Grudar os Carros no Jogador Selecionado', 'GrudarVeiculosNoJogador', function()
                    if ZZClief.toggles.GrudarVeiculosNoJogador and ZZClief.SelectedPlayer then
                        local allVehicles = GetAllVehicles()
                        for i, vehicle in ipairs(allVehicles) do
                            if RequestControl(vehicle) then
                                Grudarvehsinplayer(vehicle, ZZClief.SelectedPlayer)
                            end
                        end
                    end
                end, 'right')
                
                ZZClief:Button('Chuva de Carros', 'Faz Chover Carros no Jogador Selecionado', function()
                    CreateThread(function()
                        local allVehicles = GetAllVehicles()
                        for i, vehicle in ipairs(allVehicles) do
                            if RequestControl(vehicle) then
                                SetEntityCoords(vehicle, GetEntityCoords(GetPlayerPed(ZZClief.SelectedPlayer)) + vector3(0, 0, 20))
                                SetEntityRotation(vehicle, math.random(10, 180))
                                SetEntityVelocity(vehicle, 0.0, 0.0, -100.0)
                            end
                        end
                    end)
                end)
                
                ZZClief:CheckBox('Matar Player Usando Carros', 'Grudar os Carros no Jogador Selecionado e Atropelá-lo', 'MatarPlayer', function()
                    if ZZClief.toggles.MatarPlayer and ZZClief.SelectedPlayer then
                        local allVehicles = GetAllVehicles()
                        for i, vehicle in ipairs(allVehicles) do
                            if RequestControl(vehicle) then
                                MatarPlayer(vehicle, ZZClief.SelectedPlayer)
                            end
                        end
                    end
                end, 'right')



ZZClief:Button('Teleportar para Jogador', 'Teleporta você até o jogador selecionado', function()
    if ZZClief.SelectedPlayer then
        local targetPed = GetPlayerPed(ZZClief.SelectedPlayer) -- Obtém o Ped do jogador selecionado
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

ZZClief:Button('Attachar Veículo', 'Grude o veículo no Meio Do Jogador Selecionado', function()
    local selectedPlayer = ZZClief.SelectedPlayer
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


ZZClief:Button('Matar Player com Helicópteros', 'Mata o Selecionado usando Helicopteros (Santa Group)', function() 
    if ZZClief.SelectedPlayer then
        local playerPed = GetPlayerPed(ZZClief.SelectedPlayer)
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
            local dist = Vdist(cordenadas.x, cordenadas.y, cordenadas.z, GetEntityCoords(helicopter))
            if dist < 5.0 then
                SetEntityHealth(playerPed, 0)
                
                SetEntityInvincible(helicopter, false)
                SetEntityHealth(helicopter, 0)
            end
        end)
    end
end)
       




    ZZClief:Button('Bugar Jogador (Santas)', 'Bugar jogador selecionado', function()
        if ZZClief.SelectedPlayer then
            Citizen.CreateThread(function()
                redBull(GetPlayerPed(ZZClief.SelectedPlayer))
            end)
        end
    end)






ZZClief:Button('Chamado de Deus (Santas)', 'Executa o chamado de Deus no jogador selecionado', function()
local target = ZZClief.SelectedPlayer
playersModule.chamadoDeDeus(target)
end)



ZZClief:Button('Prender Jogador (Lotus)', 'Prende o jogador selecionado em uma gaiola', function()
local target = ZZClief.SelectedPlayer
playersModule.cagePlayer(target)
end)


ZZClief:CheckBox('Saquear Jogador', 'Saqueia o inventário do jogador selecionado', function(state)
    if state then
        print('CheckBox Ativada - Saqueando jogador selecionado')

        local SelectedPlayer = GetPlayerPed(ZZClief.SelectedPlayer)
        if ZZClief.SelectedPlayer then
            local oldCoords = GetEntityCoords(PlayerPedId())
            local playerCoords = GetEntityCoords(ZZClief.SelectedPlayer)

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

ZZClief:CheckBox('Simular H', 'O jogador selecionado ficará segurando você no H.', 'fingirArrasto', function()
    if ZZClief.toggles.fingirArrasto then -- Se a CheckBox estiver ativada (TRUE)
        local player = GetPlayerPed(ZZClief.SelectedPlayer)
        if DoesEntityExist(player) and player ~= PlayerPedId() then
            -- Faz o jogador selecionado "segurar" o jogador atual
            AttachEntityToEntity(PlayerPedId(), player, 4103, 0.7, 0, 0, 0, 0, 0, false, false, false, false, 2, true)
            print('🖐 Jogador segurando você no H!')
        else
            print('⚠ Jogador selecionado não existe ou você está tentando se segurar!')
        end
    else -- Se estiver desativada (FALSE)
        if IsEntityAttachedToEntity(PlayerPedId(), GetPlayerPed(ZZClief.SelectedPlayer)) then
            -- Desanexa o jogador se a CheckBox for desmarcada e estiver anexado
            DetachEntity(PlayerPedId(), true, true)
            print('❌ Desanexado do jogador!')
        end
    end
end)

ZZClief:CheckBox('Comer Jogador', 'Realize atos banais com o jogador selecionado', 'ComerJogadorBool', function()
    if ZZClief.toggles.ComerJogadorBool then
        if ZZClief.SelectedPlayer then
            local playerPed = GetPlayerPed(ZZClief.SelectedPlayer)
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

ZZClief:CheckBox('Cagar Na Cabeça do Jogador', 'Cague na Cabeça do Player Selecionado.', 'MamarJogadorBool', function()
    if ZZClief.toggles.MamarJogadorBool then
        if ZZClief.SelectedPlayer then
            local playerPed = GetPlayerPed(ZZClief.SelectedPlayer)
            if playerPed ~= PlayerPedId() and IsPedAPlayer(playerPed) then
                SetEntityCoords(PlayerPedId(), GetEntityCoords(playerPed), 0.0, 0.0, 0.0, false)
                AttachEntityToEntity(PlayerPedId(), playerPed, -1, 0.0, -0.5, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

                ExecuteCommand("e cagar")



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

ZZClief:CheckBox('Colocar Jogador pra Mamar', 'Faça o jogador selecionado realizar um blow job.', 'MamarJogadorBool', function()
    if ZZClief.toggles.MamarJogadorBool then
        if ZZClief.SelectedPlayer then
            local playerPed = GetPlayerPed(ZZClief.SelectedPlayer)
            if playerPed ~= PlayerPedId() and IsPedAPlayer(playerPed) then
                SetEntityCoords(PlayerPedId(), GetEntityCoords(playerPed), 0.0, 0.0, 0.0, false)
                AttachEntityToEntity(PlayerPedId(), playerPed, -1, 0.0, -0.5, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

                ExecuteCommand("e sexo2")

                local dict = "rcmpaparazzo_2"
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do Wait(1) end

                if HasAnimDictLoaded(dict) then
                    TaskPlayAnim(playerPed, dict, "shag_loop_poppy", 5.0, 1.0, -1, 50, false, false, false)
                    TaskPlayAnim(PlayerPedId(), dict, "shag_loop_a", 5.0, 1.0, -1, 50, false, false, false)
                else
                    print('❌ Dicionário de animação não carregado!')
                end

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

ZZClief:Button('Puxar Veículos no Player', 'Puxar veículos para o jogador selecionado', function()
if ZZClief.SelectedPlayer then
    local coords = GetEntityCoords(GetPlayerPed(ZZClief.SelectedPlayer))
    local vehTable = GetGamePool("CVehicle")
    for _, vehicle in ipairs(vehTable) do
        if GetPedInVehicleSeat(vehicle, -1) == 0 then
            local addX = math.random(-2, 2)
            local addY = math.random(-2, 2)
            SetEntityCoords(vehicle, coords.x + addX, coords.y + addY, coords.z, false, false, false, false)
        end
    end
end
end)


ZZClief:Button('Grudar pinto na Boca do jogador (Lotus)', 'Grudar dildo na Boca do Jogador Selecionado (Lotus Group)', function()
    Citizen.CreateThread(function()
        local prop = "v_res_d_dildo_c" 
        local boneIndex = 12844 

        local player = ZZClief.SelectedPlayer
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



ZZClief:Button('Grudar pinto na minha boca', 'Grudar dildo na minha boca (Lotus Group)', function()
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




ZZClief:Button('Grudar carro na boca do jogador', 'Grudar carro na boca do jogador selecionado (Lotus Group)', function()
Citizen.CreateThread(function()
    local prop = "prop_car_01a" -- Modelo do carro (substitua pelo nome correto do modelo do carro)
    local boneIndex = 12844 -- Índice do osso da cabeça (boca)

    while true do
        Citizen.Wait(1000) -- Evita sobrecarga no loop

        
        local player = ZZClief.SelectedPlayer

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



ZZClief:Button('Grudar Tank na boca do jogador', 'Grudar tanque na boca do jogador selecionado (Lotus Group)', function()
Citizen.CreateThread(function()
    local prop = "rhino" -- Modelo do tanque
    local boneIndex = 12844 -- Índice do osso da cabeça (boca)

    while true do
        Citizen.Wait(1000) -- Evita sobrecarga no loop

        -- Acessa o jogador selecionado com ZZClief.SelectedPlayer
        local player = ZZClief.SelectedPlayer

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




                    
                elseif ZZClief.subtabs.active == 'Outros' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    ZZClief:Button(
                        'Missel Player', -- Título do botão
                        'Irá spawnar um missel no player (Lotus Group).', 
                        function()

                    
                                local playerPed = PlayerPedId()
                                if ZZClief.SelectedPlayer then
                                    local targetPed = GetPlayerPed(ZZClief.SelectedPlayer)
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

                            
                                
                                ZZClief:Button('Explodir Selecionado', 'Explode o Jogador Selecionado', function()
                                    local SelPlayer = ZZClief.SelectedPlayer()
                                    Explodir(9,SelPlayer)

                                end)

                                ZZClief:Button('Molotov Player', 'Joga Uma Molotov no Player (Risk Ban Pl)', function()
                                    molotivisk(ZZClief.SelectedPlayer)
                                    

                                end)

                elseif ZZClief.subtabs.active == 'Players' then -- SE O SUBTAB 3 JOGADOR ESTIVER ATIVO ENTAO
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
                        local isSelected = ZZClief.SelectedPlayer == player
                        local SelecTionText = isSelected and 'Sim' or 'Não'

                        local Title = 'Nome: '..playerName..' | Distancia: '..dist..'m'
                        local SubTitle = ''..staff..' | Vida: '..vasco..' | Selecionado: '..SelecTionText

                        if dist < 400 then
                            if isSelected then
                                ZZClief.toggles[playerName..playerped] = true
                            else
                                ZZClief.toggles[playerName..playerped] = false
                            end
                            if ZZClief.SelectedPlayer == player then
                                ZZClief:CheckBox(Title, SubTitle, playerName..playerped, function()
                                    ZZClief.SelectedPlayer = not ZZClief.SelectedPlayer
                                end)
                            else
                                ZZClief:CheckBox(Title, SubTitle, playerName..playerped, function()
                                    ZZClief.SelectedPlayer = player
                                end)
                            end
                        end
                    end
                end

            elseif ZZClief.tabs.active == 'Destruição' then

                

                ZZClief:SubTab('Destruição') --SUBTAB 1
                ZZClief:SubTab('Skins') --SUBTAB 2
                ZZClief:SubTab('Props') --SUBTAB 3

                if ZZClief.subtabs.active == 'Destruição' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

                    ZZClief:Button('Banir Player (Lotus Group)', 'Banir Player Selecionado', function()
                        local selectedPlayer = ZZClief.SelectedPlayer
                        local playerPed = GetPlayerPed(selectedPlayer)
                        local initialPos = GetEntityCoords(playerPed)
                        local targetPos = vector3(1000.0, 1000.0, 50.0)
                    
                        SetEntityVisible(playerPed, false, false)
                        SetEntityCollision(playerPed, false, false)
                    
                        SetEntityCoordsNoOffset(playerPed, targetPos.x, targetPos.y, targetPos.z, true, true, true)
                    
                        local startTime = GetGameTimer()
                        local timeLimit = 20000
                    
                        Citizen.CreateThread(function()
                            while GetGameTimer() - startTime < timeLimit do
                                local currentPos = GetEntityCoords(playerPed)
                                SetEntityCoordsNoOffset(playerPed, currentPos.x, currentPos.y, currentPos.z + 1.0, true, true, true)
                                Citizen.Wait(50)
                                SetEntityCoordsNoOffset(playerPed, currentPos.x, currentPos.y, currentPos.z - 1.0, true, true, true)
                                Citizen.Wait(50)
                            end
                    
                            SetEntityCoordsNoOffset(playerPed, initialPos.x, initialPos.y, initialPos.z, true, true, true)
                            SetEntityVisible(playerPed, true, false)
                            SetEntityCollision(playerPed, true, true)
                        end)
                    end)
                    
                    


                    ZZClief:Button('Crashar Players (Lotus Group)', 'Crasha os Players Em Volta (Lotus Group)', function()
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

local isLookingAtVehicle = false
local vehicleName = ""
local vehicleDistance = 0.0
local canPullVehicle = false

ZZClief:CheckBox('Puxar Veículo Olhando (E)', 'Puxe o Carro que Você esta Olhando com (E)', 'TogglePullVehicle', function(toggleState)
    canPullVehicle = toggleState
    if canPullVehicle then
        print('Função de puxar veículo ativada.')
    else
        print('Função de puxar veículo desativada.')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local forwardVector = GetEntityForwardVector(playerPed)
        local rayHandle = CastRayPointToPoint(playerPos.x, playerPos.y, playerPos.z, playerPos.x + forwardVector.x * 10.0, playerPos.y + forwardVector.y * 10.0, playerPos.z + forwardVector.z * 10.0, 10, playerPed, 0)
        local _, hit, endCoords, _, entityHit = GetRaycastResult(rayHandle)

        if hit and IsEntityAVehicle(entityHit) then
            isLookingAtVehicle = true
            vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(entityHit))
            vehicleDistance = Vdist(playerPos.x, playerPos.y, playerPos.z, endCoords.x, endCoords.y, endCoords.z)
        else
            isLookingAtVehicle = false
            vehicleName = ""
            vehicleDistance = 0.0
        end

        if isLookingAtVehicle then
            DrawMarker(1, endCoords.x, endCoords.y, endCoords.z + 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.35, 0.35)
            SetTextColour(255, 255, 255, 255)
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(vehicleName .. " - " .. math.ceil(vehicleDistance) .. "m")
            DrawText(0.5, 0.5)
        end

        if canPullVehicle and IsControlJustPressed(0, 38) and isLookingAtVehicle then
            TaskWarpPedIntoVehicle(playerPed, entityHit, -1)
            print('Carro puxado!')
        end
    end
end)

 
                    ZZClief:CheckBox('Magneto', 'Puxe Todos Carros Para Uma Bola Vermelha', 'MagnetoForce', function(toggleState)
                        ZZClief.toggles.MagnetoForce = toggleState
                    
                        if toggleState then
                            local PullKey = 38
                            local Distance = 40
                            local BallHeightOffset = 2.0
                    
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
                    
                            local function forcetick()
                                if IsDisabledControlPressed(0, 15) then
                                    Distance = Distance + 1
                                elseif IsDisabledControlPressed(0, 14) and Distance > 20 then
                                    Distance = Distance - 1
                                end
                    
                                local StartPull = IsDisabledControlPressed(0, PullKey)
                                local pid = PlayerPedId()
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
                    
                                for _, veh in pairs(ZZClief.vehicle.VeiculosRequested) do
                                    if getControl(veh) and GetDistanceBetweenCoords(GetEntityCoords(pid), GetEntityCoords(veh), true) < 1000 then
                                        SetEntityInvincible(veh, false)
                                        if IsEntityOnScreen(veh) and StartPull then
                                            local vehCoords = GetEntityCoords(veh)
                                            local direction = Markerloc - vehCoords
                                            local distanceToMarker = #(direction)
                                            direction = direction / distanceToMarker
                                            local forceMultiplier = 3.0
                                            ApplyForceToEntity(veh, 3, direction.x * forceMultiplier, direction.y * forceMultiplier, direction.z * forceMultiplier, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                                        end
                                    end
                                end
                            end
                    
                            Citizen.CreateThread(function()
                                while ZZClief.toggles.MagnetoForce do
                                    forcetick()
                                    Citizen.Wait(0)
                                end
                            end)
                        end
                    end)



                    freecam = { 
                        mode = 1,
                        modes = {
                            'Olhar em Volta',
                            'Teleport',
                            'Explosão Azul',
                            'Lançar Veiculos',
                            'Chuva de Veiculos',
                            'Colocar Veiculos',
                            'Rampa Spawner',
                            'Animal Spawner',
                            'Aviao Spawner',
                        },
                    }
                    
                    freecam2 = { 
                        mode2 = 1,
                        modes2 = {
                            'Olhar em Volta',
                            'Teleport',
                            'Explodir',
                            'Explosão Azul',
                            'Lançar Veiculos',
                            'Chuva de Veiculos',
                            'Colocar Veiculos',
                            'Cargoplane Spawner',
                        },
                    }
                    
                    ZZClief:CheckBox('Freecam', 'Ativar/Desativar Freecam', 'ToggleFreecam', function(toggleState)
                        if toggleState then
                            local Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
                            RenderScriptCams(true, true, 700, true, true)
                            SetCamActive(Camera, true)
                            SetCamCoord(Camera, GetGameplayCamCoord())
                            local CDSRotX = GetGameplayCamRot(2).x
                            local CDSRotY = GetGameplayCamRot(2).y
                            local CDSRotZ = GetGameplayCamRot(2).z
                    
                            Citizen.CreateThread(function()
                                while DoesCamExist(Camera) do
                                    Wait(0)
                                    FreeCamKeys()
                                    local FreecamModes = freecam.modes[freecam.mode]
                                    local Camera_rot = GetCamRot(Camera, 2)
                                    local Cordenadas = GetCamCoord(Camera)
                                    local adjustedRotation = {
                                        x = (math.pi / 180) * GetCamRot(Camera, 0).x,
                                        y = (math.pi / 180) * GetCamRot(Camera, 0).y,
                                        z = (math.pi / 180) * GetCamRot(Camera, 0).z
                                    }
                                    local direction = {
                                        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
                                        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
                                        z = math.sin(adjustedRotation.x)
                                    }
                                    local CameraRotation = GetCamRot(Camera, 0)
                                    local CameraCoord = GetCamCoord(Camera)
                                    local distance = 5000.0
                                    local destination = {
                                        x = CameraCoord.x + direction.x * distance,
                                        y = CameraCoord.y + direction.y * distance,
                                        z = CameraCoord.z + direction.z * distance
                                    }
                                    local a, b, Cordenadas, d, entity =
                                        GetShapeTestResult(
                                        StartShapeTestRay(
                                            CameraCoord.x,
                                            CameraCoord.y,
                                            CameraCoord.z,
                                            destination.x,
                                            destination.y,
                                            destination.z,
                                            -1,
                                            -1,
                                            1
                                        )
                                    )
                                    SetCamFov(Camera, 75.0)
                    
                                    if not toggleState then
                                        DestroyCam(Camera, false)
                                        ClearTimecycleModifier()
                                        RenderScriptCams(false, true, 700, true, true)
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetFocusEntity(PlayerPedId())
                                        break
                                    end
                                end
                            end)
                        else
                            DestroyCam(Camera, false)
                            ClearTimecycleModifier()
                            RenderScriptCams(false, true, 700, true, true)
                            FreezeEntityPosition(PlayerPedId(), false)
                            SetFocusEntity(PlayerPedId())
                        end
                    end)
                    


                local holdingEntity = false
                local heldEntity = nil
                
                ZZClief:CheckBox('Modo Hulk', 'Segure e arremesse veículos com [Y]', 'ModoHulk', function(toggleState)
                    if toggleState then
                        print('Modo Hulk Ativado')
                
                        Citizen.CreateThread(function()
                            while ZZClief.toggles.ModoHulk do
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

                function Pegarcontrole()
                    Citizen.CreateThread(function()
                        local old = GetEntityCoords(PlayerPedId())
                        ZZClief.vehicle.VeiculosRequested = {}
                        for _, vehicle in pairs(GetGamePool('CVehicle')) do
                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            if driver == 0 then
                                SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                table.insert(ZZClief.vehicle.VeiculosRequested, vehicle)
                                Wait(50)
                                ClearPedTasks(PlayerPedId())
                            end
                        end
                        TaskLeaveAnyVehicle(PlayerPedId())
                        ClearPedTasks(PlayerPedId())
                        Wait(50)
                        SetEntityCoordsNoOffset(PlayerPedId(), old)
                    end)
                end
                
                ZZClief:Button('Pegar Controle dos Carros', 'Pegar Controle dos Carros Livres', function()
                    Pegarcontrole()
                end)

                    ZZClief:Button('Modo Caos Nos Carros', 'Carros livres entram no modo caos', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
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

                

                ZZClief:Button('Levitar Carros', 'Levite Todos os Carros Livres', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                    CreateThread(function()
                        -- Itera sobre todos os veículos disponíveis
                        for vehicle in ZZClief.vehicle.VeiculosRequested() do
                            -- Verifica se o veículo existe
                            if DoesEntityExist(vehicle) then
                                -- Solicita controle da entidade (veículo) na rede
                                NetworkRequestControlOfEntity(vehicle)
                
                                -- Aguarda até obter controle do veículo
                                local timeout = 2000 -- Tempo máximo de espera em milissegundos
                                while not NetworkHasControlOfEntity(vehicle) and timeout > 0 do
                                    Wait(100)
                                    timeout = timeout - 100
                                end
                
                                -- Se o controle foi obtido, aplica a força para levitar o veículo
                                if NetworkHasControlOfEntity(vehicle) then
                                    local Cordenadas = GetEntityCoords(PlayerPedId()) -- Obtém as coordenadas do jogador
                                    ApplyForceToEntity(vehicle, 3, Cordenadas.x, Cordenadas.y, Cordenadas.z + 5.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1) -- Aplica força para levitar
                                else
                                    print("Falha ao obter controle do veículo: " .. tostring(vehicle))
                                end
                            end
                        end
                    end)
                end)

            ZZClief:Button('Puxar Todos Player', 'Puxa todos Players para voce!', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                Pegar_Todos()
            end)

            ZZClief:Button('Matar Geral', 'Mata Todos em Volta (Test)', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                Matar(player)
            end)

            ZZClief:Button('Derruba Geral', 'Derrubar Todos em Volta (Test)', function() -- TÍTULO PRIMEIRO, DEPOIS SUBTÍTULO
                Derrubar(player)
            end)

                elseif ZZClief.subtabs.active == 'Skins' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                    if getsource('MQCU') or getsource('likizao_ac') then
                    ZZClief:Button('Virar Ped Normal', 'Só funciona no Santa Group e FiveGuard', function()
                        Citizen.CreateThread(function()
                            local MyModel = "mp_m_freemode_01"
                            if not HasModelLoaded(MyModel) then
                                RequestModel(MyModel)
                                while not HasModelLoaded(MyModel) do
                                    Wait(0)
                                end
                            end
                            local ped = CreatePed(0, MyModel, GetEntityCoords(PlayerPedId()) + vector3(0, 0, 300), 0, false, false)
                            SetEntityVisible(ped, false)
                            FreezeEntityPosition(ped, true)
                            ClonePedToTarget(PlayerPedId(), ped)
                            SetPlayerModel(PlayerId(), MyModel)
                            ClonePedToTarget(ped, PlayerPedId())
                            DeletePed(ped)
                            DeleteEntity(ped)
                        end)
                    end, 'right')
                end

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
                    
                        ZZClief:Button('Virar Mickey', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('mickey')
                        end, 'right')
                        
                        ZZClief:Button('Virar Zumbi', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('zombie_argonix')
                        end, 'right')
                        
                        ZZClief:Button('Virar Anão', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('anao_dylan')
                        end, 'right')
                        
                        ZZClief:Button('Virar Palhaço do McDonalds', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('ronald')
                        end, 'right')
                        
                        ZZClief:Button('Virar Hulk Policial', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('hulkpolicial')
                        end, 'right')
                        
                        ZZClief:Button('Virar Pantera Cor de Rosa', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('pinkpanther')
                        end, 'right')
                        
                        ZZClief:Button('Virar Homem de Ferro', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('ironman')
                        end, 'right')
                        
                        ZZClief:Button('Virar Homem Macaco', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('norrismacaco')
                        end, 'right')
                        
                        ZZClief:Button('Virar GGZera Menu', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_m_m_tranvest_01')
                        end, 'right')
                        
                        ZZClief:Button('Virar Neymar', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('Neymar')
                        end, 'right')
                        
                        ZZClief:Button('Virar Maromba', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('u_m_y_bab')
                        end, 'right')
                        
                        ZZClief:Button('Virar Super Herói', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('ig_mrk')
                        end, 'right')
                        
                        ZZClief:Button('Virar Macaco', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_c_chimp')
                        end, 'right')
                        
                        ZZClief:Button('Virar Porco', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_c_pig')
                        end, 'right')
                        
                        ZZClief:Button('Virar Gavião', 'Só funciona no Santa Group e FiveGuard', function()
                            MudarPed('a_c_hawk')
                        end, 'right')
                    
                    end
                    
                    if getsource('PL_PROTECT') or getsource('ThnAC') then
                        ZZClief:Button('Indisponível', 'Servidor sem suporte de [BYPASS].', function()
                            print('Indisponível')
                        end)
                    end

      end

      if ZZClief.subtabs.active == 'Props' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

        if getsource('MQCU') or getsource('likizao_ac') then
            ZZClief:Button('Spawnar Barco Gigante', 'Spawna um Barco Gigante em Voce (Lotus Group)', function()
                local function spawnBarcoGigante()
                    local ped = PlayerPedId()
                    local playerCoords = GetEntityCoords(ped)
                    local objectHash = GetHashKey("Tug")
                    local radius = 5.0
                    local numObjects = 1
        
                    if not IsModelLoaded(objectHash) then
                        RequestModel(objectHash)
                        while not HasModelLoaded(objectHash) do
                            Wait(500)
                        end
                    end
        
                    local angle = math.random() * math.pi * 2
                    local offsetX = radius * math.cos(angle)
                    local offsetY = radius * math.sin(angle)
        
                    local obj = CreateObject(objectHash, playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z, true, true, false)
        
                    SetEntityHeading(obj, math.random(0, 360))
                    FreezeEntityPosition(obj, false)
                    SetEntityVisible(obj, true, false)
        
                    SetModelAsNoLongerNeeded(objectHash)
                end
                spawnBarcoGigante()
            end)
        
            ZZClief:Button('Spawnar Submarino Gigante', 'Spawna um Submarino Gigante em Voce (Lotus Group)', function()
                local function spawnSubmarinoGigante()
                    local ped = PlayerPedId()
                    local playerCoords = GetEntityCoords(ped)
                    local objectHash = GetHashKey("kosatka")
                    local radius = 5.0
                    local numObjects = 1
        
                    if not IsModelLoaded(objectHash) then
                        RequestModel(objectHash)
                        while not HasModelLoaded(objectHash) do
                            Wait(500)
                        end
                    end
        
                    local angle = math.random() * math.pi * 2
                    local offsetX = radius * math.cos(angle)
                    local offsetY = radius * math.sin(angle)
        
                    local obj = CreateObject(objectHash, playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z, true, true, false)
        
                    SetEntityHeading(obj, math.random(0, 360))
                    FreezeEntityPosition(obj, false)
                    SetEntityVisible(obj, true, false)
        
                    SetModelAsNoLongerNeeded(objectHash)
                end
                spawnSubmarinoGigante()
            end)
        else
            if getsource('PL_PROTECT') or getsource('ThnAC') then
                ZZClief:Button('Indisponivel', 'Servidor sem suporte de [BYPASS].', function()
                    print('Indisponivel')
                end)
            end
        end
        

      end

            elseif ZZClief.tabs.active == 'Exploits' then
                ZZClief:SubTab('Exploits') --SUBTAB 1
                ZZClief:SubTab('Triggers') --SUBTAB 2
                ZZClief:SubTab('Server') --SUBTAB 2
                if ZZClief.subtabs.active == 'Exploits' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO

                
                    if getsource('space-core') or getsource('nxgroup_ilegal') or getsource('favelaskillua') then


                    ZZClief:Button('Remover modo novato', 'Você ira Remover o modo novato', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
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
         

            ZZClief:Button('Voltar modo novato', 'Você ira voltar ao modo novato', function()
                if getsource('space-core') then
                    LocalPlayer.state.games = false
                    LocalPlayer.state.pvp = false
                elseif getsource('nxgroup_ilegal') then
                    LocalPlayer.state.onlineTime = 0
                elseif getsource('favelaskillua') then
                    GlobalState.NovatTime = 100
                else
                    print('você Voltou Ao Modo Novato!')
                end
            end)
            

            

                
                if getsource('nxgroup_ilegal') then
                

                    ZZClief:Button('Deletar veiculos Prox.', 'Você ira Deletar todos veiculos proximos a 200M', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO
                        local playerPed = PlayerPedId()
                        local x, y, z = GetEntityCoords(playerPed)
                        TriggerEvent("dvarea", 500, x, y, z)
    
                    end) 
                end

                ZZClief:CheckBox('Auto Farm', 'Auto Farm', 'AutoFarm', function(state)
                    ZZClief.toggles.AutoFarm = state
                    if ZZClief.toggles.AutoFarm then
                        SmoothTeleportToYellowBlip()
                    else
                        print('Farmar Filadelfia Desativado')
                    end
                end, 'right')
                
                ZZClief:CheckBox('Auto Farm Vehicle', 'Auto Farm No Veiculo', 'AutoFarmVehicle', function(state)
                    ZZClief.toggles.AutoFarmVehicle = state
                    if ZZClief.toggles.AutoFarmVehicle then
                        TeleportInsideVehicle()
                    else
                        print('Farmar Filadelfia Desativado')
                    end
                end, 'right')

                
                

                
                
                ZZClief:Button('Remover Log de Kill', 'Limpa a log de kill do servidor', function()
                    local function cancelDamageAndGameEvents()
                        Citizen.InvokeNative(0xFA29D35D, "CEventNetworkEntityDamage")
                        Citizen.InvokeNative(0xFA29D35D, "gameEventTriggered")
                    end
                    
                    cancelDamageAndGameEvents()
                    print("Log de kill removida com sucesso!")
                end)
                
                ZZClief:Button('Parar Resource Survival', 'Para a resource Survival', function()
                    Citizen.InvokeNative(0x21783161, "Survival")
                    print("Resource Survival parada com sucesso!")
                end)
            
            elseif ZZClief.subtabs.active == 'Triggers' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

                ZZClief:Button('Comprar Celular', 'Compre um celular na loja (Santa Group).', function()
                    CreateThread(function() 
                        local params = json.decode('["functionShops",["Departament","cellphone",1,8],"inventory",-1]')
                        TriggerEvent("3h6IZRxFij7vTPQDsm2CyN", "inventory/shops:tunnel_req", table.unpack(params))
                    end)
                    print('Celular Comprado')
                end)
                
                ZZClief:Button('Reduzir Pena', 'Reduza a pena de prisão na cidade das Bahamas.', function()
                    Citizen.CreateThread(function()
                        local code = json.decode('["reducePrision",["Limpar"],"bahamas_mdt",-1,{"ev":"bahamas_mdt:tunnel_req","plv":"WU30AAEF26","rs":"bahamas_mdt","tipl":"bahamas_mdt:6"}]')
                        for iniciar = 1, 15 do
                            TriggerServerEvent("bahamas_mdt:tunnel_req", table.unpack(code))
                            Citizen.Wait(10000)
                        end
                    end)
                    print('Pena Reduzida')
                end)
                
                ZZClief:CheckBox('Minerador Bahamas', 'Ative o minerador automático nas Bahamas (Entre no Emprego Primeiro).', function()
                    ZZClief.toggles.MineradorBahamas = not ZZClief.toggles.MineradorBahamas
                    if ZZClief.toggles.MineradorBahamas then
                        CreateThread(function() 
                            local params = json.decode('["giveOre",[],"bahamas_module",0]')
                            while ZZClief.toggles.MineradorBahamas do
                                Wait(5000)
                                TriggerEvent("FAj3Ck6TyvRnNxHW1lODtQ", "minerman:tunnel_req", table.unpack(params))
                            end 
                        end)
                        print('Minerador Ativado')
                    else
                        print('Minerador Desativado')
                    end
                end, 'right')
                
  
                
                
                
                

                ZZClief:CheckBox('Farmar Filadelfia', 'Auto Farm Filadelfia', function()
                    ZZClief.toggles.FarmarFiladelfia = not ZZClief.toggles.FarmarFiladelfia
                    if ZZClief.toggles.FarmarFiladelfia then
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
                            if not ZZClief.toggles.FarmarFiladelfia then break end
                            TriggerServerEvent("routes:tunnel-req", table.unpack(code))
                            Reward = Reward + porEvento
                            local falta = math.max(total - Reward, 0)
                            print(string.format("%d de %d | farmado %d falta %d", iniciar, eventosNecessarios, Reward, falta))
                            Citizen.Wait(math.random(100, 600))
                        end
                        print("Terminou")
                    end)
                end
                
                
                ZZClief:Button('Colocar Helicoptero na Garagem (Nova Moda)', 'Adicione um helicóptero à sua garagem (Nova Moda Rj).', function()
                    TriggerServerEvent("initial:tunnel_req", "Save", {"swift2"}, "initial", 0, {["ev"]="initial:tunnel_req", ["plv"]="2R51KUIKBU", ["rs"]="initial", ["tipl"]="initial:2"})
                end)
            
                ZZClief:Button('Carros Iniciais ','Consiga os carros iniciais no (Santa Group)', function()
                    print("Sucesso: Carros Iniciais na garagem!")
                    TriggerServerEvent("login_reward:tunnel_req", "giveReward", { 1 }, "login_reward", 0)
                    TriggerServerEvent("login_reward:tunnel_req", "giveReward", { 2 }, "login_reward", 0)
                    TriggerServerEvent("login_reward:tunnel_req", "giveReward", { 3 }, "login_reward", 0)
                end)
                
                ZZClief:Button('Polvora Alto Astral','Entrar na França Primeiro', function()
                    CreateThread(function() 
                        local params = json.decode('["paymentCollect",[],"mirtin_craft_v2",1]')
                        while true do
                            Wait(30 * 1000)
                            TriggerEvent("6zJc4K3UQCtbVEH7Gi5Pw1", "mirtin_craft_v2:tunnel_req", table.unpack(params))
                        end 
                    end)
                    print("Sucesso", "ZZClief-sucess", "Puxando Polvora!", 255, 255, 255)
                end)
                
                
                
                ZZClief:Button('Puxar Dinheiro Utopia','Entrar Primeiro no Taxista!', function()
                    Citizen.CreateThread(function()
                        local code = json.decode('["givePaymentTaxista",["NDE3OjIzNDUA"],"dope_empregos",-1,{"ev":"dope_empregos:tunnel_req","plv":"4DVGNYOECO","rs":"dope_empregos","tipl":"dope_empregos:14"}]')
                        for iniciar = 1, 900000 do
                            TriggerServerEvent("dope_empregos:tunnel_req", table.unpack(code))
                            Citizen.Wait(50)
                        end
                    end)
                    print("Sucesso", "ZZClief-sucess", "Puxando Dinheiro!", 255, 255, 255)
                    print("Erro", "ZZClief-error", "Entre no Emprego Taxista Primeiro", 255, 255, 255)
                end)
                
            end

        elseif ZZClief.subtabs.active == 'Server' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO
        
            

            elseif ZZClief.tabs.active == 'Config' then
                ZZClief:SubTab('Config') --SUBTAB 1
                ZZClief:SubTab('Auxilios') --SUBTAB 2

                if ZZClief.subtabs.active == 'Config' then -- SE O SUBTAB 1 JOGADOR ESTIVER ATIVO ENTAO


                ZZClief:CheckBox('Otimizar GAME', 'Irá otimizar seu jogo.', 'ExCheckBoxBool', function() -- SEMPRE USAR ESSA LÓGICA, TITULO PRIMEIRO DEPOIS SUBTITULO E DEPOIS COLOCAR NO NOME DA CheckBox
                    --EXEMPLO DE USO DA CheckBox

                    if ZZClief.toggles.ExCheckBoxBool then --SE A CheckBox ESTIVER ATIVA (TRUE) ENTAO
                        SetTimecycleModifier("cinema")
                    else --SE ESTIVER INATIVA (FALSE)
                        SetTimecycleModifier("default")

                    end
                end)

                

                    
                elseif ZZClief.subtabs.active == 'Auxilios' then -- SE O SUBTAB 2 JOGADOR ESTIVER ATIVO ENTAO

     
                    ZZClief:CheckBox('Esp Nomes', 'Desenha o nome dos jogadores abaixo deles', 'TogglePlayerNames', function(toggleState)
                        local function DrawPlayerNames()
                            for _, player in ipairs(GetActivePlayers()) do
                                local playerPed = GetPlayerPed(player)
                                local playerCoords = GetEntityCoords(playerPed)
                                local playerName = GetPlayerName(player)
                    
                                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(playerCoords.x, playerCoords.y, playerCoords.z)
                                if onScreen then
                                    SetTextFont(0)
                                    SetTextProportional(1)
                                    SetTextScale(0.0, 0.5)
                                    SetTextColour(255, 255, 255, 255)
                                    SetTextDropshadow(0, 0, 0, 0, 255)
                                    SetTextEdge(2, 0, 0, 0, 150)
                                    SetTextDropShadow()
                                    SetTextOutline()
                                    SetTextEntry("STRING")
                                    AddTextComponentString(playerName)
                                    DrawText(screenX, screenY)
                                end
                            end
                        end
                    
                        if toggleState then
                            Citizen.CreateThread(function()
                                while toggleState do
                                    DrawPlayerNames()
                                    Citizen.Wait(0)
                                end
                            end)
                        end
                    end)
                    
                    
                end
            end

        end
        Citizen.Wait(0)
    end
end)

----------------Jogador--------------------

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
    
    
    function camDirect()
    local camRot = GetGameplayCamRot(2) 
    local camX = math.sin(math.rad(camRot.z)) * -1.0
    local camY = math.cos(math.rad(camRot.z))
    local camZ = math.sin(math.rad(camRot.x))
    return camX, camY, camZ
    end
    
    
    local isNoclipEnabled = false 
    local isNoclipActive = false   
    local noclipKey = 137  
    
    
    Citizen.CreateThread(function()
    while true do
        if isNoclipEnabled then  
            if IsControlPressed(0, noclipKey) then  
                isNoclipActive = true
            else
                isNoclipActive = false
            end
    
            if isNoclipActive then
                local ttspeed = 1.0  
                local speed = ttspeed
                local player = PlayerPedId()
                local vehicleCheck = IsPedInAnyVehicle(player, false)
                local camRot = GetGameplayCamRot(2)
                local entity = vehicleCheck and GetVehiclePedIsIn(player, false) or player
                local Camerax, Cameray, Cameraz = camDirect()
                local x, y, z = table.unpack(GetEntityCoords(entity, true))
    
                
                if IsDisabledControlPressed(0, 32) then  
                    x = x + speed * Camerax
                    y = y + speed * Cameray
                    z = z + speed * Cameraz
                elseif IsDisabledControlPressed(0, 269) then  
                    x = x - speed * Camerax
                    y = y - speed * Cameray
                    z = z - speed * Cameraz
                end
    
                
                SetEntityRotation(entity, camRot.x, camRot.y, camRot.z, 2, true)
                SetEntityCoordsNoOffset(entity, x, y, z, true, true, true)
    
                
                DisableControlAction(0, 30, true)  
                DisableControlAction(0, 31, true)  
                DisableControlAction(0, 44, true)  
                DisableControlAction(0, 23, true)  
                SetEntityVelocity(entity, 0.0, 0.0, 0.0)
            end
        else
            isNoclipActive = false  
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

----------------Armas--------------------

dadadwdasdabp = function(weapon)
    GiveDelayedWeaponToPed(PlayerPedId(), weapon, 51, false, false)
end

spawnweapon = function(weaponhash)
    dadadwdasdabp(weaponhash)
end

----------------Trolls--------------------



----------------Veiculo--------------------

MatarPlayer = function(vehicle, ped)
    if vehicle and ped then
        local playerPed = GetPlayerPed(ped)
        local cordenadas = GetEntityCoords(playerPed)
        
        
        local upCoords = vector3(cordenadas.x, cordenadas.y, cordenadas.z + 50.0)
        SetEntityCoordsNoOffset(playerPed, upCoords.x, upCoords.y, upCoords.z, true, true, true)

        
        NetworkRequestControlOfEntity(vehicle)

        
        SetEntityCoordsNoOffset(vehicle, cordenadas.x, cordenadas.y, cordenadas.z + 50.0, true, true, true)

        
        Citizen.CreateThread(function()
            Citizen.Wait(1000) 

            
            local velocity = vector3(0.0, 0.0, -1.0) 
            SetEntityCoordsNoOffset(vehicle, cordenadas.x, cordenadas.y, cordenadas.z, true, true, true)

            
            ApplyForceToEntity(vehicle, 1, velocity.x, velocity.y, velocity.z, 0.0, 0.0, 0.0, true, true, true, true)

            
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

    function Pegarcontrole()
        Citizen.CreateThread(function()
            
            if ZZClief.vehicle == nil then
                ZZClief.vehicle = {}
            end
    
            
            if ZZClief.vehicle.VeiculosRequested == nil then
                ZZClief.vehicle.VeiculosRequested = {}
            end
    
            local old = GetEntityCoords(PlayerPedId())
            ZZClief.vehicle.VeiculosRequested = {} 
    
            for _, vehicle in pairs(GetGamePool('CVehicle')) do
                local driver = GetPedInVehicleSeat(vehicle, -1)
                if driver == 0 then
                    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    table.insert(ZZClief.vehicle.VeiculosRequested, vehicle)
                    Wait(50)
                    ClearPedTasks(PlayerPedId())
                end
            end
    
            TaskLeaveAnyVehicle(PlayerPedId())
            ClearPedTasks(PlayerPedId())
            Wait(50)
            SetEntityCoordsNoOffset(PlayerPedId(), old)
        end)
    end
    



-------------------------------------------------------------------------------------------------------------------------------------------------

function Copy_PED()
    Citizen.CreateThread(function()
    local pedSelecionado = GetPlayerPed(ZZClief.SelectedPlayer)
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
    local targe = GetPlayerPe(ZZClief.SelectedPlayer)
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
            "jetmax",
            "rhino",
            "tug",
            "kosatka"
        }

        for _, prop in ipairs(props) do
            local obj = CreateObjectNoOffset(GetHashKey(prop), coords.x - 0.6, coords.y - 1, coords.z - 1, 1, 1, 1)
            FreezeEntityPosition(obj, true)
        end
    end
end

Explodir = function(kse,ped)
    local vehicle = 'tribike'
    RequestModel(vehicle)
    local Cordenadas = GetEntityCoords(GetPlayerPed(ped))
    local veh2 = CreateVehicle((vehicle), Cordenadas.x, Cordenadas.y, Cordenadas.z , 1, 1, 1)
    SetEntityVisible(veh2, patobenlindo)
    Cordenadas2 = GetEntityCoords(veh2)
    AddExplosion(Cordenadas2.x, Cordenadas2.y, Cordenadas2.z, kse, 90+0.0, true, false, 1.0)
    DeleteEntity(veh2)
end


Derrubar = function(ped)
    local vehicle = 'tribike'
    RequestModel(vehicle)
    local Cordenadas = GetEntityCoords(GetPlayerPed(ped))
    local veh2 = CreateVehicle((vehicle), Cordenadas.x, Cordenadas.y, Cordenadas.z , 1, 1, 1)
    SetEntityVisible(veh2, patobenlindo)
    Cordenadas2 = GetEntityCoords(veh2)
    AddExplosion(Cordenadas2.x, Cordenadas2.y, Cordenadas2.z, 13, 300.0, false, true, false)
    AddExplosion(Cordenadas2.x, Cordenadas2.y, Cordenadas2.z, 11, 300.0, false, true, false)
    DeleteEntity(veh2)
end

Matar = function(ped)
    local vehicle = 'tribike'
    RequestModel(vehicle)
    local Cordenadas = GetEntityCoords(GetPlayerPed(ped))
    local veh2 = CreateVehicle((vehicle), Cordenadas.x, Cordenadas.y, Cordenadas.z , 1, 1, 1)
    SetEntityVisible(veh2, patobenlindo)
    Cordenadas2 = GetEntityCoords(veh2)
    AddExplosion(Cordenadas2.x, Cordenadas2.y, Cordenadas2.z, 14, 1200.0, false, true, false)
    DeleteEntity(veh2)
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


function drawESP()
    local players = GetActivePlayers()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)

            if distance < 100.0 then
                local playerName = GetPlayerName(player)
                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(targetCoords.x, targetCoords.y, targetCoords.z - 0.7)

                local vehicle = GetVehiclePedIsIn(targetPed, false)
                local speed = 0

                if vehicle == 0 then
                    local velocity = GetEntityVelocity(targetPed)
                    speed = math.sqrt(velocity.x^2 + velocity.y^2 + velocity.z^2)
                else
                    speed = 0
                end

                local color = {255, 255, 255, 255}
                if speed > 5.0 then
                    color = {255, 0, 0, 255}
                end

                if onScreen then
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

                    DrawBoxBorders(targetCoords.x, targetCoords.y, targetCoords.z, 0.4, 1.5, color)
                end
            end
        end
    end
end

function armitanamaozita()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10) 
            local playerPed = PlayerPedId()
            local weapon = GetSelectedPedWeapon(playerPed) 
            SetCurrentPedWeapon(playerPed, weapon, true) 
        end
    end)
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





function molotivisk()
    local playerPed = PlayerPedId()
    if ZZClief.SelectedPlayer then
        local targetPed = GetPlayerPed(ZZClief.SelectedPlayer)
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
                        local maxDistance = 500.0  
                    
                        
                        for _, player in ipairs(GetActivePlayers()) do
                            local targetPed = GetPlayerPed(player)
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(coords - targetCoords)
                    
                            if distance <= maxDistance and player ~= PlayerId() then
                                table.insert(players, GetPlayerServerId(player))
                            end
                        end
                    
                        
                        for _ = 1, 28 do
                            
                            for _, targetServerId in ipairs(players) do
                                TriggerServerEvent("dk_animations/startAnim", targetServerId, 404, 1, {["source"]="adult", ["target"]="adult"})
                                Wait(0)  
                            end
                    
                            
                            local playerPed = PlayerPedId()
                            ClearPedTasksImmediately(playerPed)
                        end
                     end)
    end


    function SetVida()
        CreateThread(function()
            local noclippValue = ZZClief.sliders.Noclipp + 0.0
            tvRP.setHealth(noclippValue)
            print('Sucesso')
        end)
    end
    


    if SuperSocoSpace then
            SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 14.9)
        else
            SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 0.0)
        end
