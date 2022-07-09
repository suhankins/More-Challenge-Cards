local text_original = LocalizationManager.text
function LocalizationManager:text(string_id, ...)
if string_id == "effect_player_faster_reload" then
    log(text_original(self, string_id, ...))
end
return string_id == "ra_mind_blowing_name_id" and "Mind Blowing"
or string_id == "ra_mind_blowing_desc_id" and "Enemies explode on headshot; Missing a shot damages the player by 5% of their max health"

or string_id == "effect_explosive_headshots" and "Enemies explode on headshot"
or string_id == "effect_damage_on_miss" and "5% damage to player on missing their shot"

or text_original(self, string_id, ...)
end