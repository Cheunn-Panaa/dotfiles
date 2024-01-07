 `Cheunn-Panaa's dotfiles`

> ⚠️ Disclaimer! ⚠️
> Highly unstable, like creators mental state
                              
## Table of Contents

-   [`Cheunn-Panaa's dotfiles` ](#cheunn-panaas-dotfiles-)
    -   [Table of Contents](#table-of-contents)
    -   [What's it](#whats-it)
    -   [What's inside](#whats-inside)
 
 ## What's it

This is where I keep all my dotfiles and configs, and as well as all the tools I commonly use. 
Every time I set up a new Linux machine I can execute a single command to `bootstrap` a new system and pull down all of my dotfiles and configs.

> There are still some major scripting to be done for it to be a "total bootstrap" but the ground work is there already

## What's inside

A lot of stuff and you can check them out in the file browser above. Main components are:

-   [`Neovim`](https://neovim.io): You already know about vim, but do you know about the lord and savior NeoVim ? ![README](nvim/README.md)
-   [`Fish`](https://fishshell.com/docs/current/index.html): Fish is like bash but better:
    -   [`🌺Fisher`](https://github.com/jorgebucaran/fisher) Plugin management.
    -   ⚡️Basicly every completion i need for diverse purposes [`Fish completions`](fish/.config/fish/completions)
    -   🏎 Autosuggestions for most of commands (based on historic and autocompletion).
    -   🛸 Useful [`aliases`](fish/.config/fish/aliases).
    -   🛠 Global [`.gitignore`](git/.config/git/.gitignore) and [`.gitattributes`](git/.config/git/.gitattributes) files.
-   [`Alacritty`](`https://github.com/alacritty/alacritty`) An OpenGL Terminal emulator, way better than base terminal ofc.
-   [`Personnal`](personnal): Isn't obvious ?
-   [`Steeple`](steeple): Isn't obvious ?
-   [`bin`](bin): Anything in bin will get added to your `$PATH` and be made available everywhere.

> The rest should be concidered non-existent


** EVERYTHING IS MANAGED BY STOW AND THE SETUP / INSTALL SCRIPT **
