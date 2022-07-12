local text_original = LocalizationManager.text

function LocalizationManager:text(string_id, macros)
    --[[if type(macros) == "table" then
        for i,v in pairs(macros) do
            log(tostring(i) .. " " .. tostring(v))
        end
    end]]
    return string_id == "ra_mind_blowing_name_id" and "Mind Blowing"
    or string_id == "ra_mind_blowing_desc_id" and "Enemies explode on headshot; Missing a shot damages the player by 5% of their max health"

    or string_id == "effect_explosive_headshots" and "Enemies explode on headshot"
    or string_id == "effect_damage_on_miss" and macros.EFFECT_VALUE_1 .. " damage to player on missing their shot"

    or text_original(self, string_id, macros)
end