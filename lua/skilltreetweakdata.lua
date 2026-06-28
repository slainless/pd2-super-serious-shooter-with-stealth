Hooks:PostHook(SkillTreeTweakData, "init", "init_sss", function (self, tweak_data)
	for _, skill_data in pairs(self.skills) do
		for _, tier_data in ipairs(skill_data) do
			tier_data.upgrades = {}
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
	}
end)
