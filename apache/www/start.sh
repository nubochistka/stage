#!/bin/bash
src="html/sites/default/settings.php"
echo '$databases = array (' >> $src
echo "  'default' =>" >> $src
echo '  array (' >> $src
echo "    'default' => " >> $src
echo '    array (' >> $src
echo "      'database' => '$1'," >> $src
echo "      'username' => '$2'," >> $src
echo "      'password' => '$3'," >> $src
echo "      'host' => 'mysql'," >> $src
echo "      'port' => '3306'," >> $src
echo "      'driver' => 'mysql'," >> $src
echo "      'prefix' => ''," >> $src
echo '    ),' >> $src
echo '  ),' >> $src
echo ');' >> $src