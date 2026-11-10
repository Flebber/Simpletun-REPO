extends Node

@export var clips: AudioStreamPlayer2D
@export var one_shots: AudioStreamPlayer2D
@export var audio_bank: AudioBank


func setup() -> void:
	audio_bank.clips = clips
	audio_bank.one_shots = one_shots
