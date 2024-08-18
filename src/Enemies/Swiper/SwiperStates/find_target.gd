extends EnemyStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	var bodies = swiper_instance._enemy_finder.get_overlapping_bodies()
	if bodies.size() == 0:
		finished.emit(IDLE)
		return
		
	# first, see if Max is a target. Go to him.
	for body in bodies:
		if body.is_in_group("max"):
			finished.emit(MOVE_TO_TARGET, { "target": body })
			return
			
	# okay, now see if Freek is available
	for body in bodies:
		if body.is_in_group("freek"):
			finished.emit(MOVE_TO_TARGET, { "target": body })
			return

	# freek and max are not available. Idle
	finished.emit(IDLE)
