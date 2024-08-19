extends HammerStateBase

func enter(_previous_state_path: String, data := {}) -> void:
	max_player._hammer.animation = "engage"
	max_player.shake_strength = 2
	max_player._hammer_sound.play()
	var areas_hit = max_player._hammer_attack_damage_scan_area.get_overlapping_areas()
	for area in areas_hit:
		area.take_damage(1)

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_COOLDOWN)

	if not Input.is_action_pressed("action_primary"):
		finished.emit(HAMMER_COOLDOWN)
