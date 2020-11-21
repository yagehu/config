import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce
import System.IO

myStartupHook = do
    spawnOnce "polybar default"

main = do
    xmonad $ docks defaultConfig
	    { layoutHook  = avoidStruts $ layoutHook defaultConfig
		, modMask     = mod4Mask
		, startupHook = myStartupHook <+> startupHook defaultConfig
		}

