function fish_user_key_bindings
  bind \co forward-word
  bind \cn find_and_open
  bind \ck up-or-search
  bind \cp accept-autosuggestion 
  bind \cq kill-whole-line
  bind \ch backward-kill-word
  bind \c_ 'prevd >/dev/null; commandline -f repaint'
  bind \c] 'nextd >/dev/null; commandline -f repaint'
  fzf_key_bindings
end
