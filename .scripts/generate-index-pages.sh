for dir in $(find .. -maxdepth 2 -type d -not -path '*/\.*' | sed '1d'); do
    (
        cd $dir
        
        dirname=${PWD##*/}
        printf "# %s" "$dirname" > README.md
       
        printf "\n\n## Directories" >> README.md

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
