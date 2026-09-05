extends TextEdit

# Node Assignment
@onready var text_edit: TextEdit = %TextEdit
@onready var secret_sprite: Sprite2D = %SecretSprite

# Load Images
@onready var secret_happy_texture : Texture2D = load("res://assets/sprites/Secret/smile laptop.png")
@onready var secret_sad_texture : Texture2D = load("res://assets/sprites/Secret/sad laptop.png")



func _process(delta: float) -> void:
	if text_edit.text == "happy":
		secret_sprite.visible = true
		secret_sprite.texture = secret_happy_texture
	if text_edit.text == "sad":
		secret_sprite.visible = true
		secret_sprite.texture = secret_sad_texture
