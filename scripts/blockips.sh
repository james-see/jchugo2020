while IFS= read -r block
do 
   sudo ufw insert 1 deny from "$block" 
done < "blocked.ip.list"