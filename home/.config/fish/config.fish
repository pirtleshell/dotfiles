if status is-interactive
  starship init fish | source

  function source_if_exists --description 'Source a file if it exists'
    if test -s $argv
      fish $argv
    end
  end

  ### Docker ###
  # fast & pretty docker
  # https://www.docker.com/blog/solving-docker-compose-performance-on-macos-catalina/
  set -gx DOCKER_BUILDKIT 1
  set -gx COMPOSE_DOCKER_CLI_BUILD 1

  ### asdf Tool Version Manager ###
  # http://asdf-vm.com/guide/getting-started.html
  source_if_exists ~/.asdf/asdf.fish

  ### brew ###
  if [ -e /opt/homebrew/bin/brew ]
      eval "$(/opt/homebrew/bin/brew shellenv)"
  end

  ### go-installed bins ###
  fish_add_path $HOME/go/bin

  ####
  # Support local machine overrides for anything!
  ####
  source_if_exists ~/.localrc
end
