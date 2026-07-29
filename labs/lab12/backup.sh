#!/bin/bash
#!/bin/bash
mkdir -p ~/backup
tar -czvf ~/backup/backup_$(date +%Y%m%d).tar.gz $0
echo "Backup created successfully"
