begin
    require 'vagrant'
rescue LoadError
    Bundler.require(:default, :development)
end

require 'vagrant-pyinfra/plugin'
