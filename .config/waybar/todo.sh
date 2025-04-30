TASKS=$(awk '
/^--==-- / {
  # When we hit a new category line, print the previous category and tasks if any
  if (show && printed_tasks) {
    printf "\\n"
  }
  cat = $0
  sub(/^--==-- /, "", cat)
  show = 1
  printed_category = 0
  printed_tasks = 0
  next
}
/^==--== DONE/ {
  show = 0
  next
}
show && !/DONE/ && !/^--==-- / && NF > 0 {
  if (!printed_category) {
    printf "<span color=\\\"#ffcc66\\\" font-size=\\\"x-large\\\">%s</span>\\n", cat
    printed_category = 1
  }
  printf " • <span font-size=\\\"large\\\">%s</span>\\n", $0
  printed_tasks = 1
}
END {
  if (show && printed_tasks) {
    printf "\\n"
  }
  # Print a final real newline for clean output (optional)
  printf "\n"
}
' ~/.emacs.d/todo/personal.todo)

echo '{"tooltip": "'$TASKS'"}'