##### Adding Mission Control Space Indicators #####
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"; do
  sid="$(($i + 1))"
  space=(
    background.color=0x40ffffff
    background.corner_radius=5
    background.height=25
    click_script="yabai -m space --focus $sid"
    icon.padding_left=7
    icon.padding_right=7
    icon="${SPACE_ICONS[i]}"
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
    space="$sid"
  )
  sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
done
