wip() {
  if [ "$1" = "up" ]; then
    git add . && git commit -m 'wip' && git push -f
  else
    git add . && git commit -m 'wip'
  fi
}

grd() {
  git rebase develop
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
    step=1
  else
    step="$*"
  fi

  current=$(git rev-parse --short HEAD)
  remote=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
  count=0
  hashes=()

  for hash in $(git rev-list --max-count=5 --abbrev-commit "$remote"); do
    count=$((count + 1)) # increment
    hashes+=("$hash")
    if [ "$hash" = "$current" ]; then
      break
    fi
  done

  if [ "$count" -le 1 ]; then
    echo "Can't move forward. No commit found."
  else
    git reset "${hashes[$count - $step]}"
  fi
}

down() {
  git reset HEAD~"$*"
}

submit() {
  repository=$(git remote -v | head -n 1)
  branch_name=$(git rev-parse --abbrev-ref HEAD)

  return
}

pr() {
  dir=${PWD##*/}
  remote=$(git config --get remote.origin.url)
  username=$(echo "$remote" | cut -d: -f2 | sed 's/\/.*//')
  repository=$(echo "$remote" | cut -d/ -f2 | sed 's/\.git//')
  branch_name=$(git rev-parse --abbrev-ref HEAD)

  if [ "$1" = "submit" ]; then
    if [[ $remote =~ 'github' ]]; then
      gh pr create --title "$branch_name" --assignee @me,thenu-ce --web --base develop
      # gh pr create --title "$branch_name" --assignee @me,dannyyassine-ce --web --base develop
    else
      open https://bitbucket.org/inagene/"$dir"/pull-requests/new\?source="$branch_name"\&t=1
    fi

    return
  fi

  if [ "$1" = "list" ]; then
    gh pr list --assignee pkboom --web

    return
  fi

  if [[ $remote =~ 'bitbucket' ]]; then
    open https://bitbucket.org/"$username"/"$repository"/src/develop
  elif [[ $remote =~ 'clearestate' ]]; then
    gh pr view --web
  fi
}

repo() {
  remote=$(git config --get remote.origin.url)
  username=$(echo "$remote" | cut -d: -f2 | sed 's/\/.*//')
  repository=$(echo "$remote" | cut -d/ -f2 | sed 's/\.git//')

  if [[ $remote =~ 'bitbucket' ]]; then
    open https://bitbucket.org/"$username"/"$repository"/src/develop
  else
    open https://github.com/"$username"/"$repository"
  fi
}

# go to clickup.com
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

# create a tag
gtp() {
  new_tag=$1

  if [ -z "$1" ]; then
    # implode with '.'
    IFS='.' read -rA tag <<<"$(git describe --abbrev=0 --tags)"

    if [ -z "$tag" ]; then
      new_tag='0.0.1'

      echo "✓ New tag created. $new_tag"
    else
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
  fi

  git tag "$new_tag" && git push --tags
}
