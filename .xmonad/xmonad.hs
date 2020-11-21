import qualified Data.Map as M
import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce

main = do
  xmonad $ docks defaultConfig
    { layoutHook  = myLayoutHook $ avoidStruts $ layoutHook defaultConfig
	, terminal    = "alacritty"
    , modMask     = mod4Mask
    , startupHook = myStartupHook <+> startupHook defaultConfig
	, keys        = \c -> myKeys c `M.union` keys defaultConfig c
    }
  where
    myLayoutHook = spacingRaw
	  False
	  (Border 10 10 10 10) True
	  (Border 10 10 10 10) True
    myKeys (XConfig {modMask = mod4Mask}) = M.fromList $
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts)
      ]

myStartupHook = do
  spawnOnce "fcitx &"
  spawnOnce "picom &"
  spawnOnce "$HOME/.config/polybar/launch.sh"
  spawnOnce "nitrogen --restore"

