class_name Freek extends CharacterBody2D

@warning_ignore("unused_private_class_variable")
@onready var _freek_sprites: AnimatedSprite2D = %freek_sprites

@warning_ignore("unused_private_class_variable")
@onready var _freek_camera: Camera2D = %FreekCamera

@warning_ignore("unused_private_class_variable")
@onready var _collision_body: CollisionShape2D = %collision_body

@onready var _pickup_sound: AudioStreamPlayer = %pickup_sound

func _ready() -> void:
	add_to_group("freek")

func take_damage(damage: int) -> void:
	PlayerState.freek_current_health -= damage
	if PlayerState.freek_current_health <= 0:
		%StateMachine.send_message_to_state("Die")

func _on_item_pickup_radius_area_entered(area: Area2D) -> void:
	if PlayerState.freek_hold_status == Enums.FreekItemHeld.Nothing:
		area.queue_free()
		PlayerState.freek_hold_status = Enums.FreekItemHeld.HealthPickup
		_pickup_sound.play()

func _on_interaction_area_body_entered(_body: Node2D) -> void:
	PlayerState.is_freek_near_max = true

func _on_interaction_area_body_exited(_body: Node2D) -> void:
	PlayerState.is_freek_near_max = false
