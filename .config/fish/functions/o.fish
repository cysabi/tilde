function o
    # get the directory to open
    set -f FP (realpath .)
    if test (count $argv) = 1
        set -f FP (realpath $argv)
    end

    # translate path to valid file explorer path
    if string match -rq "^/mnt/c/" $FP
        set -f FP (string replace -r "^/mnt/c/" "C:/" $FP)
    else
        set -f FP (string join "" "//wsl.localhost/$WSL_DISTRO_NAME" $FP)
    end

    set -f FP (string replace -a "/" "\\" $FP)
    explorer.exe $FP
end
