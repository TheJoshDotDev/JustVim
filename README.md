![Screenshot 2023-07-17 at 10 35 05 AM](https://github.com/Rumone/JoshNvim/assets/63555633/6ecb34ac-690e-4f0e-8055-3bdfacf92b03)
> If you can't read the banner it says "Just.Vim". [Home art](https://ascii.today/)

# 🫣 JustVim

This neovim config serves to help people who are already in the neovim ecosystem but don't want to setup nvim themselves.
> The keybinds are very oppinionated

## Installation
> Note: If you currently have a neovim setup that you would like to keep just rename `~/.config/nvim` to anything you want really
```
mv ~/.config/nvim ~/.config/thisIsMyBackup
```
- Clone the template
  ```
  git clone git@github.com:Rumone/JoshVim.git ~/.config/nvim
  ```

## Todo
[] Investigate more areas for lazy loading plugins
[] Remove even more plugins if I can
[] Refactor parsers installed. I dont use half of these
[] Enable scope highlighting, Pretty sure that has to do with treesitter
[] Look into a few auto commands that could help my workflow
[] Add documentation then use whichkey to display them. Or I might just create a buffer with all the keymaps that you can access through telescope
[] Add a link to all the plugins used 

## CONTRIBUTING
Just create a PR bro it's not that deep. I will take a look and tell you to change things.

## Note
The `null_ls` a plugin will be archived as of August 11, 2023. It was an integral plugin to the nvim community bridging a niche but important gap between nvim and LSP.
This note is to inform users of this config that.
- This plugin was and still is important and I am curious to see what takes it's place.
- This will not stop the evolution of this nvim config.
[More info from the creator here](https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621)


## FAQ
1. What if it doesn't work?

I dont know enuh it works for me. Start a discussion maybe.

2. Why did you overrwrite the entire repo?

I felt it was time to let go of LazyVim and spend hours inventing my own. There are a few more steps involved if you want to use this config by the way (have fun figuring that out).
> You may run into lsp issue because this config doesn't install any by default. run `LspInstall` and chose an lsp yourself the rest should just work out of the box, hopefully.

3. Why is there an apple icon in my status line I run linux?

You machine is secretly a macbook
