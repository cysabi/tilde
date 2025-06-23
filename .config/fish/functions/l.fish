function l --wraps="lf"
    cd "$(command lf -print-last-dir $argv)"
end
