extends Node2D

const FIRST_TILE_POSITION = Vector2(64, 64)*2
const FIRST_TILE_CENTER = Vector2(64, 64)*3
const STEP = 64*2

const ORIGINAL_TILE_SIZE = 64
var TILEMAP_SCALE = 0
var EFFECTIVE_TILE_SIZE = 0
var BOARD_OFFSET = 0

const ROW_COUNT = 8
const COLUMN_COUNT = 8

var board = []


func _ready():
	TILEMAP_SCALE = $Tiles.scale
	EFFECTIVE_TILE_SIZE = ORIGINAL_TILE_SIZE * TILEMAP_SCALE
	BOARD_OFFSET = EFFECTIVE_TILE_SIZE
	
	for _i in range(ROW_COUNT):
		var column = []
		column.resize(COLUMN_COUNT)
		board.append(column)


func get_vector_to_center_of_tile(column, row) -> Vector2:
	assert(
		Vector2(0, 0) <= Vector2(column, row) and
		Vector2(column, row) < Vector2(COLUMN_COUNT, ROW_COUNT),
		'Position (column %d | row %d) is out of bounds.' % [column, row]
	)
	return FIRST_TILE_CENTER + Vector2(column, row)*EFFECTIVE_TILE_SIZE


func get_column_row_position(pixel_position: Vector2):
	var column_row_position = ((pixel_position - FIRST_TILE_POSITION) / EFFECTIVE_TILE_SIZE)
	return Vector2(int(column_row_position.x), int(column_row_position.y))
