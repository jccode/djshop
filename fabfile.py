from fabric.api import env, local, task, run

env.user = 'root'
env.host = ['120.25.145.61']
env.identity_file = '~/.ssh/.id_rsa'

def bootstrap():
    local("knife bootstrap {host} --ssh-user {user} --identity-file {identity_file} --node-name refire-test --run-list 'recipe[learn_chef_apache2]'")

