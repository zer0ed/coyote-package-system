# Coyote Package System - CPS

An unofficial package system for the now defunct Coyote Linux, a routing centric Linux distribution which fit on a floppy disk. From an earlier time when space and resources were precious!

**tldr:** Coyote Linux and this package system are long discontinued! This has been uploaded here for archival purposes.

The commit dates will reflect when they were pushed to github, not when I originally created them as I wasn't using any version control system at the time.

I have done a commit for each version change I have available for completion sake.

More info about Coyote Package System (CPS) and related packages can be found below:

![CPS Logo](docs/.screenshots/cps_title.png)

Coyote Linux was a router/firewall centric Linux distribution. At the time, Coyote lacked proper support for package management (eg. deb/rpm) and as such Coyote Package System (CPS) was created.

CPS allowed for easy installation of add-ons within Coyote Linux by use of .cps package files which are similar to the .lrp files from the Linux Router Project. This package manager handled and installed add-on software within Coyote via an easy to use menu system.

Coyote Package System works with the following versions of Coyote Linux:

* Coyote Linux 1.2 and v1.3x (with CPS version 0.7b)
* Coyote Linux 1.40rc1 (with CPS version 0.8b in the development branch)

Development of the floppy disk version of Coyote Linux and CPS has been discontinued. Coyote Linux v2.x had later been forked over to BrazilFW. CPS has never been tested with BrazilFW!

## Features

* easy to use (the CPS sub-menu is patched into the Coyote Linux main menu)
* many Linux Router Project .lrp packs can be converted to .cps packs. (see build instructions in the blank template package)
* supported easy package installation, configuration, and removal
* help is available within the menu
* no need for the user to build software from source

## Later Versions

CPS v0.8 beta testing version can be found in the development branch of this repository. It was never fully tested for final release and if I remember correctly, wasn't compatible with the older packages we provided. This version was for use with Coyote Linux 1.40rc only!

CPS v0.9 was a work in progress with support for Coyote Linux versions 2.x. It was being worked on by Rusty Martin (Omega_Monk) of the dev team and myself. The code was never fully tested and we somehow managed to misplace it. It is forever lost, and development on CPS has long since stagnated.

## Installation

See [cpsmanual.html](docs/cpsmanual.html) in docs/

## Documentation

[changlog.txt](docs/changelog.txt) and [todo.txt](docs/todo.txt) can be found in docs/

## Dev Team

Code improvements, testing and feedback credit go to these amazing volunteers.

* Rusty Martin (omega monk)
* Mel Kliner (northern rebel)
* Andrew Barnes (canuckle)

## Screenshots

![CPS Install Menu](docs/.screenshots/CPS_install_menu.png)

More screenshots..

1. [Coyote menu before CPS](docs/.screenshots/Coyote_menu_before_installing_CPS.png)
2. [Coyote menu after CPS](docs/.screenshots/Coyote_menu_after_installing_CPS.png)
3. [CPS Install Finished](docs/.screenshots/CPS_installed.png)
4. [CPS menu](docs/.screenshots/CPS_submenu.png)
5. [Install a package (1 of 4)](docs/.screenshots/CPS_install_package_1.png)
6. [Install a package (2 of 4)](docs/.screenshots/CPS_install_package_2.png)
7. [Install a package (3 of 4)](docs/.screenshots/CPS_install_package_3.png)
8. [Install a package (4 of 4)](docs/.screenshots/CPS_install_package_4.png)
9. [Remove a package](docs/.screenshots/CPS_remove_package.png)
10. [Uninstall CPS](docs/.screenshots/CPS_uninstall.png)

Even more screenshots can be found under docs/.screenshots

## Packages

The following packages are for use with CPS version 0.7b only. They may or may not work with version 0.8b from the development branch. Each can be found under packages/

### Blank Template v1.1

This is not an installable package for CPS! It is a template along with instructions on how to build a CPS package.

### DNScache v1.0

