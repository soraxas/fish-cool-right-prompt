function __print_ranger_level
  # Ranger indicator
  # ₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎ₐₑₒₓ
  # ⁰¹²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿⁱ
  if set -q RANGER_LEVEL
    # orange and white, from ranger's logo color
    # we will use no background and orange font
    set_color --bold df661c

    # commented is orange background and white font
    #set_color -b df661c; set_color --bold ebebeb

    echo R
    switch $RANGER_LEVEL
      case '1'
        echo ¹
      case '2'
        echo ²
      case '3'
        echo ³
      case '4'
        echo ⁴
      case '5'
        echo ⁵
      case '*'
      echo ⁵⁺
    end
    set_color normal

    echo " "
  end
end
