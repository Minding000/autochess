extends Node2D

func set_gold(gold: int) -> void:
	$GoldLabel.text = "Gold: %d (+0)" % gold
