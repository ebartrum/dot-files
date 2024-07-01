import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Dmenu
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import System.Exit
import Control.Monad

quitWithWarning :: X ()
quitWithWarning = do
    let m = "confirm quit"
    s <- dmenu [m]
    when (m == s) (io exitSuccess)

myStartupHook = do
    spawnOnce "feh --bg-scale ~/Documents/repos/wallpapers/images/low_poly_landscape.png &"
    spawnOnce "picom --config ~/.config/picom.conf &"

lockScreen = do
    spawn "betterlockscreen -l &"

myLayout = tiled |||  Full
    where tiled = Tall 1 (3/100) (1/2)
mySB = statusBarProp "xmobar" (pure xmobarPP)

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ withEasySB mySB defToggleStrutsKey myConfig

myConfig = def
        { terminal    = "alacritty"
        , modMask     = mod4Mask
        , borderWidth = 4
        , focusedBorderColor = "#138029"
        , startupHook = myStartupHook
        , layoutHook = myLayout
        }
  `additionalKeysP`
	    [("M-S-q", quitWithWarning)
	    ,("M-S-l", lockScreen)
	    ,("M-f", spawn "firefox")
	    ]
