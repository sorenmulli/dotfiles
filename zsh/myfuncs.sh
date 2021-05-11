panmark() {
    pandoc $1 -o /tmp/t.pdf
    xdg-open /tmp/t.pdf
}
del_conflicts() {
    find . -type f -name '*(conflicted\ copy\ *' -delete
}
