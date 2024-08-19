class_name HammerStateBase extends State

const HAMMER_IDLE = "Idle"
const HAMMER_CHARGING = "Charging"
const HAMMER_COOLDOWN = "Cooldown"
const HAMMER_UNPOWERED = "Unpowered"
const HAMMER_ACTUATING = "Actuating"

var max_player: Max

func _ready() -> void:
	await owner.ready
	max_player = owner as Max
	assert(max_player != null, "The HammerStateBase state type must be used only in the Max scene. It needs the owner to be a Max node.")
