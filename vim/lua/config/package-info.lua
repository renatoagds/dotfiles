local wk = require'which-key'

wk.register({
  ["<leader>"] = {
    n = {
      name = "+Package-Info",
      s = { "<cmd>lua require('package-info').show()<CR>", "Show" },
      c = { "<cmd>lua require('package-info').hide()<CR>", "Hide" },
      t = { "<cmd>lua require('package-info').toggle()<CR>", "Toggle" },
      u = { "<cmd>lua require('package-info').update()<CR>", "Update" },
      d = { "<cmd>lua require('package-info').delete()<CR>", "Delete" },
      i = { "<cmd>lua require('package-info').install()<CR>", "Install" },
      p = { "<cmd>lua require('package-info').change_version()<CR>", "Change Version" },
    }
  }
})
