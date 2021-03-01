
ESX = nil
local item_modeli = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('NEON', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "NEON"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)

ESX.RegisterUsableItem('BALLER2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "BALLER2"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)

ESX.RegisterUsableItem('ELEGYX', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "ELEGYX"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)


ESX.RegisterUsableItem('TEMPESTA', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "TEMPESTA"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)


ESX.RegisterUsableItem('SULTAN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "SULTAN"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)


ESX.RegisterUsableItem('SULTANRS', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "SULTANRS"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)


ESX.RegisterUsableItem('ZENTORNO', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item_modeli = "ZENTORNO"
    TriggerClientEvent('sy-item-car:araba-spawn', source, item_modeli)
end)

