# milcvim 🥛

personal not-so-small neovim config

<img width="1430" alt="coding example" src="https://github.com/user-attachments/assets/3859600c-dbfb-488a-985a-cadfa68a0701" />

## features
- using idiomatic vim features where reasonable
- lazy-loaded where reasonable
- configured for coding (c/c++, go, rust, etc) and writing (markdown, latex, typst)
- documented and structured
- design is top priority (pure, _aesthetic_, **_KPACUBO_**)

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
keybind. or you can install them with system's package manager as always

## screenshots
goes hard, feel free to ~~screenshot~~ star repo

<img width="1430" alt="dashboard" src="https://github.com/user-attachments/assets/7705031a-6e01-4c5d-bb87-bb96d08fa33a" />

<img width="1430" alt="selecting buffers with telescope (themed liked nvchad)" src="https://github.com/user-attachments/assets/f7afe225-6b30-40c4-8577-228448f4d24e" />

<img width="1430" alt="markdown preview, notifications and cmdline" src="https://github.com/user-attachments/assets/04f59465-1868-474c-a899-7632377ba8db" />

<img width="1430" alt="file manager with menu showed" src="https://github.com/user-attachments/assets/18591b26-c9c6-4007-9e9b-e8e2768b6d1c" />
