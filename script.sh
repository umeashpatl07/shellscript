#!/bin/bash

source_dir="/home/ubuntu/source"
target_dir="/home/ubuntu/target"
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')  # Changed to lowercase for month and day
backup_dir="${target_dir}/backupfile_${timestamp}"

function create_backup { 
    zip -r "${backup_dir}.zip" "${source_dir}"

    if [ $? -eq 0 ]; then
        echo "Backup Created successfully"
    else 
        echo "Backup NOT created"
    fi
}


function delete_files {

	backups=($(ls -t "$target_dir/backupfile"*.zip))
		echo "${backups[@]}"
	if [ "${#backups[@]}" -gt 5 ]; then
		backup_to_remove=("${backups[@]:5}")
		for backup in "${backup_to_remove[@]}";
	do 
		rm "$backup"
	done
	fi
	

}

create_backup
delete_files





























