class_name FreekState extends State

const IDLE = "Idle"
const MOVE = "Move"
const PILOTING = "Piloting"

const FREEK_MOVE_SPEED = 150

var freek_player: Freek

func _ready() -> void:
	await owner.ready
	freek_player = owner as Freek
	assert(freek_player != null, "The FreekState state type must be used only in the Freek scene. It needs the owner to be a Freek node.")
