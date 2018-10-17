#!/usr/bin/env bash


devicons_folder="ranger_devicons"
devicons_loc="${__dotsan__home}/ranger/${devicons_folder}"


function __dotsan__ranger__init {
    case $1 in
        check)
            if command -v awesome > /dev/null; then
                return 0
            else
                echo 'ranger not installed'
                return 1
            fi
            ;;
        build)
            if [ ! -e "$devicons_loc" ]; then
                git clone git@github.com:alexanderjeurissen/ranger_devicons.git ${devicons_loc}
            fi
            pushd ${devicons_loc} > /dev/null
            git pull
            popd > /dev/null
            ;;
        install)
            mkdir -p "$HOME/.config/ranger/plugins"

            __dotsan__link ranger rc.conf .config/ranger/rc.conf

            __dotsan__link ranger ${devicons_folder}/devicons.py          .config/ranger/devicons.py
            __dotsan__link ranger ${devicons_folder}/devicons_linemode.py .config/ranger/plugins/devicons_linemode.py
            ;;
    esac
}