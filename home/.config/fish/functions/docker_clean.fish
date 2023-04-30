function docker_clean
  docker system prune -af
  docker system prune -af --volumes
end
