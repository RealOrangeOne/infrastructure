settings {
    logfile    = "/tmp/lsyncd.log",
    statusFile = "/tmp/lsyncd.status",
}

sync {
    default.rsyncssh,
    source    = "/mnt/pages",
    host      = "user@5.39.79.153",
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
