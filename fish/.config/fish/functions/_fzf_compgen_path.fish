function _fzf_compgen_path
    # The first argument is the base path to start traversal
    fd --hidden --exclude .git . $argv[1]
end 