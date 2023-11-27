extends Node2D

class Player:
	var name = "Player 1"
	var health = 100
	var gold = 10
	var level = 1
	var experience = 0

var player = Player.new()
	
func reduce_player_gold_by(amount: int) -> void:
	player.gold -= amount
	$StatusBoard.set_gold(player.gold)
