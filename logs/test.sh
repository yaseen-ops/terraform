

log_rotate()
{
  for log_file in $(ls $_logs | sort -r )
   do
	base_file_name=$(echo ${log_file} | cut -d. -f1-2)
	temp_file=${log_file##*.}
	if [ $temp_file == log ]
		then
			val=.$((0+1))
	else
		val=.$((temp_file+1))
	fi
	mv $log_file "$base_file_name"$val
  done
  touch $base_file_name
}

# Log rotating for access logs
_logs=access*log*
log_rotate

#Log rotating for error logs
_logs=error*log*
log_rotate
#END
