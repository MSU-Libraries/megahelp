_megahelp_silence()
{
    shopt -s nullglob
    COMPREPLY=()
    CURRENT="${COMP_WORDS[$COMP_CWORD]}"

    if [[ $COMP_CWORD -eq 1 ]]; then
        FLAGS=( -c --controller -s --search -b --binary -h --help )
        COMPREPLY=( $(compgen -W "${FLAGS[*]}" -- "$CURRENT") )
    fi
    shopt -u nullglob
    return 0
}
complete -F _megahelp_silence megahelp-silence

_megahelp_report()
{
    shopt -s nullglob
    COMPREPLY=()
    CURRENT="${COMP_WORDS[$COMP_CWORD]}"

    if [[ $COMP_CWORD -eq 1 ]]; then
        FLAGS=( -c --controller -s --search -b --binary -h --help -g --ghs -e --email -a --address -p --only-on-problem )
        COMPREPLY=( $(compgen -W "${FLAGS[*]}" -- "$CURRENT") )
    fi
    shopt -u nullglob
    return 0
}
complete -F _megahelp_report megahelp-report
