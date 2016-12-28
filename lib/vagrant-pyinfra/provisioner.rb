module Vagrant
    module Pyinfra
        class Provisioner < Vagrant.plugin('2', :provisioner)
            def provision
                ssh_info = @machine.ssh_info
                user = ssh_info[:username]
                host = ssh_info[:host]
                port = ssh_info[:port]

                if ssh_info[:private_key_path].kind_of?(Array)
                    private_key = ssh_info[:private_key_path][0]
                else
                    private_key = ssh_info[:private_key_path]
                end

                pyinfra_command = (
                    "pyinfra " +
                    "-i #{host} " +
                    "--key #{private_key} " +
                    "--port #{port} " +
                    "--user #{user} " +
                    "#{config.deploy_file}"
                )

                puts "Running: #{pyinfra_command}"
                system pyinfra_command
            end
        end
    end
end
