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

balias g git # キーバインドの下あたりに追記

