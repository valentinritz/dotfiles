---------------------------------------------------------------
-- Author: VAlentin aka mwm                                 2014
-- Based on: twily layout by DWV aka Twily                  2013
-- Awesome -v 3.5
---------------------------------------------------------------
-- Grab environment
local tonumber = tonumber
local beautiful = require("beautiful")
local awful = require("awful")
local math = math

module("layouts.twily")

name = "twily"


bottom_left = 0
bottom_right = 1

function arrange(p)
	-- Screen
	local wa = p.workarea
	local cls = p.clients

	local border = tonumber(beautiful.border_width)
	--local gap = tonumber(beautiful.useless_gap_width)
	local gap = 30
	local fixed_gap = 55

	--if #cls == 0 then

  if #cls > 0 then
		-- Center window
		local c = cls[#cls]
		local g = {}
		local mainwid = math.floor((74.2 * wa.width) / 100)
		local mainhei = math.floor((59 * (wa.height + wa.y)) / 100) + wa.y
		local slavewid = math.floor((mainwid / 2) - (gap / 2)) - border
		local slavehei = math.floor(wa.height - mainhei - (fixed_gap * 2) - gap - (border * 4))

		g.width = mainwid
		g.height = mainhei
		g.x = math.floor(wa.width / 2 - (mainwid / 2)) - border
		g.y = wa.y + fixed_gap

		--g.width = g.width + (fixed_gap * 2)
		--g.x = g.x - fixed_gap

		c:geometry(g)

		-- Auxiliary windows
		if #cls > 1 then
			local at = 0
			for i = (#cls - 1),1,-1 do
				--if at == 3 then
				--	break
				--end

				c = cls[i]
				g = {}

				local cw_scale = 20

				if at == bottom_left then
					g.x = math.floor((wa.width / 2) - (slavewid + border) - gap + (gap / 2)) - border
					g.width = slavewid
				elseif at == bottom_right then
					g.x = math.floor((wa.width / 2) + border + gap - (gap / 2)) - border
					g.width = slavewid
				end

				g.height = slavehei

				g.y = math.floor(wa.y + fixed_gap + gap + mainhei + (border * 2))

				c:geometry(g)

				at = at + 1
			end

			-- Set remaining client to floating
			for i = (#cls - 1 - 2),1,-1 do
				c = cls[i]
				awful.client.floating.set(c, true)
			end
		end
	end
end
