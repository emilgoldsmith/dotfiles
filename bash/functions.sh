function encrypt () {
    # crypten - a script to encrypt files using openssl
    
    FNAME=$1
    
    if [[ -z "$FNAME" ]]; then
        echo "crypten <name of file>"
        echo "  - crypten is a script to encrypt files using des3"
    else
        pv "$FNAME" | openssl des3 -md sha256 -salt -out "$FNAME.des3"
    fi
}

function decrypt () {
    # cryptde - a script to decrypt files using openssl
    
    FNAME=$1
    
    if [[ -z "$FNAME" ]]; then
        echo "cryptde <name of file>"
        echo "  - cryptde is a script to decrypt des3 encrypted files"
    else
        pv "$FNAME" | openssl des3 -md sha256 -d -salt -out "${FNAME%.[^.]*}"
    fi
}

function delete-stale-local-git-branches () {
    git remote prune origin
    STALE_BRANCHES=$(git branch -vv | grep '\[.*/.*: gone\]' | awk '{print $1}')
    
    printf "Your stale branches are:\n"
    printf "$STALE_BRANCHES\n"
    
    printf "Are you sure you wish to delete these branches? [N/y]: "
    
    read REPLY
    
    if [[ $REPLY == 'y' ]];
    then
        echo $STALE_BRANCHES | xargs git branch -D
    fi
}

function disable-trackpoint () {
    PROP_NUMBER=$(xinput list-props "TPPS/2 IBM TrackPoint" | grep "Device Enabled" | sed 's/.*(\([0-9]*\)).*/\1/')
    xinput set-prop "TPPS/2 IBM TrackPoint" $PROP_NUMBER 0
}

function enable-trackpoint () {
    PROP_NUMBER=$(xinput list-props "TPPS/2 IBM TrackPoint" | grep "Device Enabled" | sed 's/.*(\([0-9]*\)).*/\1/')
    xinput set-prop "TPPS/2 IBM TrackPoint" $PROP_NUMBER 1
}

function running-calculator () {
    python ~/dotfiles_helpers/scripts/running-calculator.py
}

function wait-for-internet () {
    IS_UP=1
    while [ $IS_UP -ne 0 ]
    do
        sleep 1
        ping google.com -c 1
        IS_UP=$(echo $?)
    done
}

function ogv-to-mp4 () {
    FNAME=$1
    
    if [[ -z "$FNAME" ]]; then
        echo "ogv-to-mp4 <name of file>"
        echo "  - ogv-to-mp4 is a script to convert ogv files to mp4 files"
    else
        echo "${FNAME%.[^.]*}.mp4"
        
        ffmpeg -i "$FNAME" \
        -c:v libx264 -preset veryslow -crf 22 \
        -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
        "${FNAME%.[^.]*}.mp4"
    fi
}

function py () {
    version=$(python --version 2>&1)
    if [[ $version == "Python 3."* ]]; then
        python $@
    else
        python3 $@
    fi
}

function commit_any_dotfile_changes () {
    # Don't commit any changes if we're in a VSCode remote container
    if [[ -n $REMOTE_CONTAINERS ]];
    then
        return 0
    fi
    # Save current directory so we can return to it
    current_dir=$(pwd)
    # Enter the dotfiles dir to check for any changes
    functions_file=$(realpath "${BASH_SOURCE[0]}")
    dotfiles_dir=$(dirname $functions_file)/..
    cd "$dotfiles_dir"
    
    # This has exit code one if there are any differences
    output=$(git status --porcelain) && [ -z "$output" ]
    if [[ $? == "1" ]]; then
        # It has changes
        echo "Changes discovered in your dotfiles repo. Waiting for internet to be able to commit and push the changes to the remote"
        wait-for-internet
        echo "Stashing and pulling latest changes first"
        set -e
        git stash
        git pull
        git stash apply
        set +e
        echo "The following changes are what will be committed to the dotfiles repo:"
        sleep 1.5
        git --no-pager diff
        git status
        sleep 3
        git add -A
        git commit -m "Automatic commit for changes of dotfiles"
        git push
    fi
    # Return to the directory you were in before
    cd "$current_dir"
}

function commitAll() {
    git add -A && git commit -m "$1"
}

function codeforces_contest_ratings() {
    curl "https://codeforces.com/api/contest.standings?contestId=$1&from=1&count=1&showUnofficial=false" | node -e "const x = JSON.parse(require('fs').readFileSync('/dev/stdin', 'utf-8').toString());\
    console.log({contestName: x.result.contest.name, problems: x.result.problems.map(y => ({name: y.name, rating: y.rating}))});"
}


function handle_dot_nvm_file () {
    nvm use &> /dev/null
    retVal=$?
    if [ $retVal -eq 3 ]; then
        nvm install;
    fi
    if [ $retVal -eq 0 ]; then
        echo "Node version applied via .nvmrc"
    fi
    if [[ $retVal -ne 3 && $retVal -ne 0 ]]; then
        nvm use default &> /dev/null
    fi
}

# Make sure we also check on initialization
handle_dot_nvm_file

function cd () {
    builtin cd "$@"
    handle_dot_nvm_file
}

webmToMp4 () {
    base=$(basename "$1" .webm)
    ffmpeg -i "$1" -qscale 0 "$base".mp4
}
