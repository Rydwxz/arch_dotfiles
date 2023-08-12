import Xmobar

config :: Config
config =
 defaultConfig
  {
    font = "ShureTechMono Nerd Font 16"
  , alpha = 200
  , commands =
    [
      Run XMonadLog
    , Run $ Memory ["t", "Mem: <usedratio>%"] 10
    ]
  , template = "%XMonadLog% }{ %memory%"
  }

main :: IO ()
main = xmobar config  -- or: configFromArgs config >>= xmobar
