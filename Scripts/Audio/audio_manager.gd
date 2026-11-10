extends Node

@export var audio_player: AudioStreamPlayer2D
@export var audio_bank: AudioBank



func _ready() -> void:
	audio_bank.audio_player = audio_player
	print(audio_bank.audio_player, audio_bank.ClipBank, audio_bank.OneShotBank)
