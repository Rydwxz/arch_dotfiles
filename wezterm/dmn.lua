local domain = {}

domain.ssh = {

	{
		name = 'zenserv',
		remote_address = '192.168.50.3',
		username = 'rw',
		multiplexing = 'None',
		default_prog = {'tmux'},
	},

}

domain.unix = {



}

return domain
