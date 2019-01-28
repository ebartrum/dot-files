function fish_user_key_bindings
  bind \co forward-word
  bind \ck up-or-search
  bind \cp accept-autosuggestion 
  bind \cq kill-whole-line
  bind \ch backward-kill-word
  fzf_key_bindings
end
