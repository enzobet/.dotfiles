function envsource
  set -l envfile $argv[1]

  if not test -f $envfile
    echo "File $envfile does not exist"
    return 1
  end

  while read line
        if not string match -qr '^#|^$' "$line" # skip empty lines and comments
            if string match -qr '=' "$line" # if `=` in line assume we are setting variable.
                set item (string split -m 1 '=' $line)
                set key_items (string split ' ' $item[1])
                if count $key_items > 1
                    set key $key_items[2]
                else
                    set key $item[1]
                end
                set item[2] (eval echo $item[2]) # expand any variables in the value
                set -gx $key $item[2]
            else
                eval $line # allow for simple commands to be run e.g. cd dir/mamba activate env
            end
        end
    end < "$envfile"
end
