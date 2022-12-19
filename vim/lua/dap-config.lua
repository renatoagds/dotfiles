local dap = require('dap')

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.config/nvim/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Jetpack",
        port = 9003,
        pathMappings = {
            ["/usr/local/src/jetpack-monorepo"] = "${workspaceFolder}",
            ["/var/www/html"] = "${workspaceFolder}/tools/docker/wordpress"
        }
    }
}
