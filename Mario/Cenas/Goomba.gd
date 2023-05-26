extends KinematicBody2D

var movimento = Vector2.ZERO
var velocidade_movimento = 200

func _ready():
	pass # Replace with function body.

func _process(delta: float):
	movimento.x = velocidade_movimento
