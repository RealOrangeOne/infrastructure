settings {
    logfile    = "/tmp/lsyncd.log",
    statusFile = "/tmp/lsyncd.status",
}

sync {
    default.rsyncssh,
    source    = "/mnt/pages",
    host      = "user@{{ wireguard.clients.walker.ip }}",
    targetdir = "/config/pages",
    delay     = 10,
    rsync     = {
        archive  = true,
        compress = true
    },
    ssh = {
        port = 8222
    }
}
