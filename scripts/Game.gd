extends Node

const GAME_SCENE = "res://scenes/game_scenes/Level1.tscn"

const INITIAL_SOULS_COUNT = 10
var souls_count: = INITIAL_SOULS_COUNT

static func initialize():
    Game.souls_count = Game.INITIAL_SOULS_COUNT
