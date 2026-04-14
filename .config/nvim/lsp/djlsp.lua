return {
  cmd = { "djlsp" },

  filetypes = { "htmldjango" },

  root_dir = function(fname)
    local util = require("lspconfig.util")

    return util.root_pattern(
      "manage.py",
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      ".git"
    )(fname)
  end,

  single_file_support = true,
}
