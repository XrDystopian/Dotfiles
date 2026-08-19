function auto_ls --on-variable PWD
    if test "$PWD" != "$HOME"
        ls
    end
end
