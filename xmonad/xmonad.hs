import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Dmenu
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import System.Exit
import Control.Monad

quitWithWarning :: X ()
quitWithWarning = do
    let m = "confirm quit"
    s <- dmenu [m]
    when (m == s) (io exitSuccess)

myStartupHook = do
    spawnOnce "feh --bg-scale ~/Documents/repos/wallpapers/images/low_poly_landscape.png &"
    spawnOnce "picom &"

lockScreen = do
    spawn "betterlockscreen -l &"

main = do
    xmproc <- spawnPipe "xmobar -x 0 /home/ed/.config/xmobar/xmobarrc"
    xmonad $ def
        { terminal    = "alacritty"
        , modMask     = mod4Mask
        , borderWidth = 4
        , focusedBorderColor = "#138029"
        , startupHook = myStartupHook
        }
        `additionalKeysP`
                    [("M-S-q", quitWithWarning)
                    ,("M-S-l", lockScreen)
                    ,("M-f", spawn "firefox")
                    ]
