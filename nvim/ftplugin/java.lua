local root_dir = vim.fs.root(0, {
    "gradlew",
    "mvnw",
    "pom.xml",
    "build.gradle",
    "settings.gradle",
    ".git",
})

if not root_dir then
    return
end

local config = {
    cmd = { "jdtls" },
    root_dir = root_dir,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

require("jdtls").start_or_attach(config)
