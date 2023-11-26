extends Node2D

const blue_piece: PackedScene = preload("res://scenes/pieces/blue_piece.tscn")
const green_piece: PackedScene = preload("res://scenes/pieces/green_piece.tscn")
const red_piece: PackedScene = preload("res://scenes/pieces/red_piece.tscn")
const yellow_piece: PackedScene = preload("res://scenes/pieces/yellow_piece.tscn")

const piece_scenes = [blue_piece, green_piece, red_piece, yellow_piece]

const piece_scale = 0.8

func _on_ready():
	reroll()

func reroll():
	clear_pieces()
	for slot_index in range(0, 5):
		var slot_marker = $PiecePositions.get_child(slot_index)
		var slot_position = slot_marker.position
		var piece_scene = get_random_piece_scene()
		var piece_instance = piece_scene.instantiate() as Node2D
		piece_instance.position = slot_position
		piece_instance.scale.x = piece_scale
		piece_instance.scale.y = piece_scale
		$Pieces.add_child(piece_instance)

func clear_pieces():
	for piece in $Pieces.get_children():
		piece.queue_free()

func get_random_piece_scene() -> PackedScene:
	return piece_scenes.pick_random()

func _on_reroll_button_pressed():
	reroll()
