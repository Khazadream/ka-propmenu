menu2 = MenuV:CreateMenu(Config.MenuTitle, Config.MenuDescription, Config.MenuLocation, Config.MenutColorR, Config.MenutColorG, Config.MenutColorB, Config.MenuSize, Config.MenuFont, 'menuv', Config.MenuNamespace2)
local subMenu = {}

-- Create menu items for each prop
for key, prop in pairs(Config.Props2) do
    local menuItem2 = menu2:AddButton({
        icon = Config.MenuItemIcon,
        label = key,
        value = prop,
        description = Config.MenuItemDescription2 .. key
    })

    subMenu[key] = MenuV:CreateMenu(key, "Catégorie : " .. key, Config.MenuLocation, Config.MenutColorR, Config.MenutColorG, Config.MenutColorB, Config.MenuSize, Config.MenuFont, 'menuv', 'subMenu_' .. key)

    -- Place prop when selecting menu item
    menuItem2:On('select', function()
        subMenu[key]:Open()
    end)

    for _, propp in pairs(prop) do
        local subMenuItem = subMenu[key]:AddButton({
            icon = Config.MenuItemIcon,
            label = propp.label .. ' - $' .. propp.price,
            value = propp,
            description = Config.MenuItemDescription .. propp.label
        })
    
        -- Preview prop when hovering over menu item
        subMenuItem:On('enter', function()
            PreviewProp(propp.model)
        end)
    
        -- Place prop when selecting menu item
        subMenuItem:On('select', function()
            TriggerServerEvent('ka-propmenu:server:BuyProp', propp.model, propp.price, propp.label)
        end)
    end

    -- Visualize the first prop when opening the menu
    subMenu[key]:On('open', function()
        PreviewProp(prop[1].model)
    end)
    
    -- Cleanup preview prop when closing menu
    subMenu[key]:On('close', function()
        if previewProp then
            DeleteObject(previewProp)
            previewProp = nil
        end
    end)

end

RegisterNetEvent('ka-propmenu:client:OpenPropMenu2', function()
    menu2:Open()
end)


