if RequiredScript == 'lib/managers/buffeffectmanager' then
    BuffEffectManager.EFFECT_HEAL_ON_MISS = "heal_on_miss"
elseif RequiredScript == 'lib/units/weapons/raycastweaponbase' then
    Hooks:PostHook(RaycastWeaponBase, "_fire_raycast", "more_challenge_cards_RaycastWeaponBase_fire_raycast_heal_on_miss", function(self)
        if not managers.buff_effect:is_effect_active(BuffEffectManager.EFFECT_HEAL_ON_MISS) then
            return
        end

        if not self._shot_fired_stats_table.hit then
            local healing = managers.buff_effect:get_effect_value(BuffEffectManager.EFFECT_HEAL_ON_MISS, false)
            managers.player:local_player():character_damage():restore_health(healing)
        end
    end)

end
