module Vagrant
    module Pyinfra
        class Config < Vagrant.plugin('2', :config)
            attr_accessor :deploy_file

            def initialize
                @deploy_file = UNSET_VALUE
            end

            def finalize!
                @deploy_file = 'deploy.py' if @deploy_file == UNSET_VALUE
            end

            def execute(command)
                output = ''
                begin
                    IO.popen(command, 'w+') do |f|
                        f.close_write
                        output = f.read
                    end
                    output
                rescue Errno::ENOENT
                    false
                end
            end

            def validate(env)
                errors = _detected_errors

                if not File.exist?(deploy_file) then
                    errors << "#{deploy_file} does not exist."
                end

                command = 'pyinfra --version'
                output = execute(command)
                if not output then
                    errors << 'pyinfra command does not exist.'
                end

                {'pyinfra provisioner' => errors}
            end
        end
    end
end
