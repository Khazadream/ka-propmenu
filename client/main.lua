local QBCore = exports['qb-core']:GetCoreObject()

local menu = MenuV:CreateMenu('Prop Visualizer', 'View and Place Props', 'topright', 255, 0, 0, 'size-125', 'default', 'menuv', 'example_namespace')
local props = {
    {label = 'Cardboard Box', model = 'prop_boxpile_07d', price = 100},
    {label = 'Traffic Cone', model = 'prop_roadcone02a', price = 200},
    {label = 'Barrier', model = 'prop_barrier_work05', price = 300},
    {label = 'Chair', model = 'prop_chair_01a', price = 400},
    {label = 'Table', model = 'prop_table_03', price = 500},
    -- Add more props as needed
}

local previewProp = nil

-- Function to preview prop
local function PreviewProp(model)
    -- Delete existing preview prop if there is one
    if previewProp then
        DeleteObject(previewProp)
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

-- Function to place prop permanently
-- local function PlaceProp()
--     if previewProp then
--         -- Get the preview prop's position and rotation
--         local pos = GetEntityCoords(previewProp)
--         local rot = GetEntityRotation(previewProp)
--         local model = GetEntityModel(previewProp)
        
--         -- Delete preview prop
--         DeleteObject(previewProp)
        
--         -- Create permanent prop
--         local permanentProp = CreateObject(model, pos.x, pos.y, pos.z, true, false, false)
--         SetEntityRotation(permanentProp, rot.x, rot.y, rot.z, 2, true)
--         FreezeEntityPosition(permanentProp, true)
--         SetEntityCollision(permanentProp, true, true)
        
--         previewProp = nil
--     end
-- end

-- Create menu items for each prop
for _, prop in ipairs(props) do
    local menuItem = menu:AddButton({
        icon = '🗿',
        label = prop.label .. ' - $' .. prop.price,
        value = prop,
        description = 'Press ENTER to buy ' .. prop.label
    })

    -- Preview prop when hovering over menu item
    menuItem:On('enter', function()
        PreviewProp(prop.model)
    end)

    -- Place prop when selecting menu item
    menuItem:On('select', function()
        -- PlaceProp()
        --TODO: Give the player the prop item corresponding to the prop they selected
    end)

end

-- Visualize the first prop when opening the menu
menu:On('open', function()
    PreviewProp(props[1].model)
end)

-- Cleanup preview prop when closing menu
menu:On('close', function()
    if previewProp then
        DeleteObject(previewProp)
        previewProp = nil
    end
end)

-- Register command to open menu
RegisterCommand('propsmenu', function()
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

