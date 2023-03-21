# WSL
if ! [[ $(grep -i microsoft /proc/version) ]]; then
    return
fi

export BROWSER=wslview
alias pbcopy="clip.exe"
