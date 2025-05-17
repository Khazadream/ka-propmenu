QBCore = exports['qb-core']:GetCoreObject()

local itemName = 'testplaceable' -- change this to the item name you want to use

QBCore.Commands.Add('proplist_menu', 'Open Prop Menu', {}, false, function(source, args)
    TriggerClientEvent('ka-propmenu:client:OpenPropMenu', source)
end, 'god')

QBCore.Commands.Add('propcatlist_menu', 'Open Prop Menu', {}, false, function(source, args)
    TriggerClientEvent('ka-propmenu:client:OpenPropMenu2', source)
end, 'god')

RegisterNetEvent('ka-propmenu:server:BuyProp', function(model, price, label)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if exports.ox_inventory:RemoveItem(src, 'money', price) then
        if exports.ox_inventory:AddItem(src, itemName, 1, {label = label, propName = model}) then
            TriggerClientEvent('QBCore:Notify', src, 'Vous avez acheté un accessoire: ' .. label .. '.', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Vous n\'avez pas assez d\'espace dans votre inventaire.', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Vous n\'avez pas assez d\'argent pour acheter cet accessoire.', 'error')
    end

    TriggerClientEvent('ka-propmenu:client:ClosePropMenu', src)
end)