extends PanelContainer
## Drop-in presentation component. The host game owns pausing, settings and quitting.

signal resume_requested
signal settings_requested
signal exit_requested

@onready var resume_button: Button = $Contents/Resume

func _ready() -> void:
	$Contents/Resume.pressed.connect(func(): resume_requested.emit())
	$Contents/Settings.pressed.connect(func(): settings_requested.emit())
	$Contents/Exit.pressed.connect(func(): exit_requested.emit())

func focus_first() -> void:
	resume_button.grab_focus()
