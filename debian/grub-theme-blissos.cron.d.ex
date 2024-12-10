#
# Regular cron jobs for the grub-theme-blissos package.
#
0 4	* * *	root	[ -x /usr/bin/grub-theme-blissos_maintenance ] && /usr/bin/grub-theme-blissos_maintenance
