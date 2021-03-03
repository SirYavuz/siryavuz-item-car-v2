ESX  = nil
local aracmodel = nil
local listekontrol = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  end
end)

local araclistesi = {
	['ZENTORNO'] = {durum = "true"},
	['BALLER2'] = {durum = "true"},
	['NEON'] = {durum = "true"},
	['TEMPESTA'] = {durum = "false"},
	['SULTAN'] = {durum = "false"},
	['SULTANRS'] = {durum = "true"},
	['T20'] = {durum = "true"}
}



RegisterCommand('aracal', function()
    TriggerEvent('arac-cek')
end)


RegisterNetEvent('arac-cek')
AddEventHandler('arac-cek', function()
  
   
	local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0


	while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
		Citizen.Wait(100)
		NetworkRequestControlOfEntity(vehicle)
		attempt = attempt + 1
	end

    if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
        aracmodel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        -- print('Çekilen araç model : ' ..aracmodel)
        TriggerEvent('notification', 'Alınan araç modeli :  ['..aracmodel..']', 1)

        listekontrol = araclistesi[aracmodel].durum
        print('yeni : ' ..listekontrol)
        if listekontrol == "true" then
        animasyon()
        -- Citizen.Wait(2000)
		TriggerEvent("mythic_progressbar:client:progress", {
        name = "cekiliyor",
        duration = 3500,
        label = "Araç Alınıyor",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        },
		}, function(status)
			if not status then
                ESX.Game.DeleteVehicle(vehicle)
                TriggerServerEvent('sy-core:esya:ekle', 1, aracmodel)
			end
	    end)
 else 
    TriggerEvent('notification', 'Bu aracı çekemezsin', 2)
    end

    end
end)

function animasyon()
    local playerPed = GetPlayerPed(-1)
    if not IsEntityPlayingAnim(playerPed, 'random@domestic', 'pickup_low', 3) then
        ESX.Streaming.RequestAnimDict('random@domestic', function()
            TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, -1, 48, 0, 0, 0, 0)
        end)
    end
end


  RegisterNetEvent('sy-item-car:araba-spawn')
  AddEventHandler('sy-item-car:araba-spawn', function(item_modeli)
    local coords    = GetOffsetFromEntityInWorldCoords(PlayerPedId())
    local heading = GetEntityHeading(playerPed)
    local playerPed = PlayerPedId()
        animasyon()
        TriggerEvent("mythic_progressbar:client:progress", {
            name = "aracspawn",
            duration = 3500,
            label = "Araç Çıkartılıyor",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            },
            }, function(status)
                if not status then
                    ESX.Game.SpawnVehicle(item_modeli, coords, heading, function(vehicle)
                        TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                        SetVehicleNumberPlateText(vehicle, 'SirYavuz') 
                        local miktar = 1
                        local esya = item_modeli
                        TriggerEvent('notification', 'Çıkartılan araç : ['..item_modeli..']', 1)
                        TriggerServerEvent('sy-core:esya:sil', miktar, esya)
                    end)
                end
            end)
       
  end)

  
