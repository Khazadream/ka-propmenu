local QBCore = exports['qb-core']:GetCoreObject()

local ped = {}
local menu = MenuV:CreateMenu(Config.MenuTitle, Config.MenuDescription, Config.MenuLocation, Config.MenutColorR, Config.MenutColorG, Config.MenutColorB, Config.MenuSize, Config.MenuFont, 'menuv', Config.MenuNamespace)

previewProp = nil
actualShop = nil

-- Function to preview prop
function PreviewProp(model)
    -- Delete existing preview prop if there is one
    if previewProp then
        DeleteObject(previewProp)
        DeleteEntity(previewProp)
        previewProp = nil
    end

    -- Load the model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local spawnPos = nil
    if actualShop == nil then
        -- Get player position
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        -- Spawn the preview prop in front of the player
        local forward = GetEntityForwardVector(playerPed)
        spawnPos = vector3(
            coords.x + (forward.x * 2),
            coords.y + (forward.y * 2),
            coords.z
        )
    else
        spawnPos = Config.Shops[actualShop].previewCoords
    end

    previewProp = CreateObject(model, spawnPos.x, spawnPos.y, spawnPos.z, true, false, false)
    SetModelAsNoLongerNeeded(model)
    
    -- Make the preview prop semi-transparent and non-colliding
    -- SetEntityAlpha(previewProp, 200, false)

    SetEntityCollision(previewProp, false, false)
    FreezeEntityPosition(previewProp, true)
end

-- Create menu items for each prop
for _, prop in ipairs(Config.Props) do
    local menuItem = menu:AddButton({
        icon = Config.MenuItemIcon,
        label = prop.label .. ' - $' .. prop.price,
        value = prop,
        description = Config.MenuItemDescription .. prop.label
    })

    -- Preview prop when hovering over menu item
    menuItem:On('enter', function()
        PreviewProp(prop.model)
    end)

    -- Place prop when selecting menu item
    menuItem:On('select', function()
        local shopNumber = actualShop
        TriggerServerEvent('ka-propmenu:server:BuyProp', prop.model, prop.price, prop.label, shopNumber)
    end)
end

-- Visualize the first prop when opening the menu
menu:On('open', function()
    PreviewProp(Config.Props[1].model)
end)

-- Cleanup preview prop when closing menu
menu:On('close', function()
    if previewProp then
        DeleteObject(previewProp)
        previewProp = nil
    end
end)

local function SpawnPed(coords, model, targetLabel, targetIcon, targetDistance, shopNumber)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    ped[shopNumber] = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, false)
    SetEntityAsMissionEntity(ped[shopNumber], true, true)
    SetBlockingOfNonTemporaryEvents(ped[shopNumber], true)
    SetPedDiesWhenInjured(ped[shopNumber], false)
    SetPedCanPlayAmbientAnims(ped[shopNumber], true)
    SetPedCanRagdollFromPlayerImpact(ped[shopNumber], false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetModelAsNoLongerNeeded(model)

    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
            type = "client",
            icon = targetIcon,
            label = targetLabel,
            action = function()
                actualShop = shopNumber
                menu2:Open()
            end
            },
    },
        distance = targetDistance
    })
end

local function initPedAndTarget()
    for k, v in pairs(Config.Shops) do
        SpawnPed(v.coords, v.model, v.targetLabel, v.targetIcon, v.targetDistance, k)
    end
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    initPedAndTarget()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        initPedAndTarget()
    end
end)

AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    if previewProp then
        DeleteObject(previewProp)
        previewProp = nil
    end
    if ped then
        DeleteEntity(ped)
        ped = nil
    end
    menu:ClearItems()
    menu2:ClearItems()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if previewProp then
            DeleteObject(previewProp)
            previewProp = nil
        end
        if ped then
            DeleteEntity(ped)
            ped = nil
        end
        menu:ClearItems()
        menu2:ClearItems()
    end
    
end)

RegisterNetEvent('ka-propmenu:client:ClosePropMenu', function()
    actualShop = nil
    menu:Close()
end)

RegisterNetEvent('ka-propmenu:client:OpenPropMenu', function()
    actualShop = nil
    menu:Open()
end)

-- Create thread for preview prop rotation
CreateThread(function()
    while true do
        Wait(0)
        if previewProp then
            -- Rotate preview prop with arrow keys
            if IsControlPressed(0, 174) then -- Left Arrow
                SetEntityRotation(previewProp, 0.0, 0.0, GetEntityRotation(previewProp).z + 1.0, 2, true)
            elseif IsControlPressed(0, 175) then -- Right Arrow
                SetEntityRotation(previewProp, 0.0, 0.0, GetEntityRotation(previewProp).z - 1.0, 2, true)
            end
        end
    end
end)

