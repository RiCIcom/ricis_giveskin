RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function()
    OpenSkinMenu()
end)

function OpenSkinMenu()
    TriggerEvent('esx_skin:openMenu')
end