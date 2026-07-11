local preserved_skills = {
	-- mastermind
		-- medic
			tea_cookies = true, -- uppers
			medic_2x = true, -- combat doctor
		-- controller
			triathlete = {[1]=true}, -- forced friendship
			stockholm_syndrome = true,
	-- enforcer
		-- tank
			pack_mule = {[1]=true}, -- transporter
		-- ammo specialist
			portable_saw = {[1]=true},
			ammo_2x = true, -- extra lead
			bandoliers = {[1]=true}, -- fully loaded
	-- technician
		-- engineer
			engineering = {[1]=true},
			jack_of_all_trades = true,
			tower_defense = true,
		-- breacher
			hardware_expert = true,
			drill_expert = true, -- drill sawgeant
			more_fire_power = true,
			kick_starter = true,
	-- ghost
		-- shinobi
			jail_workout = true, -- chameleon
			cleaner = true, -- cleaner
			chameleon = true, -- sixth sense
			second_chances = true, -- nimble
			ecm_booster = true, -- ecm overdrive
			ecm_2x = true, -- ecm specialist
		-- artful dodger
			awareness = true, -- parkour
			thick_skin = true, -- inner pocket
		-- silent killer
			optic_illusions = {[2]=true},
			hitman = {[2]=true}, -- high value target
}

local function remove_upgrade(upgrades_table, ...)
	local lookup = {}
	for _, upgrade_name in ipairs({ ... }) do
		lookup[upgrade_name] = true
	end
	
	for i = #upgrades_table, 1, -1 do
		if lookup[upgrades_table[i]] then
			table.remove(upgrades_table, i)
		end
	end
end

Hooks:PostHook(SkillTreeTweakData, "init", "init_sss", function (self, tweak_data)
	for skill_name, skill_data in pairs(self.skills) do
		local preserve = preserved_skills[skill_name]

		if preserve ~= true then
			if preserve == nil then
				-- skill_data.name_id = "sss_skill_disabled"
				skill_data.desc_id = "sss_skill_disabled_desc"
				skill_data.icon_xy = {0,0} -- not done yet icon
			end

			for tier_index, tier_data in ipairs(skill_data) do
				if preserve == nil or not preserve[tier_index] then
					tier_data.upgrades = {}
				end

				if skill_name == "hitman" and tier_index == 2 then
					remove_upgrade(tier_data.upgrades, "player_marked_inc_dmg_distance_1")
				end
				
				if skill_name == "tea_cookies" and tier_index == 2 then
					remove_upgrade(tier_data.upgrades, "first_aid_kit_auto_recovery_1")
				end
			end
		end
	end

	for _, deck_data in pairs(self.specializations) do
		for _, card_data in ipairs(deck_data) do
			card_data.upgrades = {}
			if card_data.multi_choice then
				for _, multi_choice_data in ipairs(card_data.multi_choice) do
					multi_choice_data.upgrades = {}
				end
			end
		end
	end

	self.default_upgrades = {
		"player_fall_damage_multiplier",
		-- "player_fall_health_damage_multiplier", -- default
		"player_silent_kill", -- reenabled to support stealth run?
		"player_primary_weapon_when_downed",
		"player_intimidate_enemies",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		-- "player_civ_harmless_melee", -- default
		"player_walk_speed_multiplier", -- readded for stealth
		-- "player_steelsight_when_downed",
		"player_crouch_speed_multiplier",  -- readded for stealth
		"carry_interact_speed_multiplier_1", -- readded for stealth
		"carry_interact_speed_multiplier_2", -- readded for stealth
		"carry_movement_speed_multiplier", -- readded for stealth
		"trip_mine_sensor_toggle", -- readded for stealth
		"trip_mine_sensor_highlight", -- readded for stealth
		"trip_mine_can_switch_on_off", -- readded for stealth
		"ecm_jammer_can_activate_feedback", -- readded for completeness
		"ecm_jammer_interaction_speed_multiplier", -- readded for stealth
		"ecm_jammer_can_retrigger", -- readded for completeness
		"ecm_jammer_affects_cameras",
		-- "striker_reload_speed_default", -- default
		-- "temporary_first_aid_damage_reduction", -- default
		-- "temporary_passive_revive_damage_reduction_2", -- default
		-- "akimbo_recoil_index_addend_1", -- default
		"doctor_bag",
		"ammo_bag",
		"trip_mine",
		"ecm_jammer",
		"first_aid_kit",
		"sentry_gun",
		-- "sentry_gun_silent", -- disabled to make it depends on skill instead
		"bodybags_bag",
		"armor_kit",
		"saw",
		"cable_tie",
		"jowi",
		"x_1911",
		"x_b92fs",
		"x_deagle",
		"x_g22c",
		"x_g17",
		"x_usp",
		"x_sr2",
		"x_mp5",
		"x_akmsu",
		"x_packrat",
		"x_p226",
		"x_m45",
		"x_mp7",
		"x_ppk",
		"body_armor1",
		"body_armor2",
		"body_armor3",
		"body_armor4",
		"body_armor5",
		"body_armor6",
		-- "player_buy_bodybags_asset",  -- disabled to make it depends on skill instead
		-- "player_additional_assets",  -- disabled to make it depends on skill instead
		-- "player_buy_spotter_asset"  -- disabled to make it depends on skill instead

		-- PERK DECK
		-- kingpin
		"temporary_chico_injector_1",
		"chico_injector", -- cooldown: managers/playermanager.lua:6081 (speed_up_chico_injector)
		-- sicario
		"smoke_screen_grenade", -- cooldown: managers/playermanager.lua:362 (speed_up_smoke_grenade)
		-- pocket ecm
		"pocket_ecm_jammer", -- cooldown: managers/playermanager.lua:6111 (speed_up_pocket_ecm_jammer)
		"player_pocket_ecm_jammer_base",
	}
end)
