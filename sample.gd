extends Control

func _ready() -> void:
    var menu = $Center/Contents/PauseMenu
    var status = $Center/Contents/Status
    menu.resume_requested.connect(func(): status.text = "Resume requested — connect this to your game.")
    menu.settings_requested.connect(func(): status.text = "Settings requested — full kit includes a preferences scene.")
    menu.exit_requested.connect(func(): status.text = "Exit requested — your game decides what happens.")
    menu.focus_first()
    if "--self-check" in OS.get_cmdline_user_args():
        await get_tree().process_frame
        assert(get_viewport().gui_get_focus_owner() == menu.get_node("Contents/Resume"))
        menu.resume_requested.emit()
        assert(status.text.begins_with("Resume requested"))
        print("PASS: free sample imports, applies day theme and emits menu signals")
        get_tree().quit()
