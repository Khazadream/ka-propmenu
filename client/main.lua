local QBCore = exports['qb-core']:GetCoreObject()
local ped = nil
local menu = MenuV:CreateMenu(Config.MenuTitle, Config.MenuDescription, Config.MenuLocation, Config.MenutColorR, Config.MenutColorG, Config.MenutColorB, Config.MenuSize, Config.MenuFont, 'menuv', Config.MenuNamespace)
--local menu = MenuV:CreateMenu('Prop Visualizer', 'View and Place Props', 'topright', 255, 0, 0, 'size-125', 'default', 'menuv', 'example_namespace')
previewProp = nil

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

    -- Get player position
    local playerPed = PlayerPedId()
    --local coords = GetEntityCoords(playerPed)
    
    -- Spawn the preview prop in front of the player
    -- local forward = GetEntityForwardVector(playerPed)
    -- local spawnPos = vector3(
    --     coords.x + (forward.x * 2),
    --     coords.y + (forward.y * 2),
    --     coords.z
    -- )
    local spawnPos = vector3(2770.48, 3497.06, 55.24)

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
        TriggerServerEvent('ka-propmenu:server:BuyProp', prop.model, prop.price, prop.label)
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

local function SpawnPed()
    local coords = Config.PedLocation
    local model = Config.PedModel
    
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, false)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetModelAsNoLongerNeeded(model)

    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
            type = "client",
            icon = Config.TargetIcon,
            label = Config.TargetLabel,
            action = function()
                menu2:Open()
            end
            },
    },
        distance = Config.TargetDistance
    })

end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    SpawnPed()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        SpawnPed()
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
    end
    
end)

RegisterNetEvent('ka-propmenu:client:ClosePropMenu', function()
    menu:Close()
end)

RegisterNetEvent('ka-propmenu:client:OpenPropMenu', function()
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

