extends KinematicBody2D

var movimento = Vector2.ZERO
var velocidade_movimento = 200
var gravidade = 800
var forca_pulo = 450

func _ready():
	pass # Replace with function body.

func _physics_process(delta: float):
	movimento.x = 0
	movimento.y += gravidade * delta
	
	get_entrada()
	set_animacao()
	
	movimento = move_and_slide(movimento, Vector2.UP)

func get_entrada():
	
	if Input.is_action_pressed("w") and is_on_floor():
		movimento.y -= forca_pulo
	elif Input.is_action_pressed("a"):
		movimento.x -= velocidade_movimento
	elif Input.is_action_pressed("s"):
		pass
	elif Input.is_action_pressed("d"):
		movimento.x += velocidade_movimento
	elif Input.is_action_pressed("espaco") and is_on_floor():
		movimento.y -= forca_pulo

	if movimento.x < 0:
		$Sprite.flip_h = true
	elif movimento.x > 0:
		$Sprite.flip_h = false
		
func set_animacao():
	var estado = "Parado"
	
	if movimento.x != 0 and is_on_floor():
		estado = "Correr"
	elif !is_on_floor():
		estado = "Pular"
	
	if $AnimationPlayer.assigned_animation != estado:
		$AnimationPlayer.play(estado)
	
