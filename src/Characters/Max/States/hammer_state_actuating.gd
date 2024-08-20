extends HammerStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	max_player._hammer.play("attack")
	max_player._hammer.animation_finished.connect(on_attack_finished, CONNECT_ONE_SHOT)
	max_player.shake_strength = 2
	max_player._hammer_sound.play()
	var areas_hit = max_player._hammer_attack_damage_scan_area.get_overlapping_areas()
	for area in areas_hit:
		area.take_damage(1)

func update(_delta: float) -> void:
	if PlayerState.current_pilot_state == Enums.PilotState.Ejected:
		finished.emit(HAMMER_COOLDOWN)

func on_attack_finished() -> void:
	finished.emit(HAMMER_COOLDOWN)
