class_name EnemyStateBase extends State

const SPAWN = "Spawn"
const IDLE = "Idle"
const FIND_TARGET = "FindTarget"
const MOVE_TO_TARGET = "MoveToTarget"
const ATTACK = "Attack"
const TAKE_DAMAGE = "TakeDamage"
const DIE = "Die"
var swiper_instance: Swiper

func _ready() -> void:
	await owner.ready
	swiper_instance = owner as Swiper
	assert(swiper_instance != null, "The EnemyStateBase state type must be used only in a Swiper scene. It needs the owner to be an Swiper node.")
