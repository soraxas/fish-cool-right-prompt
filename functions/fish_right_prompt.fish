
# copy the current fish prompt, and wrap it to save pipe status
functions -q __original_fish_prompt || functions -c fish_prompt __original_fish_prompt
# we limits outself on what we perform in this wrapped fish_prompt.
# we won't modify $stats as we are only performing set (i.e. won't affect most prompt).
# However, `set` would modify $pipestatus though
# (see github.com/fish-shell/fish-shell/issue/6815)
function fish_prompt
  set -g last_pipestatus $pipestatus
  __original_fish_prompt $argv
end

function fish_right_prompt
  # print ranger level with our helper function
  __print_ranger_level
  if not set -q last_pipestatus
    # pipe status not set!
    # Check if you have this at the beginning of the normal prompt
    # set -g last_pipestatus $pipestatus
    set_color red
    echo Invalid setup!
    set_color normal

  else
    # print pipe status.
    # taken from official fish prompt
    __fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) \
        (set_color --bold $fish_color_status) $last_pipestatus
    # erase it so we know if it is properly set next time
    set -e last_pipestatus
  end
end
