local original_speed_up_grenade_cooldown = PlayerManager.speed_up_grenade_cooldown
function PlayerManager:speed_up_grenade_cooldown(...)
	local equipped = managers.blackmarket:equipped_grenade()
	if equipped == "smoke_screen_grenade" or equipped == "pocket_ecm_jammer" or equipped == "chico_injector" then
		return
	end

	return original_speed_up_grenade_cooldown(self, ...)
end