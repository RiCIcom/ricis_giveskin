ESX = exports["es_extended"]:getSharedObject()

if Config.Webhook and Config.Webhooklink == "DEIN_WEBHOOK_LINK_HIER" then
     print('Es wurde Webhook auf true gesetzt, aber kein Link hinterlegt, bitte füge einen Link ein, oder stelle es auf false.')
end

ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('giveskin', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])

    if targetId then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            TriggerClientEvent('esx_skin:openSaveableMenu', targetId)
            TriggerClientEvent('chat:addMessage', source, { args = { '^2Erfolg:', 'Skin-Menü wurde erfolgreich geöffnet.' } })
        else
            TriggerClientEvent('chat:addMessage', source, { args = { '^1Fehler:', 'Ungültige Spieler-ID.' } })
        end
    else
        TriggerClientEvent('chat:addMessage', source, { args = { '^1Fehler:', 'Du musst eine gültige Spieler-ID angeben.' } })
    end
end, false)

function sendWebhook(adminName, adminId, targetName, targetId)
    local discordInfo = {
        {
            ["color"] = 3447003,
            ["title"] = "Skinmenü vergeben:",
            ["description"] = adminName .. "[" .. adminId .. "] hat " .. targetName .. "[" .. targetId .. "] das Skin Menü vergeben",
            ["footer"] = {
                ["text"] = Config.footer,
            },
        }
    }
    
    PerformHttpRequest(Config.Webhooklink, function(err, text, headers) end, 'POST', json.encode({username = Config.Servername, embeds = discordInfo}), { ['Content-Type'] = 'application/json' })
end
