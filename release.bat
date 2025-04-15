wsl sudo rm -rf /var/www/ravekb/* 
wsl sudo cp -r /mnt/c/users/anakim/ravekb/build/web/* /var/www/ravekb/
wsl sudo systemctl restart nginx