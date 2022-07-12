DB:create_entry("texture", "ui/challenge_cards/cc_raid_rare_mind_blowing", ModPath .. "assets/cc_raid_rare_mind_blowing.dds")

Hooks:PostHook(ChallengeCardsTweakData, "init", "expanded_challenge_cards_init", function(self, tweak_data)
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
                value = 0.05,
                type = ChallengeCardsTweakData.EFFECT_TYPE_NEGATIVE,
                name = BuffEffectManager.EFFECT_DAMAGE_ON_MISS
            }
        },
        positive_description = {
            desc_id = "effect_explosive_headshots"
        },
        negative_description = {
            desc_id = "effect_damage_on_miss",
            desc_params = {
                EFFECT_VALUE_1 = "5%"
            }
        },
        rarity = LootDropTweakData.RARITY_RARE,
        card_type = ChallengeCardsTweakData.CARD_TYPE_RAID,
        texture = "cc_raid_rare_mind_blowing",
        achievement_id = "",
        bonus_xp_multiplier = 1.5,
        def_id = 69696,
        card_category = ChallengeCardsTweakData.CARD_CATEGORY_CHALLENGE_CARD
    }

    table.insert(self.cards_index, "ra_mind_blowing")
end)