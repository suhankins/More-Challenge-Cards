function BuffEffectManager:activate_effect(effect_data)
	local effect = BuffEffect:new(effect_data.name, effect_data.value, effect_data.challenge_card_key, effect_data.fail_message)
	self._effect_id_counter = self._effect_id_counter + 1
	self._active_effects[self._effect_id_counter] = effect
	effect.effect_id = self._effect_id_counter

	if effect_data.name == BuffEffectManager.EFFECT_COMPLETE_RAID_WITHIN then
		self._timers[effect_data.name] = {
			start_time = TimerManager:game():time(),
			value = effect_data.value,
			effect_id = effect.effect_id,
			effect_name = effect.effect_name
		}
	elseif effect_data.name == BuffEffectManager.EFFECT_NO_SNIPER then
		managers.global_state:set_flag("card_snipers_deactivate")
	elseif effect_data.name == BuffEffectManager.EFFECT_NO_BARRAGE then
		managers.global_state:set_flag("card_barrage_deactivate")
	elseif effect_data.name == BuffEffectManager.EFFECT_ALL_CHESTS_ARE_LOCKED then
		managers.global_state:set_flag("card_all_chests_are_locked")
	elseif effect_data.name == BuffEffectManager.EFFECT_ONLY_MELEE_AVAILABLE then
		managers.global_state:set_flag("card_only_melee_available")
	end

	return self._effect_id_counter
end
