set shell := ["zsh", "-uc"]
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

alias S := stow
alias D := delete
alias R := restow

home_dir := if os_family() == "windows" { "" } else { "~" }
root_dir := if os_family() == "windows" { "" } else { "/" }

# List all available recipes
_list:
    @just --list

# Stow the packages that follow this option into the target directory. ARGS: [`--no`]
stow *ARGS:
    stow -v --adopt --no-folding --dotfiles -t {{ home_dir }} -S @home {{ ARGS }}

# Unstow the packages that follow this option from the target directory rather than installing them. ARGS: [`--no`]
delete *ARGS:
    stow -v --adopt --no-folding --dotfiles -t {{ home_dir }} -D @home {{ ARGS }}

# Restow packages (first unstow, then stow again). ARGS: [`--no`]
restow *ARGS:
    stow -v --adopt --no-folding --dotfiles -t {{ home_dir }} -R @home {{ ARGS }}
