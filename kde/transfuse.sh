#!/usr/bin/env bash
#                        transfuse.sh                       #
## Automates backing up and restoring Plasma user configs   #
#####                        cscs                       #####
underline=`tput smul`
nounderline=`tput rmul`
HELP=$(echo " ";
       echo "#########################################################################";
       echo "#                                                                       #";
       echo "#   TRANSFUSE - a Script to Backup and Restore Plasma User Configs      #";
       echo "#                                                                       #";
       echo "#   transfuse.sh [option] [USER/PATIENT]                                #";
       echo "#                                                                       #";
       echo "#   options:                                                            #";
       echo "#   help, -h, --help                                  show brief help   #";
       echo "#   backup, -b, --backup USER                     backup USER configs   #";
       echo "#   backuptopical, -bt, --backupt USER         backup USER appearance   #";
       echo "#   backuproot, -BR, --backuproot                 backup root configs   #";
       echo "#   copy, -C, --copy USER                    copy but do not compress   #";
       echo "#   compress, -c, --compress                  compress copied configs   #";
       echo "#   pkglists, -p, --pkglists        create list of installed packages * #";
       echo "#   pkgrestore, -pr, --pkgrestore            reinstall from a pkglist * #";
       echo "#   restore, -r, --restore PATIENT       restore configs /to/ PATIENT   #";
       echo "#                                                                       #";
       echo "#                               ${underline}  NOTES  ${nounderline}                               #";
       echo "#   Environment Variable        CHARTS=1          More verbose output   #";
       echo "#   Environment Variable        COVERED=1       Forgo wallpaper steps   #";
       echo "#   * pkg* options depend on pacman package manager                     #";
       echo "#                                                                       #";
       echo "#########################################################################";
       echo " ";)
NOW=$(date +"%Y%m%d_%H%M")
# We dont need no stinkin coppers.
if [ "$EUID" = 0 ];
  then echo -e "\n Do not run this script as root!\n";
  exit;
fi

if [ $# -eq 0 ]; 
  then echo "";
  while true; do
  PS3=$'\n'"Please enter your choice: "
  options=("Backup" "Copy" "Compress" "Restore" "Help" "Quit")
  COLUMNS=26
  select opt in "${options[@]}"
  do
      case "$opt,$REPLY" in
          Backup,*|*,[bB]ackup)
              echo ""
              read -p "Please enter the name of the user to backup and compress configs from: "  YOU
              "$0" -b "$YOU";
              break
              ;;
          Copy,*|*,[cC]opy)
              echo ""
              read -p "Please enter the name of the user to copy configs from: "  YOU
              "$0" -C "$YOU";
              break
              ;;
          Compress,*|*,[cC]ompress)
              "$0" -c;
              break
              ;;
          Restore,*|*,[rR]estore)
              echo ""
              read -p "Please enter the name of the user to restore configs to: "  PATIENT
              "$0" -r "$PATIENT";
              break
              ;;
          Help,*|*,[hH]elp)
              "$0" -h;
              break
              ;;             
          Quit,*|*,[qQ]uit)
              break 2
              ;;
          *) echo "invalid option $REPLY";;
      esac
  done;
  done;
fi;

while test $# -gt 0; do

case "$1" in

