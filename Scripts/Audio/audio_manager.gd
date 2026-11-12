extends Node


@export var audio_player: AudioStreamPlayer2D
@export var audio_bank: AudioBank



func _ready() -> void:
	audio_bank.audio_player = audio_player
	print(audio_bank.audio_player, audio_bank.ClipBank, audio_bank.OneShotBank)
	


# play oneshot sound effect
func playSfxOS(sfx : String):
	var sound = audio_bank.OneShotBank[sfx]
	audio_player.stream = sound
	audio_player.play()

# play clip sound effect
func playSfxCP(sfx):
	var sound = audio_bank.ClipBank[sfx]
	audio_player.stream = sound
	audio_player.play()
