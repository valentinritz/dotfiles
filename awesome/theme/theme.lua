-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
--theme.wallpaper = "/home/valentin/Images/lR1cqPB.jpg"
--theme.wallpaper = "/home/valentin/Images/393557_gory_gimalai_skaly_oblaka_2048x1152_(www.GdeFon.ru).jpg"
--theme.wallpaper = "/home/valentin/Images/petroskoublis.jpg"
--theme.wallpaper = "/home/valentin/Images/Southern_Alps_1366x768.jpg"
--theme.wallpaper = "/home/valentin/Images/antelope_island.jpg"
--theme.wallpaper = "/home/valentin/Images/mount.jpg"
--theme.wallpaper = "/home/valentin/Images/plage.jpg"
--theme.wallpaper = "/home/valentin/Images/mount2.jpg"
--theme.wallpaper = "/home/valentin/Images/round.jpg"
theme.wallpaper = "/home/valentin/Images/space.jpg"
-- }}}


-- {{{ Espace entre fenêtres
theme.useless_gap_width = 24
-- }}}

-- {{{ Styles
theme.font      = "Pragmatatt 8"
-- }}}

-- {{{ Colors
theme.fg_normal  = "#ffffff"
--3c4c5c
theme.bg_focus   = "#222222"
theme.fg_urgent  = "#222222"
theme.bg_normal  = "#222222"
theme.fg_focus   = "#888888"
theme.bg_urgent  = "#888888"
theme.bg_systray = theme.bg_normal
--Couleurs précédentes : fff, 6c6c6c et "#272822"
-- }}}

-- {{{ Borders
theme.border_width  = 1
--theme.border_normal = "#999999"
--theme.border_focus  = "#3F3F3F"
--theme.border_marked = "#CC9393"
theme.border_normal = "#252525"
theme.border_focus  = "#252525"
theme.border_marked = "#252525"
-- Next
--theme.border_normal = "#3F3F3F"
--theme.border_focus  = "#999999"
--theme.border_marked = "#CC9393"
-- First
--theme.border_normal = "#3F3F3F"
--theme.border_focus  = "#6F6F6F"
--theme.border_marked = "#CC9393"

-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|pacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 24
theme.menu_width  = 130
--theme.menu_border_width  = 3
--theme.menu_border_color  = "#dddddd"
theme.menu_border_color  = "#1f1f1f"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = "/home/valentin/.config/awesome/icons/play2.png"
-- }}}

return theme