-b|backup|--backup)

 shift
 if test $# -gt 0; then
 YOU=`echo $1 | sed -e 's/^[^ ]* //g'`
  if [ ! -d "/home/$YOU" ]; then
   echo -e "\n Directory /home/$YOU does not exist\n";
   exit;
  fi;
 mkdir -p ./"$YOU"_transfusion_"$NOW";
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.config;
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.kde;
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.kde4;
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.local/share;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/auroraerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/autostart-scripts ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/autostart ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/breezerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/dolphinrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/gtk-3.0 ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/katemetainfos ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/katerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kateschemarc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/katevirc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kde.org ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kdeconnect ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kdeglobals ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kglobalshortcutsrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/khotkeysrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/konsolerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kscreenlockerrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/ksplashrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kvantum ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kwinrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kwinrulesrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/latte ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/lattedockrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasma-org.kde.plasma.desktop-appletsrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasma-workspace ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasma_calendar_holiday_regions ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasmarc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasmashellrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/powermanagementprofilesrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/pulse/*.conf ./"$YOU"_transfusion_"$NOW"/.config/pulse/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/qtcurve ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/Trolltech.conf ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.gtkrc-2.0 ./"$YOU"_transfusion_"$NOW"/;
 rsync -rltD --ignore-missing-args /home/$YOU/.kde ./"$YOU"_transfusion_"$NOW"/;
 rsync -rltD --ignore-missing-args /home/$YOU/.kde4 ./"$YOU"_transfusion_"$NOW"/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/aurorae ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/color-schemes ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kate ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/konsole ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kservices5 ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kxmlgui5/ ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/plasma ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/plasma_icons ./"$YOU"_transfusion_"$NOW"/.local/share/;
  if [ -z "$COVERED" ]; then
   mkdir -p ./"$YOU"_transfusion_"$NOW"/.local/share/wallpapers;
   OLDFLWR=$(awk -F: '/\[Wallpaper\]/ && $0 != "" { getline; print substr($0,14,length($0)-13) }' /home/$YOU/.config/plasma-org.kde.plasma.desktop-appletsrc);
   AROSE=$(basename -- "$OLDFLWR");
   rsync -rltD --ignore-missing-args "$OLDFLWR" ./"$YOU"_transfusion_"$NOW"/.local/share/wallpapers;
   mv ./"$YOU"_transfusion_"$NOW"/.local/share/wallpapers/"$AROSE" ./"$YOU"_transfusion_"$NOW"/.local/share/wallpapers/flowers;
   else
   echo -e '\n You are "Covered", meaning no wallpaper was copied.';
   echo -e 'That, or there was an error, in which case yell at cscs.';
  fi;
  if [[ $CHARTS -eq 1 ]]; 
   then
   tar -zcvf ./"$YOU"_transfusion_"$NOW".tar.gz ./"$YOU"_transfusion_"$NOW";
   else 
   { 
   tar -zcvf ./"$YOU"_transfusion_"$NOW".tar.gz ./"$YOU"_transfusion_"$NOW";
   } &> /dev/null;
  fi;
 rm -rf ./"$YOU"_transfusion_"$NOW";
 echo -e "\nWe copied and compressed items recursively from:\n\n~\n~/.config\n~/.local/share\n\nThe compressed backup is timestamped and named "$YOU"_transfusion_"$NOW".tar.gz\n" ;
 else 
 echo -e "\n I dont know what to do";
 echo "$HELP";
 exit;
 fi;
 shift;; # backup and squish

-bt|backuptopical|--backupt)

 shift
 if test $# -gt 0; then
 YOU=`echo $1 | sed -e 's/^[^ ]* //g'`
  if [ ! -d "/home/$YOU" ]; then
   echo -e "\n Directory /home/$YOU does not exist\n";
   exit;
  fi;
  mkdir -p ./"$YOU"_transfusion_"$NOW";
  mkdir -p ./"$YOU"_transfusion_"$NOW"/.config;
  mkdir -p ./"$YOU"_transfusion_"$NOW"/.kde;
  mkdir -p ./"$YOU"_transfusion_"$NOW"/.local/share;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/auroraerc ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/gtk-3.0 ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/kdeglobals ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/kscreenlockerrc ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/ksplashrc ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/kvantum ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/kwinrc ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/latte ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/lattedockrc ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/plasmarc ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/qtcurve ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.config/Trolltech.conf ./"$YOU"_transfusion_"$NOW"/.config/;
  rsync -rltD --ignore-missing-args /home/$YOU/.gtkrc-2.0 ./"$YOU"_transfusion_"$NOW"/;
  rsync -rltD --ignore-missing-args /home/$YOU/.kde ./"$YOU"_transfusion_"$NOW"/;
  rsync -rltD --ignore-missing-args /home/$YOU/.local/share/aurorae ./"$YOU"_transfusion_"$NOW"/.local/share/;
  rsync -rltD --ignore-missing-args /home/$YOU/.local/share/color-schemes ./"$YOU"_transfusion_"$NOW"/.local/share/;
  rsync -rltD --ignore-missing-args /home/$YOU/.local/share/konsole ./"$YOU"_transfusion_"$NOW"/.local/share/;
  rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kxmlgui5/ ./"$YOU"_transfusion_"$NOW"/.local/share/;
  rsync -rltD --ignore-missing-args /home/$YOU/.local/share/plasma ./"$YOU"_transfusion_"$NOW"/.local/share/;
  rsync -rltD --ignore-missing-args /home/$YOU/.local/share/plasma_icons ./"$YOU"_transfusion_"$NOW"/.local/share/;
  if [[ $CHARTS -eq 1 ]]; 
   then
   tar -zcvf ./"$YOU"_transfusion_T-"$NOW".tar.gz ./"$YOU"_transfusion_"$NOW";
   else 
   { 
   tar -zcvf ./"$YOU"_transfusion_T-"$NOW".tar.gz ./"$YOU"_transfusion_"$NOW";
   } &> /dev/null;
  fi;
 rm -rf ./"$YOU"_transfusion_"$NOW";
 echo -e "\nWe copied and compressed items recursively from:\n\n~\n~/.config\n~/.local/share\n\nThe compressed backup is timestamped and named "$YOU"_transfusion_T-"$NOW".tar.gz" ;
 echo -e "\nThis is a 'topical' backup. Only the minimum of themes and aesthetics are saved.\n"
 else 
 echo -e "\n I dont know what to do";
 echo "$HELP";
 exit;
 fi;
 shift;; # backup and squish

-BR|backuproot|--backuproot)

 mkdir -p ./root_transfusion_"$NOW";
 mkdir -p ./root_transfusion_"$NOW"/usr/share;
 rsync -av --ignore-missing-args /usr/share/aurorae ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/color-schemes ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/icons ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/kde-gtk-config ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/kde4 ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/konsole ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/Kvantum ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/plasma ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/sddm ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/themes ./root_transfusion_"$NOW"/usr/share/;
 rsync -av --ignore-missing-args /usr/share/wallpapers ./root_transfusion_"$NOW"/usr/share/;
  if [[ $CHARTS -eq 1 ]]; 
   then
   tar -zcvf ./root_transfusion_"$NOW".tar.gz ./root_transfusion_"$NOW";
   else
   {
   tar -zcvf ./root_transfusion_"$NOW".tar.gz ./root_transfusion_"$NOW";
   } &> /dev/null;
  fi;
 rm -rf ./root_transfusion_"$NOW";
 echo -e "\n\nWe copied and compressed items recursively from:\n\n/usr/share/\n\nThe compressed backup is named root_transfusion_"$NOW".tar.gz\n";
 exit;; # backup and squish

-C|copy|--copy)

 shift
 if test $# -gt 0; then
 YOU=`echo $1 | sed -e 's/^[^ ]* //g'`
  if [ ! -d "/home/$YOU" ]; then
   echo -e "\n Directory /home/$YOU does not exist\n";
   exit;
  fi;
 {
 mkdir -p ./"$YOU"_transfusion_"$NOW";
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.config;
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.kde;
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.kde4;
 mkdir -p ./"$YOU"_transfusion_"$NOW"/.local/share;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/auroraerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/autostart-scripts ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/autostart ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/breezerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/dolphinrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/gtk-3.0 ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/katemetainfos ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/katerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kateschemarc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/katevirc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kde.org ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kdeconnect ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kdeglobals ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kglobalshortcutsrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/khotkeysrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/konsolerc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kscreenlockerrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/ksplashrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kvantum ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kwinrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/kwinrulesrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/latte ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/lattedockrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasma-org.kde.plasma.desktop-appletsrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasma-workspace ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasma_calendar_holiday_regions ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasmarc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/plasmashellrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/powermanagementprofilesrc ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/pulse/*.conf ./"$YOU"_transfusion_"$NOW"/.config/pulse/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/qtcurve ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.config/trolltech.conf ./"$YOU"_transfusion_"$NOW"/.config/;
 rsync -rltD --ignore-missing-args /home/$YOU/.gtkrc-2.0 ./"$YOU"_transfusion_"$NOW"/;
 rsync -rltD --ignore-missing-args /home/$YOU/.kde ./"$YOU"_transfusion_"$NOW"/;
 rsync -rltD --ignore-missing-args /home/$YOU/.kde4 ./"$YOU"_transfusion_"$NOW"/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/aurorae ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/color-schemes ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kate ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/konsole ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kservices5 ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/kxmlgui5 ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/plasma ./"$YOU"_transfusion_"$NOW"/.local/share/;
 rsync -rltD --ignore-missing-args /home/$YOU/.local/share/plasma_icons ./"$YOU"_transfusion_"$NOW"/.local/share/;
 } &> /dev/null;
 echo -e "\n\nWe copied items recursively from:\n\n~\n~/.config\n~/.local/share\n\nThe new directory is timestamped and named "$YOU"_transfusion_"$NOW"\n" ;
 else
 echo -e "\n I dont know what to do";
 echo "$HELP";
 exit;
 fi;
 shift;; # make a folder but dont sit on it

-c|compress|--compress)

  echo " ";
  unset options i
  while IFS= read -r -d $'\0' f; do
    options[i++]="$f"
  done < <(find . -maxdepth 1 -type d -name "*_transfusion_*" -print0 )
   select opt in "${options[@]}" "Quit"; do
     case $opt in
       *_transfusion_*)
          if [[ $CHARTS -eq 1 ]]; 
           then
           tar -zcvf "${opt}.tar.gz" "$opt";
           else
           {
           tar -zcvf "${opt}.tar.gz" "$opt";
           } &> /dev/null;
          fi;
          echo -e "\nCompressed items recursively from:\n\n"$opt"\n";   
         break
         ;;
       "Quit")
         echo -e "\nYou chose to quit"
         break
         ;;
       *)
         echo "Invalid selection"
         ;;
     esac
   done
 exit;; # now you can sit on it 

-h|help|--help)

 echo "$HELP" ;
 exit;;

-p|pkglists|--pkglists)

 pacman -Qqen > ./"$HOSTNAME"_"$NOW"_native.txt; 
 pacman -Qqem > ./"$HOSTNAME"_"$NOW"_alien.txt;
 echo -e "\n Packagelists created for 'native' and 'alien' packages and prefixed with '"$HOSTNAME"_"$NOW"'\n";
 exit;;
  
-pr|pkgrestore|--pkgrestore)

 echo "";
 unset options i
 while IFS= read -r -d $'\0' f; do
   options[i++]="$f"
 done < <(find . -maxdepth 1 -type f -name "*native.txt" -print0 )
  select opt in "${options[@]}" "Quit"; do
    case $opt in
      *native.txt)
        echo -e "\nPackage list "$opt" selected\n";
        sudo pacman -S --needed - < "$opt";
        break
        ;;
      "Quit")
        echo -e "\nYou chose to quit"
        break
        ;;
      *)
        echo "Invalid selection"
        ;;
    esac
   if [ ! -f "$opt" ]; then
    echo -e "\n No package list selected\n";
    exit;
   fi;
  done
 exit;;

-pra|pkgrestorealien|--pkgrestorealien)

 echo "";
 unset options i
 while IFS= read -r -d $'\0' f; do
   options[i++]="$f"
 done < <(find . -maxdepth 1 -type f -name "*_alien.txt" -print0 )
  select opt in "${options[@]}" "Quit"; do
    case $opt in
      *_alien.txt)
        echo -e "\nPackage list "$opt" selected\n";
        ALIENLIST=$(cat "$opt" | tr '\n' ' ')
        if command -v yay 2>/dev/null; then
         yay -Sa --needed - < "$opt";
        elif command -v trizen 2>/dev/null; then
         trizen -Sa --needed - < "$opt";
        elif command -v pikaur 2>/dev/null; then
         pikaur -Sa --needed - < "$opt";
        elif command -v pacaur 2>/dev/null; then
         pacaur -Sa --needed $ALIENLIST;
        elif command -v pamac 2>/dev/null; then
         pamac build $ALIENLIST;
        else
         echo "Either you have no aur helper or you should yell at cscs"
        fi
        break
        ;;
      "Quit")
        echo -e "\nYou chose to quit"
        break
        ;;
      *)
        echo "Invalid selection"
        ;;
    esac
   if [ ! -f "$opt" ]; then
    echo -e "\n No package list selected\n";
    exit;
   fi;
  done
 exit;;

-r|restore|--restore)

 shift
 if test $# -gt 0; then
 unset options i
 while IFS= read -r -d $'\0' f; do
   options[i++]="$f"
 done < <(find . -maxdepth 1 -type f -name "*.tar.gz" -print0)
  select opt in "${options[@]}" "Quit"; do
    case $opt in
      *.tar.gz)
        echo -e "\nBackup file $opt selected";
        # processing
        break
        ;;
      "Quit")
        echo -e "\nYou chose to quit"
        break
        ;;
      *)
        echo "Invalid selection"
        ;;
    esac
  done
  PATIENT=$(echo $1 | sed -e 's/^[^ ]* //g')
    if [ ! -d "/home/$PATIENT" ]; then
     echo -e "\n Directory /home/$PATIENT does not exist\n";
     exit;
    fi;
    if [ ! -f "$opt" ]; then
     echo -e "\n No Backup selected\n";
     exit;
    fi;
 echo " ";
 read -p "Are you sure you would like to restore "$opt" to /home/$PATIENT/? (Y/N) " -n 1 -r ;
 echo " ";
  if [[ ! $REPLY =~ ^[Yy]$ ]];
   then exit 1;
  fi;
  if [ -z "$COVERED" ]; then
  sed -i '/Contain.*\[Wallpaper\]/!b;n;cImage=file:///home/'"$PATIENT"'/.local/share/wallpapers/flowers' /home/"$PATIENT"/.config/plasma-org.kde.plasma.desktop-appletsrc;
  else
  echo -e '\n You are "Covered", meaning no change will be made to configured wallpaper selection.';
  echo -e 'That, or there was an error, in which case yell at cscs.';
  fi; 
  if [[ $CHARTS -eq 1 ]]; 
   then
   mkdir -p /tmp/transfusion;
   tar -xzvf "$opt" -C /tmp/transfusion/;
   COPYF=/tmp/transfusion/${opt::-7}
   rsync -rltDii --ignore-missing-args $COPYF/ --include=".*" /home/$PATIENT/;
   rm -rf "$COPYF" ;
   else
   {
   mkdir -p /tmp/transfusion;
   tar -xzvf "$opt" -C /tmp/transfusion;
   COPYF=/tmp/transfusion/${opt::-7}
   rsync -rltD --ignore-missing-args $COPYF/ --include=".*" /home/$PATIENT/;
   rm -rf "$COPYF" ;
   } &> /dev/null ;
  fi;
   if [[ $? -eq "0" ]] ;
    then 
    echo -e "\nConfigs Restored from "$opt"\n" ;
    kquitapp5 plasmashell && kstart5 plasmashell </dev/null &>/dev/null &
    else
    echo -e "Something went wrong.\nAre you sure you have rights to access these folders?\n";
   fi;
 else
 echo -e "\n I dont know what to do";
 echo "$HELP";
 exit;
 fi;
 shift;; # restore from backup

 *)
 echo "$HELP";
 break
 ;;

esac

done

exit
