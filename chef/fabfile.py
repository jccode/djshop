from fabric.api import env, local, task, run, put, sudo


def remote_server():
    env.user = 'root'
    env.hosts = [ '120.25.145.61' ]   #
    env.port = 22
    env.key_filename = '~/.ssh/id_rsa'


def vagrant():
    """USAGE:
    fab vagrant uname
    
    Note that the command to run Fabric might be different on different
    platforms.
    """
    # change from the default user to 'vagrant'
    env.user = 'vagrant'

    # connect to the port-forwarded ssh
    #env.hosts = ['127.0.0.1:2222']
 
    # find running VM (assuming only one is running)
    result = local('vagrant global-status | grep running', capture=True)
    machineId = result.split()[0]

    result = local('vagrant ssh-config {} | grep Port'.format(machineId), capture=True)
    env.port = result.split()[1]
    # env._host = "127.0.0.1:{}".format(env.port)
    env.hosts = [ "127.0.0.1" ]
    
    # use vagrant ssh key for the running VM
    result = local('vagrant ssh-config {} | grep IdentityFile'.format(machineId), capture=True)
    
    env.key_filename = result.split()[1]


@task
def uname():
    run("uname -a")
    run("lsb_release -a")


@task
def copy_data_bag_key():
    data_bag_secret_file = "data_bag_key"
    sudo("mkdir /srv/app/djshop/chef")
    put(data_bag_secret_file, data_bag_secret_file, use_sudo=True)


@task
def gem_source():    
    put("~/.gemrc", "/root/.gemrc", use_sudo=True)


@task
def prepare():
    local("knife solo prepare {user}@{hosts[0]} -p {port} -i {key_filename}".format(**env))

@task
def cook():
    local("knife solo cook {user}@{hosts[0]} -p {port} -i {key_filename}".format(**env))

@task
def bootstrap():
    local("knife solo bootstrap {user}@{hosts[0]} -p {port} -i {key_filename}".format(**env))

@task
def deploy():
    local('knife solo cook {user}@{hosts[0]} -p {port} -i {key_filename} -o recipe[djshop-ubuntu::deploy]'.format(**env))
    
# Setup env
#vagrant()
remote_server()
