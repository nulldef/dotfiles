local hyper = { "alt" }

--
-- General hotkeys
--

-- Configuration reloading with Hyper+0
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

hs.notify.new({title="hs", informativeText="Config loaded", withdrawAfter=1}):send()

--
-- Window layout management
--

hs.window.animationDuration = 0

-- Layout hotkeys

hs.hotkey.bind(hyper, "j", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind(hyper, "i", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.maximized)
end)

--
-- Application hotkeys
--
local applicationHotkeys = {
  c = "Sublime Text",
  t = "iTerm",
  p = "Spotify",
  s = "Slack",
  g = "Google Chrome",
  a = "Telegram",
  m = "Mail",
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app);

    -- -- center mouse in running window
    -- local window_frame = hs.window.focusedWindow():frame();
    -- local window_center = window_frame.center;
    -- hs.mouse.setAbsolutePosition(window_center)
  end)
end

--
-- Media control
--
-- Alt + ] = Next song
hs.hotkey.bind(hyper, "]", function()
  hs.eventtap.event.newSystemKeyEvent('NEXT', true):post()
  hs.eventtap.event.newSystemKeyEvent('NEXT', false):post()
end)

-- Alt + [ = Prev song
hs.hotkey.bind(hyper, "[", function()
  hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post()
  hs.eventtap.event.newSystemKeyEvent('PREVIOUS', false):post()
end)

-- Alt + \ = Play / Pause
hs.hotkey.bind(hyper, "\\", function()
  hs.eventtap.event.newSystemKeyEvent('PLAY', true):post()
  hs.eventtap.event.newSystemKeyEvent('PLAY', false):post()
end)
