default[:monitoring_scripts][:disk_threshold]   = 80
default[:monitoring_scripts][:critical_sns_arn] = "arn:aws:sns:${region}:${account-number}:${topic}"
default[:monitoring_scripts][:relaxed_sns_arn]  = "arn:aws:sns:${region}:${account-number}:${topic}"
