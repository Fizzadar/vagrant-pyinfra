from pyinfra.modules import server

SUDO = True


server.user(
    'pyinfra',
    home='/home/pyinfra',
)
