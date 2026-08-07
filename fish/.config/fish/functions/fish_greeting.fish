function fish_greeting
	begin
		sleep 0.01
		# run fastfetch only if shell is big enoght
		if test (string split ' ' (stty size))[2] -ge 94 -a (string split ' ' (stty size))[1] -ge 23
			fastfetch
		end
	end &
end
