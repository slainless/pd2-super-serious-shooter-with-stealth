if not SuperSeriousShooter then
	SuperSeriousShooter = {}
	SuperSeriousShooter.required = {}
	SuperSeriousShooter.mod_path = ModPath
	SuperSeriousShooter.mod_instance = ModInstance
	SuperSeriousShooter.difficulties = {
		"easy", "normal", "hard", "overkill", "overkill_145", "easy_wish", "overkill_290", "sm_wish"
	}

	function SuperSeriousShooter:difficulty_tweak(tweak_data, func)
		for _, difficulty in pairs(self.difficulties) do
			Hooks:PostHook(tweak_data, "_set_" .. difficulty, "_set_" .. difficulty .. "_sss", func)
		end
	end

	function SuperSeriousShooter:ws()
		if not self._ws then
			self._ws = Overlay:gui():create_screen_workspace()
		end
		return self._ws
	end

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitSSS", function (loc)
		loc:add_localized_strings({
			bm_wp_upg_a_custom_desc = loc:text("bm_wp_upg_a_custom_desc") .. "\n6 PELLETS",
			bm_wp_upg_a_rip_desc = loc:text("bm_wp_upg_a_rip_desc") .. "\n6 PELLETS, NO AMMO PICKUPS",
			bm_wp_upg_a_explosive_desc = loc:text("bm_wp_upg_a_explosive_desc") .. "\n1 SLUG, NO AMMO PICKUPS",
			bm_wp_upg_a_piercing_desc = loc:text("bm_wp_upg_a_piercing_desc") .. "\n8 FLECHETTES, REDUCED AMMO PICKUPS",
			bm_wp_upg_a_slug_desc = loc:text("bm_wp_upg_a_slug_desc") .. "\n1 SLUG, REDUCED AMMO PICKUPS",
			bm_wp_upg_a_dragons_breath_desc = loc:text("bm_wp_upg_a_dragons_breath_desc") .. "\n8 PELLETS, NO AMMO PICKUPS",
			menu_one_down = "Special Operation",
			menu_toggle_one_down = "Special Operation",
			
			sss_skill_disabled = "Disabled",
			sss_skill_disabled_desc = "This skill is disabled",
			sss_tier_disabled_desc = "Disabled",

			menu_tea_cookies_beta_desc = "BASIC: ##$basic;##$NL;Adds ##$multibasic2;## more First Aid Kits to your inventory.$NL;$NL;ACE: ##$pro;##$NL;Adds ##$multipro3;## First Aid Kits to your inventory.",

			-- these can be done programmatically via gsub-ing but im too lazy ¯\_(ツ)_/¯
			menu_triathlete_beta_desc = "BASIC: ##$basic;##$NL;Increases your supply of cable ties by ##$multibasic2;##. You can cable tie hostages ##$multibasic3;## faster. $NL;$NL;ACE: ##$pro;##$NL;This upgrade is disabled.",
			menu_pack_mule_beta_desc = "BASIC: ##$basic;##$NL;You can throw bags ##$multibasic;## further.$NL;$NL;ACE: ##$pro;##$NL;This upgrade is disabled.",
			menu_portable_saw_beta_desc = "BASIC: ##$basic;##$NL;Unlocks the OVE9000 portable saw for you to use as a secondary weapon.$NL;$NL;ACE: ##$pro;##$NL;This upgrade is disabled.",
			menu_bandoliers_beta_desc = "BASIC: ##$basic;##$NL;Your total ammo capacity is increased by ##$multibasic;##.$NL;$NL;ACE: ##$pro;##$NL;This upgrade is disabled.",
			menu_engineering_beta_desc = "BASIC: ##$basic;##$NL;You can now select a less noisy version of the sentry guns, making them much less likely to be targeted by enemies.$NL;$NL;ACE: ##$pro;##$NL;This upgrade is disabled.",
			
			menu_optic_illusions_desc = "BASIC: ##$basic;##$NL;This upgrade is disabled.$NL;$NL;ACE: ##$pro;##$NL;You gain ##$multipro;## concealment for each silenced weapon you equip and reduces the concealment penalty of silencers by ##$multipro2;##.",
			menu_spotter_teamwork_beta_desc = "BASIC: ##$basic;##$NL;This upgrade is disabled.$NL;$NL;ACE: ##$pro;##$NL;Increase the duration of marked enemies by ##$multipro3;## and you can now mark specials by aiming at them with any weapon.",
		})
	end)
end

if RequiredScript and not SuperSeriousShooter.required[RequiredScript] then

	local fname = SuperSeriousShooter.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	SuperSeriousShooter.required[RequiredScript] = true

end
