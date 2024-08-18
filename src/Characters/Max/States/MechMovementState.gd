class_name MechMovementState extends State

const MOVE_CANCEL = "Move_Cancel"
const MOVE_COMMIT = "Move_Commit"
const MOVE_DIE = "Move_Die"
const MOVE_IDLE = "Move_Idle"
const MOVE_UNPOWERED = "Move_Unpowered"
const MOVE_WINDUP = "Move_Windup"

# how far a leg will attempt to move
const LEG_MOVEMENT_SPEED: int = 32

var max_player: Max

func _ready() -> void:
	await owner.ready
	max_player = owner as Max
	assert(max_player != null, "The MechMovementState state type must be used only in the Max scene. It needs the owner to be a Max node.")
