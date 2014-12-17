echo "-------------------------- shell/install.sh --------------------------"

PUPPET_DIR=/etc/puppet
LIBRARIAN_PATH=/usr/local/bin/librarian-puppet


# if [ ${#PUPPET_BIN} -eq 0 ] ; then
# 	# Install puppet and replace with repo (CentOS7)
# 	rpm -ivh http://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
# 	yum install -y puppet
# fi

if [ ! -f $LIBRARIAN_PATH ] ; then
	# Install librarian-puppet:
	echo "Installing gem librarian-puppet (takes a while)"
	gem install librarian-puppet
fi


# Install puppet dependencies:
if [ ! -d "$PUPPET_DIR" ]; then
  mkdir -p $PUPPET_DIR
fi

cp /vagrant/puppet/Puppetfile $PUPPET_DIR

cd $PUPPET_DIR
$LIBRARIAN_PATH install --verbose


# cron task to regularly run puppet apply on a main manifest
# sudo puppet resource cron puppet-apply ensure=present user=root minute=30 command='/usr/bin/puppet apply /etc/puppet/manifests/site.pp'

# /usr/bin/puppet apply /etc/puppet/manifests/site.pp

echo "-------------------------- ended install.sh --------------------------"