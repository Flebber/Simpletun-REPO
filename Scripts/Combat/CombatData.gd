extends Resource
class_name CombatData

@export var atkType : ATK_TYPE
@export var atkSubType : ATK_SUBTYPE
@export var atkSprite : Texture
@export var atkShape : ATK_SHAPE
@export var initialPos : Vector2
@export var dmgAmount : float = 0.0

@export var test_int : int

@export var isPlayer : bool

enum ATK_TYPE {
	melee,
	ranged
}

enum ATK_SUBTYPE {
	SLAP,
	PUNCH
}

enum ATK_SHAPE {
	circle,
	line,
	projectile,
	dome
}
