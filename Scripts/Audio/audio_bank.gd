extends Node
class_name AudioBank

var audio_player : AudioStreamPlayer2D

var ClipBank : Dictionary[String, AudioStreamMP3] = {
#region Pud SFX
	"pudGlide": load("uid://beoy7mwqq8my4")
#endregion
}

var OneShotBank : Dictionary[String,  AudioStreamMP3] = {
#region Global SFX
	"finishLevel": load("uid://bylpq6hxg5gr6"),
#endregion
	
#region Pickup SFX
	"coinPickup": load("uid://iqxntjpapmtn"),
#endregion

#region Pud SFX
	"pudHurt": load("uid://cixljks6ivfr4"),
	"pudDeath": load("uid://ctdoij6kaovl2"),
	"pudHuss": load("uid://b6q3o5gp5l6j0"),
	"pudJump": load("uid://fcd2lewrcmi8"),
#endregion
}
