function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

function fish_prompt
  if [ $status -eq 0 ]
    set status_face (set_color FFE6EB)"U・x・U < "
  else
    set status_face (set_color FFE6EB)"U；x；U < "
  end

  set prompt (set_color yellow)(prompt_pwd)

    echo $prompt
    echo $status_face

  test $SSH_TTY
  and printf (set_color ECFEFF)$USER(set_color 00B7C2)'@'(set_color 128494)(prompt_hostname)' '
  test $USER = 'root'
  and echo (set_color E7475E)"#"

  # Main
  echo -n (set_color cyan)(prompt_pwd) (set_color ECFEFF)'❯'(set_color 00B7C2)'❯'(set_color 128494)'❯ '

  # Git
  set last_status $status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

balias g git # キーバインドの下あたりに追記

