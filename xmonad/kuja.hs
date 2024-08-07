import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Dmenu
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS
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

screenshotScreen = do
    spawn "scrot -s ~/Pictures/screenshot.png &"

myLayout = tiled |||  Full
tiled = Tall 1 (3.0/100.0) (1.0/2.0)
mySB0 = statusBarProp "xmobar -x 0" (pure xmobarPP)
mySB1 = statusBarProp "xmobar -x 1" (pure xmobarPP)

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ withEasySB (mySB0 <> mySB1) defToggleStrutsKey myConfig

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys = [("M-S-q", quitWithWarning)
    ,("M-S-l", lockScreen)
    ,("M-S-s", screenshotScreen)
    ,("M-n", nextScreen)
    ,("M-S-n", shiftNextScreen)
    ,("M-f", spawn "firefox")
    ,("M-h", windows W.focusMaster)
    ,("M-l", windows W.focusDown)
    ] ++ 
    [ (otherModMasks ++ "M-" ++ [key], action tag)
      | (tag, key)  <- zip myWorkspaces "123456789"
      , (otherModMasks, action) <- [ ("", windows . W.view) -- was W.greedyView
                                      , ("S-", windows . W.shift)]
    ]

myConfig = def
        { terminal    = "alacritty"
        , modMask     = mod4Mask
        , borderWidth = 4
        , focusedBorderColor = "#138029"
        , startupHook = myStartupHook
        , layoutHook = myLayout
        }
  `additionalKeysP` myKeys
