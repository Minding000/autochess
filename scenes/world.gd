extends Node2D

const red_piece_scene = preload("res://scenes/pieces/red_piece.tscn")

const STARTING_VEC = Vector2(64, 64)*2
const STARTING_VEC_CENTER = Vector2(64, 64)*3
const STEP = 64*2

var TILEMAP_SCALE = 0
var ORIGINAL_TILE_SIZE = 0
var EFFECTIVE_TILE_SIZE = 0
var BOARD_OFFSET = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Red-2".position = STARTING_VEC_CENTER
	
	TILEMAP_SCALE = $Tiles.scale
	ORIGINAL_TILE_SIZE = 64
	EFFECTIVE_TILE_SIZE = ORIGINAL_TILE_SIZE * TILEMAP_SCALE
	BOARD_OFFSET = EFFECTIVE_TILE_SIZE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	input_shenanigans()


func input_shenanigans():
	if Input.is_action_just_pressed("primary action"):
		$"Red-2".position.x += EFFECTIVE_TILE_SIZE.x
	
	if Input.is_action_just_pressed("secondary action"):
		$"Red-2".position.y += EFFECTIVE_TILE_SIZE.y


func get_vec_to_center_of_tile(row, col) -> Vector2:
	if Vector2(0, 0) <= Vector2(row, col) and Vector2(row, col) <= Vector2(7, 7): 
		return STARTING_VEC_CENTER + Vector2(row, col)*EFFECTIVE_TILE_SIZE
	else:
		# crash game ftw
		return STARTING_VEC_CENTER
	

func get_col_row(pos: Vector2):
	var col_row_vec = ((pos - STARTING_VEC) / EFFECTIVE_TILE_SIZE)
	
	return Vector2(int(col_row_vec.x), int(col_row_vec.y))
	
#	return Vector2(int((pos.x - BOARD_OFFSET) / EFFECTIVE_TILE_SIZE), int((pos.y - BOARD_OFFSET) / EFFECTIVE_TILE_SIZE))


	
func todo_yes(instructions):
	# save stationed unit in each tile
	# instantiate with none

	# add move unit while holding
	# on unit drop:
		# check corresponding tile
		# update tile info with new unit
		# swap if existent
	
	print('just DO iT:1')
