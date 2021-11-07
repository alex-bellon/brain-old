for dir in $(find .. -maxdepth 2 -type d -not -path '*/\.*' | sed '1d'); do
    (
        cd $dir
        
        dirname=${PWD##*/}
        dirname=${dirname^}
        printf "# %s" "$dirname" > README.md
      
        subdirs=$(find . -maxdepth 1 -type d -not -path '*/\.*' | sed '1d')

        if [ "$subdirs" ]; then 
            printf "\n\n## Directories" >> README.md
        fi

        for subdir in */; do
            subdirname=${subdir::-1}
            if [ "$subdirname" != "*" ]; then
                printf "\n- [%s](%s)" "$subdirname" "$subdir" >> README.md
            fi
        done

        printf "\n\n## Files" >> README.md

        for file in $(ls -p | grep -v /); do
            filename=${file::-3}
            printf "\n- [%s](%s)" "$filename" "$file" >> README.md
        done

    )
done
