QBCore = exports['qb-core']:GetCoreObject()

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
        if exports.ox_inventory:AddItem(src, 'testplaceable', 1, {label = label, propName = model}) then
            TriggerClientEvent('QBCore:Notify', src, 'You have bought a ' .. label .. ' prop.', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You do not have enough space in your inventory.', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough money to buy this prop.', 'error')
    end

    TriggerClientEvent('ka-propmenu:client:ClosePropMenu', src)
end)