local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("dc", function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local job = Player.PlayerData.job
    if not job or job.name ~= "police" then
        TriggerClientEvent('QBCore:Notify', src, "You are not police.", "error")
        return
    end

    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('QBCore:Notify', src, "Usage: /dc [message]", "error")
        return
    end

    -- Send to all police
    for _, v in pairs(QBCore.Functions.GetPlayers()) do
        local target = QBCore.Functions.GetPlayer(v)
        if target and target.PlayerData.job.name == "police" then
            TriggerClientEvent("qb-dc:receiveMessage", v, GetPlayerName(src), message)
        end
    end
end)
