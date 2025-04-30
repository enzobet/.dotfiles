function _fzf_compgen_dir
    # The first argument is the base path to start traversal
    fd --type=d --hidden --exclude .git . $argv[1]
end 