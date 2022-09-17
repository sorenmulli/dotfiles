panmark() {
    pandoc $1 -o /tmp/t.pdf
    xdg-open /tmp/t.pdf
}
del_conflicts() {
    find . -type f -name '*(conflicted\ copy\ *' -delete -print
}
krefresh() {
    kquitapp5 plasmashell && kstart5 plasmashell &
}

hpc() {
    ssh -i ~/.ssh/gbar s183911@login.hpc.dtu.dk
}
