# only for reference, not used in this project
# zsh options parse
# https://gist.github.com/mattmc3/804a8111c4feba7d95b6d7b984f12a53
# https://xpmo.gitlab.io/post/using-zparseopts/
zparseopts_demo() {
    local flag_help flag_verbose
    local arg_filename=(myfile) # set a default
    local usage=(
        "zparseopts_demo [-h|--help]"
        "zparseopts_demo [-v|--verbose] [-f|--filename=<file>] [<message...>]"
    )

    # https://stackoverflow.com/a/63793601
    zmodload zsh/zutil
    zparseopts -D -F -K -- \
        {h,-help}=flag_help \
        {v,-verbose}=flag_verbose \
        {f,-filename}:=arg_filename ||
        return 1

    [[ -z "$flag_help" ]] || { print -l "${usage[@]}" && return; }

    # $#: number of arguments
    if (($#flag_verbose)); then
        print "verbose mode"
    fi

    echo "--verbose: $flag_verbose"
    echo "--filename: ${arg_filename[-1]}"
    echo "positional: $@"
}
