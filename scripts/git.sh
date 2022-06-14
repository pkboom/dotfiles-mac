wip() {
  if [ "$1" = "up" ]; then
    git add . && git commit -m 'wip' && git push -f
  else
    git add . && git commit -m 'wip'
  fi
}

grd() {
  git stash -u

  git rebase development

  git stash pop
}

formatting() {
  if [ "$1" = "up" ]; then
    git add . && git commit -m 'formatting' && git push
  else
    git add . && git commit -m 'formatting'
  fi
}

up() {
  if [ -z "$*" ]; then
    STEP=1
  else
    STEP="$*"
  fi

  CURRENT=$(git rev-parse --short HEAD)

  HASHES=($(git log --oneline --all --graph | awk '{print $2}'))

  for ((i = ${#HASHES[@]}; i > 0; i--)); do
    if [ "${HASHES[$i]}" = "$CURRENT" ]; then
      break
    fi
  done

  if [ "$i" -le 1 ]; then
    echo "Can't move forward. No commit found."
  else
    git reset "${HASHES[$i - STEP]}"
  fi
}

down() {
  git reset HEAD~"$*"
}

submit() {
  DIR=${PWD##*/}

  REPOSITORY=$(git remote -v | head -n 1)

  if [[ $REPOSITORY =~ 'github' ]]; then
    echo 'github'
  else
    open https://bitbucket.org/inagene/"$DIR"/pull-requests/new\?source="$(git rev-parse --abbrev-ref HEAD)"\&t=1
  fi

  return
}

repo() {
  remote=$(git config --get remote.origin.url)
  username=$(echo "$remote" | cut -d: -f2 | sed 's/\/.*//')
  repository=$(echo "$remote" | cut -d/ -f2 | sed 's/\.git//')

  if [[ $remote =~ 'bitbucket' ]]; then
    open https://bitbucket.org/"$username"/"$repository"/src/development
  elif [[ $remote =~ 'clearestate' ]]; then
    open https://github.com/"$username"/"$repository"/pulls/@me
  else
    open https://github.com/"$username"/"$repository"
  fi
}

click() {
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  task_id=$(echo "$branch_name" | cut -d_ -f1)
  clickup_id=10531418

  if ! [[ $task_id =~ (PRO|DEV|RES) ]]; then
    open https://app.clickup.com/"$clickup_id"
  else
    open https://app.clickup.com/t/"$clickup_id"/"$task_id"
  fi

}

gtp() {
  new_tag=$1

  if [ -z "$1" ]; then
    IFS='.' read -rA tag <<<"$(git describe --abbrev=0 --tags)"

    old_tag=$(
      IFS='.'
      echo "${tag[*]}"
    )
    new_tag_last=$((${tag[-1]} + 1))

    length=${#tag[@]}

    tag_without_last=("${tag[@]:0:(($length - 1))}")

    tag=($tag_without_last $new_tag_last)

    new_tag=$(
      IFS='.'
      echo "${tag[*]}"
    )

    echo "✓ New tag created. $old_tag ==> $new_tag"
  fi

  git tag "$new_tag" && git push --tags
}
