extends Node
class_name AudioBank

var clips: AudioStreamPlayer2D
var one_shots: AudioStreamPlayer2D

var ClipBank : Dictionary[String, AudioStreamMP3] = {
	
}
var OneShotBank : Dictionary[String,  AudioStreamMP3] = {
	"pudHurt": load("uid://c6rllh015c7hm")
}
