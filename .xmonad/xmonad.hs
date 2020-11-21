import qualified Data.Map as M
import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce

main = do
  xmonad $ docks defaultConfig
    { layoutHook  = avoidStruts $ layoutHook defaultConfig
	, terminal    = "alacritty"
    , modMask     = mod4Mask
    , startupHook = myStartupHook <+> startupHook defaultConfig
	, keys        = \c -> myKeys c `M.union` keys defaultConfig c
    }
  where
    myKeys (XConfig {modMask = mod4Mask}) = M.fromList $
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts)
      ]

myStartupHook = do
  spawnOnce "fcitx &"
  spawnOnce "picom &"
  spawnOnce "$HOME/.config/polybar/launch.sh"
  spawnOnce "nitrogen --restore"

