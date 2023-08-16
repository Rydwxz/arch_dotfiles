import Xmobar

config :: Config
config =
 defaultConfig
  {
    font = "ShureTechMono Nerd Font 13"
  , bgColor = "#000000"
  , fgColor = "#ffffff"
  , alpha = 100
  , position = TopH 20
  , commands =
    [
      Run XMonadLog
    , Run $ MultiCpu  [] 10
    , Run $ MultiCoreTemp [] 10
    , Run $ Date "%I:%M %a %b %d" "date" 10
    , Run $ Memory ["t", "Mem: <usedratio>%"] 10
    ]
  , template = "%date%   %XMonadLog% }{ %multicoretemp% %multicpu% %memory%"
  }

main :: IO ()
main = xmobar config  -- or: configFromArgs config >>= xmobar
