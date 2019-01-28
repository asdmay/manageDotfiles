function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

# git

set git_dirty_color E7475E
set git_not_dirty_color A2EF44

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $git_not_dirty_color)$branch(set_color normal)
  end
end

# prompt

function fish_prompt
  if [ $status -eq 0 ]
    set status_face "U・x・U < "
  else
    set status_face "U；x；U < "
  end

   set -l git_dir (git rev-parse --git-dir 2> /dev/null)
   set prompt (set_color 6A65D8)(prompt_pwd)

   if test -n "$git_dir"
     echo $prompt "[> "(parse_git_branch)
     echo $status_face
   else
     echo $prompt
     echo $status_face
   end
 end

set PATH /usr/local/bin $PATH
