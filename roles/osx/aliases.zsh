alias cask="brew cask"
alias services="brew services"

function sha256() {
  shasum -a 256 $1 | head -1 | grep -o '^\S\+'
}

# Type 'tw' on the terminal to open TextWrangler
alias tw='open -a /Applications/TextWrangler.app'
# Fix Camera when the computer comes back from sleep.
alias fixcam='sudo killall VDCAssistant'
# Display a notification with a given message
alias growl="terminal-notifier -message"
# Useful for notifying when a long script finishes
alias yell="terminal-notifier -title WOOOO -message OOOO!!!"
# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update!='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
# When you need disk space
alias cleanup!='brew cleanup --force; brew cask cleanup;'

github_create_pullrequest() {
    BRANCH_DESTINATION="master"
    if [ -n "$2" ]
    then
        BRANCH_DESTINATION=$2
    fi

    echo "Creating PR to:" $BRANCH_DESTINATION
    echo "You have 5 seconds to cancel"

    for i in `seq 1 5`;
    do
        sleep 1
        echo "."
    done

    if [ -n "$1" ]
    then
        git branch > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            REPO=`git config --get remote.origin.url`
            if [[ "$REPO" =~ "github.com" ]]
            then
                OWNER=`echo $REPO | sed s/git@github.com://g | sed 's/\/.*//g'`
                BRANCH=`git branch | sed -n '/\* /s///p'`
                echo "hub pull-request -i $1 -b $OWNER:$BRANCH_DESTINATION -h $OWNER:$BRANCH"
                hub pull-request -i $1 -b $OWNER:$BRANCH_DESTINATION -h $OWNER:$BRANCH
            else
                echo "This is not a GitHub repo"
            fi
        else
            echo "You are not under a git repo"
        fi
    else
        echo "You have to provide one parameter with the issue number"
    fi
}

# Pull Request
alias pr="github_create_pullrequest"
