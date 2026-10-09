# TODO

- [ ] `etc/shell/zellij.bash`: `basename "$PWD"` forks at several call sites (zj, zja, zjn, zjk, zjd, __zellij_current_dir); use `${PWD##*/}`
- [ ] `install.sh`: `grep` calls missing `--` (lines ~54, 92, 93, 97, 239, 271)
- [ ] `install.sh`: inline comment on `return 0  # Already configured` (~240); move above the code
- [ ] `install.sh`: line ~103 exceeds 180 characters
- [ ] `install.sh`: non-standard exit codes (`exit 90`, `exit ${1:-4}`) and bare `|| return` (~73, 90, 105)
- [ ] `install.sh`: `basename "$plugin"` fork (~424); use `${plugin##*/}`
