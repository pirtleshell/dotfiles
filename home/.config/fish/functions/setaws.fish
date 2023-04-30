function setaws
  set -xg AWS_PROFILE $argv[1]
  set -xg AWS_REGION $argv[2]
  echo 'aws env variables set'
  whoaws
end
