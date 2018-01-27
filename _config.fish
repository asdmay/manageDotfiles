function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

function fish_prompt
  if [ $status -eq 0 ]
    set status_face (set_color green)"U・x・U < "
  else
    set status_face (set_color blue)"U；x；U < "
  end

  set prompt (set_color yellow)(prompt_pwd)

    echo $prompt
    echo $status_face
end

function fish_prompt
  test $SSH_TTY
  and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
  test $USER = 'root'
  and echo (set_color red)"#"

  # Main
  echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '

  # Git
  set last_status $status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

balias g git # キーバインドの下あたりに追記

