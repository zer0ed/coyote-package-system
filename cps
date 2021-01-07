#!/bin/sh
#
# - CPS Main Menu -
# Copyright (C) 2002, Wes Brewer
# Distributed under the terms of the GNU GPL2

#Uncomment for debug mode (don't suppress STDOUT and STDERR)
#DEBUG=1
if [ "$DEBUG" ] ; then
	qt () { "$@" ; }
else
	qt () { "$@" >/dev/null 2>&1 ; }
fi

VER="0.7b"				# CPS Version
MNT="/var/lib/lrpkg/mnt"		# mount dir
DEV="/dev/boot"				# device to use
TMP="/tmp"				# temp dir
PACKLIST="/etc/coyote/packages"		# package list

sync
qt umount $MNT
qt /usr/sbin/mount.boot $MNT

while [ : ]; do				# force user selection loop
   until [ -e $MNT/etc.tgz ]; do	# force coyote disk check
      clear
      echo "Please place your Coyote Linux disk in the floppy drive"
      echo "           and remove the write protection"
      read JUNK
      sync
      qt umount $MNT
      qt /usr/sbin/mount.boot $MNT
   done
   clear
   # set freespace file for fs check
   if [ ! -e $TMP/freesp ]; then
      set -- `df | grep /dev/boot`
      echo $4 > $TMP/freesp
   fi
   echo
   echo "			-=-  COYOTE PACKAGE SYSTEM  -=-"
   echo "                                                             CPS version $VER"
   echo " http://www.routerdesign.com"
   echo "  Copyright (C) 2002,  Wes Brewer"
   echo
   set `cat $TMP/freesp`
   echo "  Options                            Free space on /dev/boot: $1 Kb"
   echo "  ~~~~~~~"
   echo "     i) Install package(s)"
   echo "     r) Remove package(s)"
   echo "     f) Finished -> backup & reboot"
   echo
   echo "     u) Uninstall CPS"
   echo "     h) Help and other info"
   echo
   echo " q) quit"
   echo " ----------------------------------------------------------------------------- "
   echo -n "	Selection: "
   read OPT
   case $OPT in
      q | Q ) sync
              qt umount $MNT
              clear
              exit 0 ;;
      i | I ) sync
              qt umount $MNT
              cpsi ;;
      r | R ) cpsr ;;
      f | F ) sync
              qt umount $MNT
              clear
              lrcfg.back
              echo
              echo "NOTE: If you dont reboot your new packages will not run.."
              echo "Press any key to reboot now or press CTRL+C to cancel!"
              read JUNK
              reboot
              read JUNK ;;
      u | U ) echo -n " Are you sure you want to uninstall CPS? [y/n] :"
              read OPT
	      if [ $OPT = "y" ] || [ $OPT = "Y" ]; then
                cd /usr/sbin
                rm lrcfg cps cpsi cpsr
                cat $PACKLIST | while read PKG; do
                   [ "$PKG" = "cps" ] || echo $PKG >> $TMP/pkg.tmp
                done
                rm $MNT/cps.tgz $PACKLIST /var/lib/lrpkg/cps.*
                mv $TMP/pkg.tmp $PACKLIST
                cp lrcfg.old.cps lrcfg
                sync
		qt umount $MNT
		lrcfg.back
		echo
                echo " *** CPS is Uninstalled ***"
                read JUNK
              fi ;;
      h | H ) clear
              echo "                              CPS Help"
	      echo "                             ^^^^^^^^^^"
	      echo " Packages, documentation and other help can be found at.."
	      echo "   http://www.routerdesign.com/sideprojects/cl_cps/cpshome.shtml"
	      echo
	      echo " Development Team"
	      echo " ~~~~~~~~~~~~~~~~"
	      echo "  Programing & Concept"
	      echo "       Wes Brewer [nd3] - nd3@routerdesign.com"
	      echo "  Alpha & Beta Testing"
	      echo "       Rusty Martin [omega monk] - omega_monk@yahoo.com"
	      echo "       Mel Kliner [northern rebel] - mkliner@neo.rr.com"
	      echo "       Andrew Barnes [canuckle] - canucklehead@ethergear.com"
	      echo
	      echo " Contributions & Dontations"
	      echo " ~~~~~~~~~~~~~~~~~~~~~~~~~~"
	      echo "  If you find this software useful then please contribute to the development"
	      echo "  of Coyote Linux. Without Coyote Linux, CPS wouldn't exsist!"
	      echo "    http://www.coyotelinux.com/contribute.php"
	      echo
	      echo "  If you would like to contribute directly to the CPS project then you can do"
	      echo "  so by visiting the site below and viewing the \"contribute\" sidebar."
	      echo "    http://www.routerdesign.com"
	      read JUNK ;;
            * ) ;;
   esac
done

