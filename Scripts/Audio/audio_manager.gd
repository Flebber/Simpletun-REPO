extends Node


@export var audio_bank: AudioBank

var audio_instance : AudioStreamPlayer
var isSfxPlaying : bool

# play oneshot sound effect
func playSfxOS(sfx : String):
	var sound = audio_bank.OneShotBank[sfx]
	audio_instance = AudioStreamPlayer.new()
	add_child(audio_instance)
	print(audio_instance)

	# Set the instanced audioplayer's streram to the sound
	# Play the sound
	# que free the instance when audio ends
	audio_instance.stream = sound
	audio_instance.play()

# play clip sound effect
func playSfxCP(sfx):
	isSfxPlaying = true
	var sound = audio_bank.ClipBank[sfx]
	audio_instance.stream = sound
	audio_instance.play()
