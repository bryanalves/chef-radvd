name             'radvd'
maintainer       'Bryan Alves'
maintainer_email 'bryanalves@gmail.com'
license          'MIT'
description      'Installs/Configures radvd'
long_description 'Installs/Configures radvd'
version          '0.0.2'
issues_url       'https://github.com/bryanalves/chef-radvd/issues' if respond_to?(:issues_url)
source_url       'https://github.com/bryanalves/chef-radvd' if respond_to?(:source_url)

attribute 'radvd/interface',
          display_name: 'Interface',
          description: 'Network interface to advertise on',
          type: 'string'

attribute 'radvd/interface_options',
          display_name: 'Interface options',
          description: 'Options for the interface',
          type: 'hash'

attribute 'radvd/prefixes',
          display_name: 'Prefixes to advertise',
          description: 'Prefixes to advertise, and their settings',
          type: 'hash'

recipe 'radvd::default', 'Installs radvd'

depends 'sysctl', '~> 0.7.0'