This pack is a local DNS cache to run on your router. Any machines behind the router can use this cache (granted they are allowed). It functions as it’s own resolver so it doesn’t need to know about your ISP’s DNS servers! Running a local DNS cache makes you less reliant on your ISP and provides faster DNS lookups once the data is cached.

### EZ-IP Update v1.5

Ez-ipupdate is a small utility for updating your host name IP for many dynamic DNS services.. ez-ip.net, justlinux.com, dhs.org, dyndns.org, ods.org, gnudip.cheapnet.net (GNUDip), dyn.ca (GNUDip), tzo.com, easydns.com, dyns.cx, hn.org, zoneedit.com.

### IPtraf v1.1

IPtraf is an ncurses-based IP LAN monitor that generates various network statistics including TCP info, UDP counts, ICMP and OSPF information, Ethernet load info, node stats, IP checksum errors, and others. If the command is issued without any command-line options, the program comes up in interactive mode, with the various facilities accessed through the main menu.

### LCDproc v0.7a

This pack contains drivers for many LCD displays you may have for your router. It contains the LCDd daemon, LCDproc v0.4.3 client, and the NetLCD v0.2.2 client. The LCD displays supported include.. Bayrad, Crystal Fontz, Hitachi HD44780, PIC-an-LCD, LCDM001, Matrix Orbital, Matrix Orbital GLK, SED1330, SED1520, STV5730, and Toshiba T6963. Display drivers are each packaged in their own .cps file to save space. This requires an extra step on your part. Download, unzip and read the included readme.txt file.

### LCDproc v1.0

This pack contains drivers for many LCD displays you may have for your router. It contains the LCDd daemon, LCDproc v0.4.3 client, and the NetLCD v0.2.2 client. The LCD displays supported include.. Bayrad, Crystal Fontz, CWLinux, Hitachi HD44780, PIC-an-LCD, LCDM001, Matrix Orbital, Matrix Orbital GLK, SED1330, SED1520, SGX120, STV5730, Toshiba T6963 Wirz-SLI. This version fixed a memory leak that was found in package version 0.7a!  Display drivers are each packaged in their own .cps file to save space. This requires an extra step on your part. Download, unzip and read the included readme.txt file.

### SNMP Protocol v1.2 (limited)

SNMP (Simple Network Management Protocol) with limited functionality. Useful for apps like MRTG.

### TCPdump v1.1

If you don’t know what tcpdump does then you probably dont want it. (it’s a protocol packet capture and dumper program). Please note that this version also has an ascii option.

### ToolPak1 V1.3

This pack contains some tools that Coyote forgot! In it you’ll find tools to reload your firewall & masq scripts, backup your CL disk, format a disk, modify a program’s scheduling priority, emulated Vi editor, and an emulated pico editor! If you get just 1 package then this should be the one, it’s a lot of handy tools for only 10k of space!!

### ToolPak2 v1.1

This pack contains some more tools that Coyote forgot! In it you’ll find tools to.. Update system clocks via rdate & hwclock (r-time), a basic e-mail client (mncmail), shutdown, disconnect & wait, and start the ppp- daemon (ppp-down, ppp-stop, ppp-up), and a basic ftp client to ftp your files elsewhere.

### Top v1.1

Top is a program which provides an ongoing look at processor activity in real time. It displays a listing of the most CPU intensive tasks on the system and can provide an interactive interface for manipulating processes. It can sort the tasks by CPU usage, memory usage and runtime.

### Weblet Tiny v1.5

Weblet Tiny uses a shell-script based web server (sh-httpd) and some CGI scripts that let you check on the status of your Coyote box and read log files with a web-browser. This version of weblet DOES NOT include the bandwidth monitor (lrpstat).

### Weblet v1.5

Weblet uses a shell-script based web server (sh-httpd) and some CGI scripts that let you check on the status of your Coyote box and read log files with a web-browser. This version of weblet also includes a java based bandwidth monitor (lrpstat).
