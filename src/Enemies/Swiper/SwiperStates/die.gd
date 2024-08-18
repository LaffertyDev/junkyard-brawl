extends EnemyStateBase

func enter(_previous_state_path: String, _data := {}) -> void:
	swiper_instance.queue_free()
