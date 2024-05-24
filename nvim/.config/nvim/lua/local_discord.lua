local presence = require("presence")

presence.setup({
  auto_update = true,
  main_image = "file",
  neovim_image_text = ";)",
  buttons = {
    {label = "neovim", url = "https://neovim.io"},
    {label = "dots", url = "https://github.com/IkaSek/dots"}
  },
})
