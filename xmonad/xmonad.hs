import XMonad
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Layout.Spacing
import Graphics.X11.ExtraTypes.XF86

main = xmonad . withEasySB mySB defToggleStrutsKey . ewmhFullscreen . ewmh . docks $ myConf

mySB = statusBarProp "xmobar" (pure xmobarPP)

myConf = def
         { terminal = myTerminal
         , modMask = myModMask
         , layoutHook = myLayoutHook
         , manageHook = myManageHook <+> manageHook def
         }
         `removeKeys` [(myModMask, xK_p)]
         `additionalKeys` [((myModMask, xK_d), shellPrompt myShellConf)
                          ,((myModMask, xK_v), safeSpawn "emacsclient" ["-c", "-a", "emacs"])
                          ,((noModMask, xK_Print), unsafeSpawn "maim -s -u | xclip -selection clipboard -t image/png")
                          ,((noModMask, xF86XK_MonBrightnessUp), safeSpawn "brightnessctl" ["s", "+5%"])
                          ,((noModMask, xF86XK_MonBrightnessDown), safeSpawn "brightnessctl" ["s", "5%-"])
                          ,((noModMask, xF86XK_AudioRaiseVolume), safeSpawn "pactl" ["set-sink-volume", "@DEFAULT_SINK@", "+5%"])
                          ,((noModMask, xF86XK_AudioLowerVolume), safeSpawn "pactl" ["set-sink-volume", "@DEFAULT_SINK@", "-5%"])
                          ,((noModMask, xF86XK_AudioMute), safeSpawn "pactl" ["set-sink-mute", "@DEFAULT_SINK@", "toggle"])
                          ]

--myWorkspaces = ["stuff", "mesg"]

myTerminal = "kitty"

myShellConf = def
              { promptBorderWidth = 1
              , height = 32
              , font = "xft:Fantasque Sans Mono-11:normal"
              }

myModMask = mod4Mask

myLayoutHook = spacing 10 . avoidStruts . layoutHook $ def

myManageHook = composeAll . concat $
               [ [className =? c --> doFloat | c <- floatingClasses]
               , [(className =? "firefox" <&&> resource =? "Dialog") --> doFloat]
               , [isFullscreen -->  doFullFloat]
               ]
  where floatingClasses = ["confirm", "dialog", "download", "navigator",
                            "error", "notification", "file_progress",
                            "splash", "toolbar", "pinentry-gtk-2"]
