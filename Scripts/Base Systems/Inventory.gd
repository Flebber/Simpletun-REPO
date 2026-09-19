extends Node

var coin_count : int 
signal coin_collected

var key_count : int
var poo_count : int
var empty : int = 0


func reset_count():
	coin_count = empty
	key_count = empty
	poo_count = empty
