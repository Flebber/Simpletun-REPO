extends Node


@export var audio_player: AudioStreamPlayer2D
@export var audio_bank: AudioBank

var isSfxPlaying : bool


func _ready() -> void:
	audio_bank.audio_player = audio_player


# play oneshot sound effect
func playSfxOS(sfx : String):
	var sound = audio_bank.OneShotBank[sfx]
	audio_player.stream = sound
	audio_player.play()

# play clip sound effect
func playSfxCP(sfx):
	isSfxPlaying = true
	var sound = audio_bank.ClipBank[sfx]
	audio_player.stream = sound
	audio_player.play()
	
