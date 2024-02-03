# Henrik's custom configs

<!--toc:start-->

- [Henrik custom configs](#henrik-custom-configs)
  - [Install guide](#install-guide)
    - [Prerequisites](#prerequisites)
  - [Other extensions](#other-extensions)
    - [Oatmeal](#oatmeal)
    - [ZK](#zk)
    - [Vale](#vale)

<!--toc:end-->

## Install guide

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 &&
git clone https://github.com/henriklovhaug/neovim-config.git ~/.config/nvim/lua/custom/
```

### Prerequisites

- `ripgrep`
- `python3`
- `npm`
- `rust`
- `cmake`

## Other extensions

### Oatmeal

Some plugins will not work without other applications installed. Follow
[Oatmeal](https://github.com/dustinblackman/oatmeal.nvim) guide to see what you
need to run a LLM inside NVIM

### ZK

Run `zk init` to create zk notebook

### Vale

Create a `.vale.ini` file in you `$HOME` directory to create writing rules for
markdown, latex, and txt. Config generator can be found
[here](https://vale.sh/generator). Run `vale sync` to download selected grammar
rules.
