#!/bin/bash
sed -i "s/<DATA_BASE_NAME>/$DATA_BASE_NAME/" apache/www/html/sites/default/settings.php
sed -i "s/<USER_NAME>/$USER_NAME/" apache/www/html/sites/default/settings.php
sed -i "s/<PASSWORD>/$PASSWORD/" apache/www/html/sites/default/settings.php
sed -i "s/<HOST>/$HOST/" apache/www/html/sites/default/settings.php
sed -i "s/<PORT>/$PORT/" apache/www/html/sites/default/settings.php