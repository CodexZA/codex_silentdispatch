RegisterNetEvent("qb-dc:receiveMessage", function(senderName, message)
    local text = ("^3[Dispatch Comms]^0 [%s]: %s"):format(senderName, message)
    TriggerEvent("chat:addMessage", {
        color = { 0, 153, 255 },
        multiline = false,
        args = { text }
    })

    -- Optional notify popup
    TriggerEvent('QBCore:Notify', 'Dispatch Comms: ' .. message, 'primary')
end)
