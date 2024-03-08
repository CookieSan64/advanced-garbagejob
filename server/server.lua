ESX = exports["es_extended"]:getSharedObject()

-- Server event for payment
RegisterNetEvent('advanced-garbagejob:Payment')
AddEventHandler('advanced-garbagejob:Payment', function(level)
    local xPlayer = ESX.GetPlayerFromId(source)
    local amount

    if level == 1 then
        amount = Config.LevelOneAmount
    elseif level == 2 then
        amount = Config.LevelTwoAmount
    else
        amount = Config.LevelMaxAmount
    end

    if Config.PaymentInCash == true then
        xPlayer.addMoney(amount)
    else
        xPlayer.addAccountMoney('bank', amount)
    end
    TriggerClientEvent('esx:showNotification', source, "Vous avez était payé ~g~$"..amount)
end)