extends Control

const LOST_SOUL_STORY_SCENE = preload("res://scenes/gui/LostSoulStory.tscn")

var display_lost_souls = false
var soul_stories_count = 0
var rng = RandomNumberGenerator.new()
onready var lost_souls = Game.INITIAL_SOULS_COUNT - Game.souls_count

func _ready() -> void:
    rng.randomize()
    $VBoxContainer/SoulsSavedContainer.initialize(Game.souls_count)
    $VBoxContainer/SoulsCountLabel.text = str(Game.souls_count)
    $VBoxContainer/LostSoulsCountLabel.text = str(lost_souls)

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("fire"):
        if !display_lost_souls:
            _display_lost_souls()
        elif soul_stories_count < lost_souls:
            _display_lost_soul_story()
        else:
            get_tree().change_scene(Game.GAME_SCENE)
    
func _display_lost_souls() -> void:
    display_lost_souls = true
    $VBoxContainer/Label2.visible = true
    $VBoxContainer/LostSoulsCountLabel.visible = true

func _display_lost_soul_story() -> void:
    if soul_stories_count == 0:
        var instance = LOST_SOUL_STORY_SCENE.instance()
        $VBoxContainer.add_child(instance)

    soul_stories_count += 1
    var story = SoulStories.STORIES[rng.randi() % SoulStories.STORIES.size()]
    story += "\n\nThis soul will never know peace..."
    $VBoxContainer/LostSoulStory/Label.text = str(story)
