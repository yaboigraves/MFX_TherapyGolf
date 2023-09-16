class_name ActionData
extends Resource

#action data then has effects, which get applied to do things on frames
#there's also lanes to think about
#to start it just runs some code on the given context when told to
#contains a series of effects it can do

@export var texture : Texture2D
@export_flags ("Lane 1", "Lane 2", "Lane 3", "Lane 4") var lane
@export var effects : Array[Effect]

