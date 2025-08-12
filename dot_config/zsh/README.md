# ZSH Configuration

## ZSH config-file load order

| File            | Login | Non-Login | Script |
| --------------- | :---: | :-------: | :----: |
| `/etc/zshenv`   |   A   |     A     |   A    |
| `~/.zshenv`     |   B   |     B     |   B    |
| `/etc/zprofile` |   C   |           |        |
| `~/.zprofile`   |   D   |           |        |
| `/etc/zshrc`    |   E   |     C     |        |
| `~/.zshrc`      |   F   |     D     |        |
| `/etc/zlogin`   |   G   |           |        |
| `~/.zlogin`     |   H   |           |        |
| _WORK SESSION_  |       |           |        |
| `~/.zlogout`    |   I   |           |        |
| `/etc/zlogout`  |   J   |           |        |
