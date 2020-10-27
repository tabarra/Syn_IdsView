local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

TriggerClientEvent('chat:addSuggestion', '/printids', 'Command to get user identifers', {
    { name="ID", help="Get UID Identifiers" }
})


RegisterCommand('printids',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local steamid  = false
    local license  = false
    local discord  = false
    for k,v in pairs(GetPlayerIdentifiers(args[1]))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
            if vRP.hasPermission(user_id,"YOUR_PERMISSION_HERE") then 
                if discord == false then 
                    discord = "DISCORD ISN'T OPENED"
                    if steamid == false then 
                        steamid = 'STEAM NOT OPENED'
                        if args[1] then 
                            TriggerClientEvent('chat:addMessage', {color = { 255, 0, 0},multiline = true,args = {"Me", "Those are the following identifiers of the ID:"..args[1].."\n"..discord.."\n"..steamid.."\n"..license}})
                        end
                    end
                end
            end
        end
    end
end)
