# c4s3vim – all-purpose neovim configuration

c4s3vim is a personal feature-packed language-agnostic neovim config which
doesn't compromise on speed or design.

## features
- 100% lua config
- lazy-loaded where reasonable
- preconfigured for rust, c/c++, go, bash, latex and markdown
- language agnostic
- documented and structured
- frequently updated (using it as daily driver since 2022)
- made with design in mind (pure, _aesthetic_, **_KPACUBO_**)

> [!NOTE]
> this config is not a framework, so if you want to extend or customize it, you
> should fork it or use as a base for your own configuration

## installation
requirements:
1. neovim v0.11.0
2. git, curl, unzip, fzf
3. any nerd font (or terminal that provides nerd icons itself like [kitty](https://github.com/kovidgoyal/kitty))

```bash
cd ~/.config
git clone https://github.com/lowerc4s3/nvim
# and that's it
```

after installation you probably want to install language servers and debug
adapters with mason. you can run it by `:Mason` command or by `<leader>pm`
keybind

<!-- ## screenshots -->
<!-- goes hard, feel free to ~~screenshot~~ star repo -->
<!-- TODO: Add images -->
