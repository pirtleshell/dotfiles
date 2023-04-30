alias ls "ls -G"
abbr ll "ls -alF"
abbr la "ls -AG"
abbr l "ls -CF"

# i suck at typing
abbr got "git"
abbr gti "git"
function gut
  echo 'hungry?' && git $argv
end

# misc nav
abbr .. "cd .."
abbr - "cd -"

# TODO cdx

# find a file with a pattern in name
function ff
  find . -type f -iname '*'$argv'*' -ls ;
end

# find a directory with a pattern in name
function fd
  find . -type d -iname '*'$argv'*' -ls ;
end

# misc applications
abbr dc "docker-compose"
abbr tf "terraform"
abbr tg "terragrunt"
