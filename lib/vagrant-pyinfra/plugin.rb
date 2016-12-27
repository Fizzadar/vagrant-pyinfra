module Vagrant
    module Pyinfra
        class Plugin < Vagrant.plugin('2')
            name 'pyinfra'

            description <<-DESC
            Provision VMs with pyinfra.
            DESC

            config(:pyinfra, :provisioner) do
                require_relative 'config'
                Config
            end

            provisioner(:pyinfra) do
                require_relative 'provisioner'
                Provisioner
            end
        end
    end
end
