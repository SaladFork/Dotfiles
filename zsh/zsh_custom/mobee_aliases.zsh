alias jenkins='ssh -p 2203 elad@arya.getmobee.com'

function mga() {
    COMMAND="$@"

    local OWD="$(pwd)"

    for REPO in $(find "$HOME/Developer/Mobee" -maxdepth 2 -type d -execdir test -d {}/.git \; -print -prune); do
        PROJECT=$(basename ${REPO})

        cd "${REPO}"
        echo
        echo "~~ ${PROJECT} ~~"
        git $COMMAND
    done

    cd "$OWD"
}
