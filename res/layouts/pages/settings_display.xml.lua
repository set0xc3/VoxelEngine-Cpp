function create_setting(id, name, step, postfix, tooltip)
    local info = core.get_setting_info(id)
    postfix = postfix or ""
    tooltip = tooltip or ""
    document.root:add(gui.template("track_setting", {
        id=id,
        name=gui.str(name, "settings"),
        value=core.get_setting(id),
        min=info.min,
        max=info.max,
        step=step,
        postfix=postfix,
        tooltip=tooltip
    }))
    update_setting(core.get_setting(id), id, name, postfix)
end

function update_setting(x, id, name, postfix)
    core.set_setting(id, x)
    -- updating label
    document[id..".L"].text = string.format(
        "%s: %s%s", 
        gui.str(name, "settings"), 
        core.str_setting(id), 
        postfix
    )
end

function create_checkbox(id, name, tooltip)
    tooltip = tooltip or ''
    document.root:add(string.format(
        "<checkbox consumer='function(x) core.set_setting(\"%s\", x) end' checked='%s' tooltip='%s'>%s</checkbox>", 
        id, core.str_setting(id), gui.str(tooltip, "settings"), gui.str(name, "settings")
    ))
end

function on_open()
    create_setting("camera.fov", "FOV", 1, "°")
    create_checkbox("display.fullscreen", "Fullscreen")
    create_checkbox("display.vsync", "V-Sync")
    create_checkbox("camera.shaking", "Camera Shaking")
    create_checkbox("camera.inertia", "Camera Inertia")
end
