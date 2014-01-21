-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

vicious = require("vicious")

-- layouts
mylayouts = require("layouts")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/valentin/.config/awesome/theme/theme.lua")

-- Naughty config
naughty.config.icon_size = 48

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    --custom layouts
      mylayouts.uselesstile,
      --layouts.termfair,
      --layouts.browse,
      --layouts.uselessfair,
      --layouts.centerwork,
    --classic layouts
      --awful.layout.suit.spiral,
      awful.layout.suit.floating,
      --awful.layout.suit.tile,
}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "desk","warp","mail","porn"}, s, 
    { layouts[1], layouts[2], layouts[1], layouts[2] })
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
--myappsmenu = {
--             { "snownews", "xfce4-terminal --geometry=85x60+1060+27 --title=snownews -e snownews" },
--             { "earthquake", "urxvt -geometry 166x65+27+27 -title earthquake -e earthquake" }
--}

mymainmenu = awful.menu({ items = { { "~", "thunar" },
                                    --{ "warpzone", myappsmenu },
                                    { "restart awesome", awesome.restart },
                                    { "quit", awesome.quit },
                                    { "shutdown", "sudo shutdown -h now"}
                                  }
                        })

mylauncher = awful.widget.launcher({ image = "/home/valentin/.config/awesome/icons/play2.png",
                                     width = 10,
                                     height = 10,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ naughty theme
naughty.config.defaults.screen = screen.count()
--naughty.config.defaults.timeout = 10
--naughty.config.defaults.hover_timeout = 0.5
naughty.config.defaults.position = "top_right"
naughty.config.defaults.height = 44
naughty.config.defaults.margin = 0
naughty.config.padding = 21
naughty.config.defaults.width = 244
naughty.config.defaults.gap = 10
naughty.config.defaults.ontop = true
--naughty.config.defaults.font = "Open Sans 10"
naughty.config.presets.low.icon = "/home/valentin/.config/awesome/icons/notification3low.png"
naughty.config.presets.normal.icon = "/home/valentin/.config/awesome/icons/notification3.png"
naughty.config.presets.critical.icon = "/home/valentin/.config/awesome/icons/notification3crit.png"
--naughty.config.defaults.icon_size = 36
naughty.config.defaults.icon_height = 44
naughty.config.defaults.icon_width = 54
--naughty.config.presets.normal.border_color = beautiful.border_focus or '#535d6c'
naughty.config.defaults.border_width = 0
naughty.config.presets.normal.fg = '#ffffff'
naughty.config.presets.normal.bg = '#222222'
naughty.config.presets.critical.bg = '#222222'
--naughty.config.presets.normal.bg = '#5599cc'
--naughty.config.presets.low.bg = '#99cc55'
--naughty.config.presets.critical.bg = '#ef3838'
--naughty.config.presets.low.fg = '#f0dfaf'
--naughty.config.presets.low.border_color = beautiful.border_focus or '#535d6c'
--naughty.config.presets.critical.fg = '#dcdccc'
--naughty.config.presets.critical.width = 400
--naughty.config.presets.critical.height = 150
--naughty.config.presets.critical.border_color = beautiful.border_focus or '#535d6c'
-- }}}

-- {{{ Key bindings

globalkeys = awful.util.table.join(
-- START custom keys
-- start volume key
    awful.key({ }, "XF86AudioRaiseVolume", function()
    awful.util.spawn("amixer -q sset Master 5%+")
    awful.util.spawn("/home/valentin/Apps/dzennotification/panel.sh") end),

    awful.key({ }, "XF86AudioLowerVolume", function()
    awful.util.spawn("amixer -q sset Master 5%-")
    awful.util.spawn("/home/valentin/Apps/dzennotification/panel.sh") end),

    awful.key({ }, "XF86AudioMute", function()
    awful.util.spawn("amixer -q sset Master toggle")
    awful.util.spawn("/home/valentin/Apps/dzennotification/panel.sh") end),

--start backlight key

    awful.key({ }, "F8", function() awful.util.spawn("xbacklight -dec 10") end),

    awful.key({ }, "F9", function() awful.util.spawn("xbacklight -inc 10") end),

--launch key

    awful.key({ modkey, }, "a", function () awful.util.spawn("gmrun") end),
    awful.key({ modkey, }, "t", function () awful.util.spawn("thunar") end),
    awful.key({ modkey, }, "0", function () 
    awful.util.spawn("xfce4-terminal -e 'vim /home/valentin/Dropbox/todo.txt'") end),
--printscreen
    awful.key({         }, "Print", function () awful.util.spawn("scrot") end),
    awful.key({ modkey, }, "Print", function () awful.util.spawn("scrot -s") end),
--END custom keys

    awful.key({ modkey, }, "j", awful.tag.viewprev ),
    awful.key({ modkey, }, "k", awful.tag.viewnext ),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore),

    awful.key({ modkey, }, "Left",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, }, "Right",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx( 1) end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1) end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            -- awful.client.focus.history.previous()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l", function () awful.tag.incmwfact( 0.05) end),
    awful.key({ modkey,           }, "h", function () awful.tag.incmwfact(-0.05) end),
    awful.key({ modkey, "Shift"   }, "h", function () awful.tag.incnmaster( 1) end),
    awful.key({ modkey, "Shift"   }, "l", function () awful.tag.incnmaster(-1) end),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1) end),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1) end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts, 1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Menubar
    awful.key({ modkey, "Shift"   }, "a", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey, }, "f", function (c) c.fullscreen = not c.fullscreen end),
    awful.key({ modkey, }, "q", function (c) c:kill() end),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey, }, "o", awful.client.movetoscreen ),
    awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end),
    awful.key({ modkey, }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey, }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Gimp" },
      properties = { floating = true } },
    { rule = { class = "Inkscape" },
      properties = { floating = true } },
    -- Setup Firefox
    { rule = { class = "Firefox" },
       properties = { tag = tags[1][4],
                      border_width = 0} },
    { rule = { class = "Firefox", instance = "Dialog" },
       properties = { border_width = 1} },
    { rule = { class = "Firefox", name = "Popup" },
       properties = { border_width = 1,
                      floating = true} },
    { rule = { class = "Firefox", name = "Save Image" },
       properties = { border_width = 1}},
    { rule = { class = "Firefox", instance = "StylishEdit48" },
       properties = { border_width = 1} },
    -- Turpial
    { rule = { class = "Turpial" },
       properties = { tag = tags[1][3] } },
    { rule = { class = "Turpial", name = "Image Preview" },
       properties = { floating = true }},
    -- other apps
    { rule = { class = "Thunar", name = "Fichier en cours de traitement" },
       properties = { floating = true }},
    { rule = { class = "Thunderbird" },
       properties = { tag = tags[1][2] } },
    { rule = { name = "earthquake" },
       properties = { tag = tags[1][3]} },
    { rule = { name = "snownews" },
       properties = { tag = tags[1][3]} },
    { rule = { name = "irssi" },
       properties = { tag = tags[1][3]} },
    { rule = { class = "Transmission" },
       properties = { tag = tags[1][1]} },
    { rule = { class = "Vlc" },
       properties = { border_width = 0} },
}
-- }}}

-- {{{ Signals : permet, entre autres, de suivre le focus de la souris
 --Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
