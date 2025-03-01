import XMonad

import XMonad.StackSet (greedyView, shift)

-- Actions
import XMonad.Actions.CycleWS (toggleWS)

-- Hooks
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Hooks.InsertPosition (Focus (Newer), Position (End), insertPosition)
import XMonad.Hooks.ManageDocks -- (ToggleStruts, avoidStruts)
import XMonad.Hooks.ManageHelpers (isDialog)
import XMonad.Hooks.StatusBar (defToggleStrutsKey, statusBarProp, withEasySB, withSB)
import XMonad.Hooks.StatusBar.PP (PP, ppCurrent, ppExtras, ppHidden, ppHiddenNoWindows, ppOrder, ppSep, ppTitleSanitize, ppUrgent, shorten, wrap, xmobarBorder, xmobarColor, xmobarRaw, xmobarStrip)
import XMonad.Hooks.WindowSwallowing

-- Layouts
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.Renamed (Rename (Replace), renamed)
import XMonad.Layout.Spacing (smartSpacingWithEdge)
import XMonad.Layout.ToggleLayouts -- (ToggleLayout, toggleLayouts)

-- Utils
import XMonad.Util.Cursor (setDefaultCursor)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Loggers (logTitles)
import XMonad.Util.SpawnOnce (spawnOnce)

-- import XMonad.Util.ClickableWorkspaces

--------------------------------------------------------------------------------
-- myXmonad

myTerminal = "wezterm"
myTerminalClass = "org.wezfurlong.wezterm"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth = 3

-- Rebind Mod to the Super key
myModMask = mod4Mask

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
myWorkspaceKeys = [xK_u, xK_e, xK_o, xK_a, xK_p, xK_period, xK_comma, xK_semicolon, xK_y]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor = "#282828"
myFocusedBorderColor = "#928374"

--------------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf =
    [ ((myModMask, xK_apostrophe), kill)
    , ((myModMask, xK_Tab), toggleWS)
    , ((myModMask, xK_b), sendMessage ToggleStruts)
    , ((myModMask, xK_f), sendMessage ToggleLayout)
    ]
        ++ [ ((m .|. myModMask, k), windows $ f i)
           | (i, k) <- zip (XMonad.workspaces conf) myWorkspaceKeys
           , (f, m) <-
                [ -- M-key: Switch to Nth workspace
                  (greedyView, 0)
                , -- M-S-key: Move window to Nth workspace
                  (shift, shiftMask)
                ]
           ]

--------------------------------------------------------------------------------
-- Layouts:
--
myLayoutHook = toggleLayouts full (avoidStruts (tall ||| fat ||| full))
  where
    tall = renamed [Replace "Tall"] $ common $ Tall nmaster delta ratio
    fat = renamed [Replace "Fat"] $ common $ Mirror tall
    full = renamed [Replace "Full"] $ noBorders Full
    -- common config for layouts
    common layout = smartBorders $ smartSpacingWithEdge 3 $ layout
    -- Default number of windows in the master pane
    nmaster = 1
    -- Percent of screen to increment by when resizing panes
    delta = 5 / 100
    -- Default proportion of screen occupied by master pane
    ratio = 6 / 10

--------------------------------------------------------------------------------
-- Window rules:
--
myManageHook :: ManageHook
myManageHook =
    composeAll
        [ isDialog --> doFloat
        , className =? "Brave-browser" --> doShift "2"
        , className =? "Code - Insiders" --> doShift "3"
        , className =? "Code" --> doShift "3"
        , className =? "Emacs" --> doShift "3"
        , className =? "Firefox" --> doShift "2"
        , className =? "Firefox" <&&> title =? "Picture-in-Picture" --> doFloat
        , className =? "Gimp" --> doFloat
        , className =? "Morgen" --> doShift "6"
        , className =? "Notion" --> doShift "5"
        , className =? "Qalculate-gtk" --> doFloat
        , className =? "Spotify" --> doShift "8"
        , className =? "VSCodium" --> doShift "3"
        , className =? "ZapZap" --> doShift "7"
        , className =? "discord" --> doShift "7"
        , className =? "neovim" --> doShift "3"
        , className =? "todoist-nativefier-409272" --> doShift "6"
        ]
        -- Insert new Window at End while focusing it
        <+> insertPosition End Newer

--------------------------------------------------------------------------------
-- Handle Event Hook

-- myHandleEventHook :: HandleEventHook
myHandleEventHook = swallowEventHook (className =? "Alacritty" <||> className =? myTerminalClass) (return True)

--------------------------------------------------------------------------------
-- Startup hook

myStartupHook :: X ()
myStartupHook = do
    setDefaultCursor xC_left_ptr

-- TODO: Add an app tray
--
-- spawnOnce
--     "trayer --edge top --align right --SetDockType true \
--     \--SetPartialStrut true --expand true --width 10 \
--     \--transparent true --tint 0x5f5f5f --height 18"

--------------------------------------------------------------------------------
-- Xmobar

myXmobarPP :: PP
myXmobarPP =
    def
        { ppSep = magenta " • "
        , ppTitleSanitize = xmobarStrip
        , ppCurrent = xmobarColor "#282828" "#EBDBB2" . wrap "[" "]" -- . xmobarBorder "Bottom" "#8be9fd" 2
        , ppHidden = white . wrap "" ""
        , ppHiddenNoWindows = lowWhite . wrap "" ""
        , ppUrgent = red . wrap (yellow "!") (yellow "!")
        , ppExtras = [logTitles formatFocused formatUnfocused]
        , ppOrder = \[ws, l, _, wins] -> [ws, l, wins]
        }
  where
    formatFocused = wrap (white "[") (white "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow

    -- \| Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta = xmobarColor "#ff79c6" ""
    blue = xmobarColor "#bd93f9" ""
    white = xmobarColor "#f8f8f2" ""
    yellow = xmobarColor "#f1fa8c" ""
    red = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

myStatusBar = withSB (statusBarProp "xmobar" $ pure myXmobarPP)

-- myStatusBar = withEasySB (statusBarProp "xmobar" $ pure myXmobarPP) defToggleStrutsKey
--   where
--     toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
--     toggleStrutsKey XConfig{modMask = m} = (m, xK_b)

--------------------------------------------------------------------------------
-- Main

main :: IO ()
main =
    xmonad
        . ewmh
        . myStatusBar
        $ myConfig

myConfig =
    def
        { terminal = myTerminal
        , modMask = myModMask
        , layoutHook = myLayoutHook
        , manageHook = myManageHook
        , handleEventHook = myHandleEventHook
        , startupHook = myStartupHook
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        }
        `additionalKeys` (myKeys myConfig)
