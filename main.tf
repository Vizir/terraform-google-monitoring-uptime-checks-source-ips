data external main {
  program = ["${path.module}/get_monitoring_uptime_check_ips.sh"]
}

output ips {
  value       = "${split(",", data.external.main.result.ips)}"
}
