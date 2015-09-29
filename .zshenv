# Strip leading symbols (used by Git)
function stripdiff() {
  color_code_regex=$'(\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])'
  sed -E "s/^($color_code_regex)diff --git .*$//g" | \
     sed -E "s/^($color_code_regex)index .*$/\
\1$(rule)/g" | \
     sed -E "s/^($color_code_regex)\+\+\+(.*)$/\1\+\+\+\5\\
\1$(rule)/g" | \
     sed -E "s/^($color_code_regex)[\+\-]/\1 /g"
}

# Print horizontal rule (used by Git)
rule () {
  printf "%$(tput cols)s\n" | tr " " "─"
}
