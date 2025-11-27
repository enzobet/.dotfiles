if not test -d /usr/local/go
    exit 1
end

set -x PATH /usr/local/go/bin $PATH
