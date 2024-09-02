if RequiredScript == 'lib/managers/buffeffectmanager' then
    BuffEffectManager.EFFECT_EXPLOSIVE_HEADSHOTS = "explosive_headshots"
elseif RequiredScript == 'lib/units/enemies/cop/copdamage' then
    local was_dead_already = false
    Hooks:PreHook(CopDamage, "damage_bullet", "more_challenge_cards_CopDamage_damage_bullet_explosive_headshots_prehook", function(self, attack_data)
        was_dead_already = self._dead
    end)
    Hooks:PostHook(CopDamage, "damage_bullet", "more_challenge_cards_CopDamage_damage_bullet_explosive_headshots", function(self, attack_data)
        if not managers.buff_effect:is_effect_active(BuffEffectManager.EFFECT_EXPLOSIVE_HEADSHOTS) then
            return
        end

        if (self._dead and was_dead_already) or self._invulnerable then
            return
        end

        if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
            return
        end

        local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name

        if not head then
            return
        end

        -- barage shell
        local projectile_index = 1
        local cooking_t = -1
        local dir = math.UP
        local pos = attack_data.col_ray.position

        if Network:is_client() then
			managers.network:session():send_to_host("request_throw_projectile", projectile_index, pos, dir, cooking_t)
		else
			ProjectileBase.throw_projectile(projectile_index, pos, dir, managers.network:session():local_peer():id(), cooking_t)
			managers.player:verify_grenade(managers.network:session():local_peer():id())
		end
    end)
end

