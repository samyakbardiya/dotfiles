-- Show symlink in status bar
-- https://yazi-rs.github.io/docs/tips/#show-symlink-in-status-bar
function Status:name()
	local h = cx.active.current.hovered
	if not h then
		return ui.Span("")
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Span(" " .. h.name .. linked)
end

-- -- Show username and hostname in header
-- -- https://yazi-rs.github.io/docs/tips/#show-username-and-hostname-in-header
-- function Header:host()
-- 	if ya.target_family() ~= "unix" then
-- 		return ui.Line {}
-- 	end
-- 	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
-- end
--
-- function Header:render(area)
-- 	local chunks = self:layout(area)
--
-- 	local left = ui.Line { self:host(), self:cwd() }
-- 	local right = ui.Line { self:count(), self:tabs() }
-- 	return {
-- 		ui.Paragraph(chunks[1], { left }),
-- 		ui.Paragraph(chunks[2], { right }):align(ui.Paragraph.RIGHT),
-- 	}
-- end
