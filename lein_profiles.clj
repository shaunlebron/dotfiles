{
  :user {
    :repl-options {
      ; color the prompt and precede with newline
      ; source: http://stackoverflow.com/a/16525564/142317
      :prompt (fn [ns] (str "\n\033[1;32m" ns "=>" "\033[0m "))
    }
  }
}
