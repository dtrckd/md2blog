@devops
@hashi

output a  job_file template (that's all ?)
    nomad init

check syntax
    nomad validate <job_file>

show whats will be going on on running
    nomad plan <job_file>

run
    nomad run <job_file>

show the jobs ressource
    nomad status

show instances/allocations of a particular jobs
    nomad job status <job_name>

info about an instance/allocation
    nomad alloc-status <instance_id>

show log of an instance/allocation
    nomad logs <instance_id>

To check how many running allocations a node client has use:
    nomad node-status -allocs -address="nomad-agent-http-adress:nomad-agent-http-port"


Other info
    nomad server-members
    nomad node-status

Use the hashi-ui, unzip the release and run it
    ./hashi-ui-linux-amd64 --nomad-enable --consul-enable
then simply connect
    http://$SERVER_IP:3000/nomad/global/cluste





