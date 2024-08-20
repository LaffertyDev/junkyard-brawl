extends StaticBody2D

func take_damage(_damage: int) -> void:
	print("took damage")
	queue_free()
