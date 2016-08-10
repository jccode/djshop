from fabric.api import env, local, task, run, put, sudo


def remote_server():
    env.user = 'root'
    env.hosts = ['120.25.145.61']   # 
    env.identity_file = '~/.ssh/.id_rsa'


def vagrant():
    """USAGE:
    fab vagrant uname
    
    Note that the command to run Fabric might be different on different
    platforms.
    """
    # change from the default user to 'vagrant'
    env.user = 'vagrant'
    # connect to the port-forwarded ssh
    env.hosts = ['127.0.0.1:2222']
 
    # find running VM (assuming only one is running)
    result = local('vagrant global-status | grep running', capture=True)
    machineId = result.split()[0]
    
    # use vagrant ssh key for the running VM
    result = local('vagrant ssh-config {} | grep IdentityFile'.format(machineId), capture=True)
    
    env.key_filename = result.split()[1]


@task
def bootstrap():
    local("knife bootstrap {host} --ssh-user {user} --identity-file {identity_file} --node-name refire-test --run-list 'recipe[learn_chef_apache2]'")


@task
def uname():
    run("uname -a")


@task
def copy_data_bag_secret():
    data_bag_secret_file = "/etc/chef/encrypted_data_bag_secret"
    sudo("mkdir /etc/chef")
    put(data_bag_secret_file, data_bag_secret_file, use_sudo=True)


@task
def gem_source():    
    put("~/.gemrc", "/root/.gemrc", use_sudo=True)

    
# Setup env
vagrant()
