echo "-------------------------- shell/install.sh --------------------------"

# PUPPET_BIN=$(which puppet)
# LIBRARIAN_BIN=$(which librarian-puppet)
# PUPPET_DIR=/etc/puppet
# PUPPET_SIFO_APP=/tmp/puppet-sifo-app

yum install -y git


# Install puppet and replace with repo (CentOS7)
# rm -fr $PUPPET_DIR
# git clone https://github.com/sifophp/puppet-sifo-app.git $PUPPET_DIR


if [ ${#PUPPET_BIN} -eq 0 ] ; then
	# Install puppet and replace with repo (CentOS7)
	rpm -ivh http://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
	yum install -y puppet
fi

# if [ ${#LIBRARIAN_BIN} -eq 0 ] ; then
# 	# Install librarian-puppet:
# 	echo "Installing gem librarian-puppet (takes a while)"
# 	gem install librarian-puppet
# fi


# Install puppet dependencies:
# cd $PUPPET_DIR
# /usr/local/bin/librarian-puppet install --verbose

# cron task to regularly run puppet apply on a main manifest
# sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply /etc/puppet/manifests/site.pp'

# /usr/bin/puppet apply /etc/puppet/manifests/site.pp

echo "-------------------------- ended install.sh --------------------------"