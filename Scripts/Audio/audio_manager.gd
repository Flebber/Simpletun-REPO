extends Node


@export var audio_bank: AudioBank

var audio_instance : AudioStreamPlayer
var isSfxPlaying : bool

# play oneshot sound effect
func playSfxOS(sfx : String):
	var sound = audio_bank.OneShotBank[sfx]

	audio_instance = AudioStreamPlayer.new()
	add_child(audio_instance)

	audio_instance.finished.connect(endSFX.bind(audio_instance))

	audio_instance.name = str(sfx)
	audio_instance.stream = sound
	audio_instance.play()

# play clip sound effect
func playSfxCP(sfx):
	isSfxPlaying = true
	var sound = audio_bank.ClipBank[sfx]
	audio_instance.stream = sound
	audio_instance.play()

func endSFX(instance):
	print(instance, " is leaving now")
	instance.queue_free()
