# Henrik custom configs

## Install guide

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 &&
git clone git@github.com:henriklovhaug/neovim-config.git ~/.config/nvim/lua/custom/ --depth 1 &&
nvim
```

## Java

To use lombok set 
``` bash
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
```
