
https://cockpit-cloudgouv-eu-west-1.outscale.com/login/


Add access

    osc-cli api ReadAccessKeys --profile default

Read quota

    osc-cli api ReadQuotas --profile default \ | jq '.QuotaTypes[].Quotas[] | select (.ShortDescription == "VM Limit")'

Add a VM (instance)
