panmark() {
    pandoc $1 -o /tmp/t.pdf
    xdg-open /tmp/t.pdf
}
