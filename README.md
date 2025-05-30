# milcvim 🥛 – all-purpose neovim configuration

milcvim is a personal feature-packed language-agnostic neovim config which
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

## screenshots
goes hard, feel free to ~~screenshot~~ star repo

<img width="1430" alt="dashboard" src="https://github.com/user-attachments/assets/04ce2757-5908-49ff-b7bd-c098bb92028b" />

<img width="1430" alt="overview" src="https://github.com/user-attachments/assets/678f881a-0f7e-4a1a-bb06-5cc3d677c567" />

<img width="1430" alt="main menu (which key)" src="https://github.com/user-attachments/assets/0eddd15b-34bd-4ccc-a652-0bcfe3fd0dc3" />

<img width="1430" alt="telescope (styled like nvchad)" src="https://github.com/user-attachments/assets/9dd6109d-0f0a-4bb6-81ff-6d6d19e91a99" />

<img width="1430" alt="markdown preview (markview.nvim), notifications and redesigned cmdline (noice.nvim and nvim-notify)" src="https://github.com/user-attachments/assets/690204d6-166d-4cba-9277-95c93f350021" />
