function cd --description 'cd, falling back to zoxide when the literal path doesn'\''t exist'
    if test (count $argv) -eq 0
        builtin cd $HOME
    else if test -d "$argv[1]"
        builtin cd $argv[1]
    else
        z $argv
    end
end
