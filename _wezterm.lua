local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定(おすすめはMaterialDesignColors)
config.color_scheme = 'MaterialDesignColors'

-- 背景透過
config.window_background_opacity = 0.90

-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Ctrl+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Ctrl+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- Ctrl+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "CTRL",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
}


-- フォントの設定
config.font = wezterm.font_with_fallback({
  "FirgeNerd",
--  "YuGothic",
--  "Hiragino Sans",

  -- <built-in>, BuiltIn
   "JetBrains Mono",

  -- <built-in>, BuiltIn
  -- Assumed to have Emoji Presentation
  -- Pixel sizes: [128]
  "Noto Color Emoji",

  -- <built-in>, BuiltIn
  "Symbols Nerd Font Mono",

})
-- wezterm.font("Firge35Nerd", {weight="Regular", stretch="Normal", style="Normal"}) -- /Users/lobin/Library/Fonts/Firge35Nerd-Regular.ttf, CoreText
-- wezterm.font("Firge35Nerd", {weight="Bold", stretch="Normal", style="Normal"}) -- /Users/lobin/Library/Fonts/Firge35Nerd-Bold.ttf, CoreText
-- wezterm.font("FirgeNerd", {weight="Regular", stretch="Normal", style="Normal"}) -- /Users/lobin/Library/Fonts/FirgeNerd-Regular.ttf, CoreText
-- wezterm.font("FirgeNerd", {weight="Bold", stretch="Normal", style="Normal"}) -- /Users/lobin/Library/Fonts/FirgeNerd-Bold.ttf, CoreText

-- 一部の日本語フォントが小さく表示される問題の対応
-- FirgeNerd 14pt だと「無」が小さく表示されてしまう。この設定を行なっても未解決。
-- https://github.com/yuru7/udev-gothic/issues/8
config.	font_rules = {
		{
			italic = true,
			font = wezterm.font("FirgeNerd", { italic = true }),
		},
	}

-- フォントサイズの設定
config.font_size = 15

return config
