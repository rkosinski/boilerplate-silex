#!/bin/bash

# When set to true, composer dumps autoload every single time
COMPOSER_DUMP_AUTOLOAD=false

### # ## # ###### # ## # ###### # ## # ###### # ## # ###### # ## # ###### # ## #
# DO NOT EDIT BELOW THIS LINE
### # ## # ###### # ## # ###### # ## # ###### # ## # ###### # ## # ###### # ## #

SCRIPT_VERSION='2015.19.02'
# Autor Radoslaw Kosinski <admin@rkosinski.pl>
echo ""
echo "Default deploy script for Silex applications"
echo "Version $SCRIPT_VERSION"
echo ""


################################################################################
# Silex cache
################################################################################

if [ ! -d var/cache ]
then
    mkdir var/cache -m 777 && echo "Creating Silex cache"
fi

################################################################################
# Silex logs
################################################################################

if [ ! -d var/logs ]
then
    mkdir var/logs -m 777 && echo "Creating Silex logs"
fi

################################################################################
# Removing cache
################################################################################

rm -rf var/cache/* && echo "Force remove Silex cache"
rm -rf web/assets/compiled/* && echo "Remove compiled JS/CSS cache"
rm -rf web/assets/.sass-cache/* && echo "Remove compiled SASS cache"

################################################################################
# Changing console file rights
################################################################################

chmod a+x bin/console
echo "Changed console file rights"

################################################################################
# Dumping composer autoload
################################################################################

if $COMPOSER_DUMP_AUTOLOAD ;
then
    composer.phar dump-autoload &> /dev/null && echo "Dumped Composer autoload"
fi

################################################################################
# Well done
################################################################################

echo ""
echo "Deployed at $(date)"
echo ""