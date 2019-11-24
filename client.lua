Citizen.CreateThread(function()


RequestIpl("vw_casino_penthouse")
RequestIpl("vw_casino_main")
	interiorID = GetInteriorAtCoords(1100.00000000,220.00000000,-50.00000000)
	if IsValidInterior(interiorID) then
	EnableInteriorProp(interiorID, "0x30240D11")
	EnableInteriorProp(interiorID, "0xA3C89BB2")
	
		RefreshInterior(interiorID)
	end
	interiorID = GetInteriorAtCoords(976.63640000,70.294760000,115.16410000)
	if IsValidInterior(interiorID) then
	EnableInteriorProp(interiorID, "teste1")
	EnableInteriorProp(interiorID, "teste2")
	EnableInteriorProp(interiorID, "teste3")
	EnableInteriorProp(interiorID, "teste4")
	--EnableInteriorProp(interiorID, "teste5") --''portas fechadas""
	
	-- EnableInteriorProp(interiorID, "teste6") --''portas fechadas""
	
	-- EnableInteriorProp(interiorID, "teste7")--''portas fechadas""
	
	
-- PATTERN 1 até o 9

	EnableInteriorProp(interiorID, "teste11")  --"pattern_07"
-- ARCADES - PROPS - BALOONS

	EnableInteriorProp(interiorID, "teste17") --"arcade"
	EnableInteriorProp(interiorID, "teste18") --"arcade"
	EnableInteriorProp(interiorID, "teste19") --"bagunça"
	EnableInteriorProp(interiorID, "teste20") --"bagunça"
	EnableInteriorProp(interiorID, "teste21") --"bagunça"
--BLOCKERS

	-- EnableInteriorProp(interiorID, "teste22")"pent_lounge_blocker"
	-- EnableInteriorProp(interiorID, "teste23")"pent_guest_blocker"
	-- EnableInteriorProp(interiorID, "teste24")"pent_office_blocker"
	-- EnableInteriorProp(interiorID, "teste25")"pent_cine_blocker"
	-- EnableInteriorProp(interiorID, "teste26")"pent_spa_blocker"
	-- EnableInteriorProp(interiorID, "teste27")"pent_bar_blocker"
	
	--EnableInteriorProp(interiorID, "teste28") --"prop_beer_bottle ---- lixo????w"
	EnableInteriorProp(interiorID, "teste29") --"bebidas no bar"
	--EnableInteriorProp(interiorID, "teste30") --"pent_baloons" azul e branco
	--EnableInteriorProp(interiorID, "teste31") --"leds bar"
	EnableInteriorProp(interiorID, "teste32") --"pent_baloons_col"
	EnableInteriorProp(interiorID, "teste33") --"baloons_col001"
	EnableInteriorProp(interiorID, "teste34") --"baloons" vermelho e preto
	--EnableInteriorProp(interiorID, "teste35") --"baloons" preto e amarelo
	

	SetInteriorPropColor(interiorID, "teste1", 3)
	SetInteriorPropColor(interiorID, "teste2", 3)
	SetInteriorPropColor(interiorID, "teste4", 3)
	SetInteriorPropColor(interiorID, "teste11", 3)
	
	
	RefreshInterior(interiorID)
	end

end)


key_to_teleport = 38

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]
    {{925.0, 47.0, 80.00, 0}, {1090.00, 207.00, -49.9, 358},{36,237,157}, "Cassino Diamond"}, -- Outside the Sheriff's Station
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end