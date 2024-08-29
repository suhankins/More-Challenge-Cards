DB:create_entry("texture", "ui/challenge_cards/cc_raid_rare_mind_blowing", ModPath .. "assets/cc_raid_rare_mind_blowing.dds")

Hooks:PostHook(ChallengeCardsTweakData, "init", "more_challenge_cards_ChallengeCardsTweakData_init_mind_blowing", function(self, tweak_data)
    BuffEffectManager.EFFECT_EXPLOSIVE_HEADSHOTS = "explosive_headshots"

    self.cards.ra_mind_blowing = {
        name = "ra_mind_blowing_name_id",
        description = "ra_mind_blowing_desc_id",
        effects = {
            {
                value = true,
                type = ChallengeCardsTweakData.EFFECT_TYPE_POSITIVE,
                name = BuffEffectManager.EFFECT_EXPLOSIVE_HEADSHOTS
            },
            {
                value = 0.25,
                type = ChallengeCardsTweakData.EFFECT_TYPE_NEGATIVE,
                name = BuffEffectManager.EFFECT_ENEMIES_RECEIVE_DAMAGE
            },
            {
                value = 4.0,
                type = ChallengeCardsTweakData.EFFECT_TYPE_POSITIVE,
                name = BuffEffectManager.EFFECT_PLAYER_HEADSHOT_DAMAGE
            }
        },
        positive_description = {
            desc_id = "effect_explosive_headshots"
        },
        negative_description = {
            desc_id = "effect_less_bodyshot_damage",
            desc_params = {
                EFFECT_VALUE_1 = "75%"
            }
        },
        rarity = LootDropTweakData.RARITY_RARE,
        card_type = ChallengeCardsTweakData.CARD_TYPE_RAID,
        texture = "cc_raid_rare_mind_blowing",
        achievement_id = "",
        bonus_xp_multiplier = 1.5,
        def_id = 0,
        card_category = ChallengeCardsTweakData.CARD_CATEGORY_CHALLENGE_CARD
    }

    table.insert(self.cards_index, "ra_mind_blowing")
end)