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
  end)
end
