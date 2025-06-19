vim.filetype.add {
  pattern = {

    [".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.yml"] = "yaml.ansible",
    [".*/roles/.*/vars/.*%.yml"] = "yaml.ansible",
    [".*/roles/.*/defaults/.*%.yml"] = "yaml.ansible",
    [".*/roles/.*/meta/.*%.yml"] = "yaml.ansible",
    [".*/playbook.*%.yml"] = "yaml.ansible",
  },
}
