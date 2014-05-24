emacs -nw
alsamixer 
fg
alsamixer 
fg
apropos pdif
apropos pcm
man alsaloop 
ffmpeg -codecs
ffmpeg -codecs | grep lame
ffmpeg -encoders
ffmpeg -f alsa -ac 2 -i hw:0,0 -f video4linux2 -i /dev/video out.mpg
ffmpeg -f alsa -ac 2 -i hw:0,0 -f video4linux2 -i /dev/video0 out.mpg
ls
file out.mpg 
ffmpeg -i out.mpg 
mplayer out.mpg 
ffmpeg -f x11grab -framerate 25 -i :0.0 out.mpg 
mplayer out.mpg 
ffmpeg -f x11grab -video_size cif -framerate 25 -i :0.0 out.mpg 
mplayer out.mpg 
ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i :0.0 out.mpg 
ffmpeg -f x11grab -framerate 25 -i :0.0 out.mpg 
ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i :0.0 out.mpg 
mplayer out.mpg 
ffmpeg -f x11grab -video_size 1366x768 -framerate 40 -i :0.0 out.mpg 
mplayer out.mpg 
ffmpeg -f x11grab -s wxga -framerate 40 -i :0.0 out.mpg 
mplayer out.mpg 
ffmpeg -f x11grab -s wxga -framerate 40 -i :0.0 out.mpg 
du -h out.mpg 
mplayer out.mpg 
ffplay out.mpg 
ffmpeg -f alsa -ac 2 -i hw:0,0  out.mp3
mplayer out.mp3
ffmpeg -f alsa -ac 2 -i hw:0,0  out.ogg
mplayer out.ogg 
du -h out.*
ffmpeg -f alsa -ac 2 -i hw:0,0  out.wav
du -h out.*
rm out.*
ls
ffmpeg -f alsa -ac 2 -i hw:0,0  out.mp3
ffmpeg -i out.mp3 
mplayer out.mp3 
rm out.mp3 
man ffmpeg-all 
ffmpeg -filters
cd Bureau/
du -h out.mp4 
du  out.mp4 
ffmpeg -i out.mp4 
mplayer out.mp4 
ffmpeg -i out.mp4 
rm out.mp4 
man ffmpeg 
man ffmpeg-scalar 
man ffmpeg-scaler 
man ffmpeg 
man ffmpeg-all
du -h --max-depth=1 .wine
du -h --max-depth=1 .wine32/
du -h --max-depth=1 .wine32/drive_c/
du -h --max-depth=1 .wine32/drive_c/Program\ Files/
scp nabila@192.168.1.27:~/prog.tar.gz .
cp /media/aziz/1B7B-A973/prog.tar.gz Documents/
cd Documents/
ls
gunzip 
gunzip prog.tar.gz 
ls
tar xf prog.tar 
ls
ls -a
mv .wine/ wine
ls
ls wine/
ls wine/drive_c/Program\ Files/
cp -R ../.wine32/ ../.wine32old
ls ../.wine32/drive_c/Program\ Files/
cp -R wine/drive_c/Program\ Files/* ../.wine32/drive_c/Program\ Files/
history | grep WINEPREFIX
cd ..
env WINEPREFIX=~/.wine32 WINEARCH=win32 wine .wine32/drive_c/Program\ Files/Microsoft\ Office/Office14/WINWORD.EXE 
ls .wine32
less .wine32/system.reg 
grep aziz .wine32/system.reg 
grep aziz .wine32/*rg | wc -l
grep aziz .wine32/*reg | wc -l
grep aziz .wine32/*reg 
ls
rm prog.tar.gz 
cd Documents/
ls
cd
env WINEPREFIX=~/.wine32 WINEARCH=win32 wine .wine32/drive_c/Program\ Files/Microsoft\ Office/Office14/WINWORD.EXE 
sudo -R rm /media/aziz/1B7B-A973/DIEUDONEWS\ 2014\ _\ Ambiance\ Electrique\ Ã \ Nantes\ -\ Aujourd\'hui\ \(10_01_2014\)\ -\ YouTube\ \[360p\].mp4 /media/aziz/1B7B-A973/org/emacs-24.3* /media/aziz/1B7B-A973/org/
sudo  rm -R /media/aziz/1B7B-A973/DIEUDONEWS\ 2014\ _\ Ambiance\ Electrique\ Ã \ Nantes\ -\ Aujourd\'hui\ \(10_01_2014\)\ -\ YouTube\ \[360p\].mp4 /media/aziz/1B7B-A973/org/emacs-24.3* 
cd /media/aziz/1B7B-A973/
ls
cd org/
ls
cd ..
ls
rm prog.tar.gz 
cd org/
ls
ls inutile/
ls livraison/
ls
cd audio/
ls
for i in *; echo $i; done
for i in *; do echo $i; done
for i in *; do tar cf $i.tar $i ; gzip $i.tar ; rm -R $i ; done
d
cd
ls -a
emacs -nw .conkerorrc
env WINEPREFIX=~/.wine32 WINEARCH=win32 wine .wine32/drive_c/Program\ Files/Microsoft\ Office/Office14/WINWORD.EXE 
ls
rm -R .wine32
sudo rm -R .wine32
ls
mv .wine32old/ .wine32
ls /media/win/
ls /media/win/Downloads/
ls /media/win/Users/
ls /media/win/Users/DARTY/
ls /media/win/Users/DARTY/Documents/
locate *.iso
sudo umount /media/aziz/1B7B-A973 
ls /media/aziz/21D3-FCE1/
ls /media/aziz/21D3-FCE1/ancien/
ls /media/aziz/21D3-FCE1/
ls /media/aziz/21D3-FCE1/No
ls /media/aziz/21D3-FCE1/Nouveau\ dossier/
sudo umount /media/aziz/21D3-FCE1 
ls /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/
ls /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/thinstation/
ls /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/thinstation/README 
cat /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/thinstation/README 
ls /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/ -a
ls /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/thinstation/ -a
sudo umount /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/
sudo umount /media/aziz/MYLINUXLIVE/
vboxmanage startvm linux
fg
ls
ls Téléchargements/
rm -r Téléchargements/wine-1.7.8
sudo rm -r Téléchargements/wine-1.7.8
du -h Téléchargements/
tar cf Telechargements.tar Téléchargements && gzip Telechargements.tar  
ls
emacs -nw
du -h Telechargements.tar.gz 
gunzip Telechargements.tar.gz 
du -h Telechargements.tar
ls
man tar
tar -r secours.org Telechargements.tar 
tar --help
cp secours.org secours.orgbk
ls
tar -rf  Telechargements.tar secours.org 
tar -tf  Telechargements.tar secours.org 
tar -tf  Telechargements.tar 
ls -a
cat .gnomerc 
ls -a
cat .profile 
ls .bin/
ls Documents/
ls Images/
ls
tar tf Telechargements.tar 
tar -tf  Telechargements.tar  .bluetilerc .conkerorrc .tmux.conf .bash_history .gnomerc  
tar -rf  Telechargements.tar  .bluetilerc .conkerorrc .tmux.conf .bash_history .gnomerc  
tar tf Telechargements.tar 
ls
ls -a
ls Bureau/
ls Documents/
tar -rf  Telechargements.tar  Documents/liens.org 
tar tf Telechargements.tar 
cp Telechargements.tar /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/
sudo cp Telechargements.tar /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/
ls /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/
du -h /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/Telechargements.tar 
sudo rm /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/Telechargements.tar 
du -h /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/
du -h /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737/ --max-depth=1
sudo umount /media/aziz/eeb95ebd-725a-4ed2-ac6c-c4593c5be737 
ls /media/aziz/21D3-FCE1/
du -h  /media/aziz/21D3-FCE1/ --max-depth=1
ls  /media/aziz/21D3-FCE1/Nouveau\ dossier/
cp Telechargements.tar /media/aziz/21D3-FCE1/
du -h Telechargements.tar 
sudo umount /media/aziz/21D3-FCE1 
vboxmanage startvm linux
wget -c http://cdimage.debian.org/debian-cd/7.5.0/amd64/iso-dvd/debian-7.5.0-amd64-DVD-1.iso
ls
mv debian-7.5.0-amd64-DVD-1.iso Bureau/
cd Bureau/
ls
dd bs=4M if=debian-live-7.5.0-amd64-gnome-desktop.iso of=/dev/sdb 
ssh azyvers@192.168.1.23
ls
ifconfig
sudo ifconfig
scp ./secours.org azyvers@192.168.1.23:~/
scp -R /media/win/Users/DARTY/Desktop/partage_v/assets azyvers@192.168.1.23:~/orpartage_v/
scp -r /media/win/Users/DARTY/Desktop/partage_v/assets azyvers@192.168.1.23:~/orpartage_v/
scp -r /media/win/Users/DARTY/Desktop/partage_v/assets/stylesheet azyvers@192.168.1.23:~/orpartage_v/assets/
scp -r /media/win/Users/DARTY/Desktop/partage_v/assets/stylesheet.css azyvers@192.168.1.23:~/orpartage_v/assets/
scp -r /media/win/Users/DARTY/Desktop/partage_v/assets/stylesheet.css azyvers@192.168.1.23:~/orpartage_v/assets
scp /media/win/Users/DARTY/Desktop/partage_v/assets/stylesheet.css azyvers@192.168.1.23:~/orpartage_v/assets/
scp /media/win/Users/DARTY/Desktop/partage_v/assets/bootstrap/css/bootstrap.css  azyvers@192.168.1.23:~/orpartage_v/bootstrap/css/
zenity 
htop
ps aux | grep -i vbox
ls
ls Documents/
cat Documents/liens.org 
vboxmanage -l ostypes
vboxmanage list ostypes
vboxmanage list natnets
vboxmanage list inetnets
vboxmanage list intnets
vboxmanage list nattnets
vboxmanage list natnets
vboxmanage list runnungvms
vboxmanage list runningvms
vboxmanage controlvm linux poweroff
vboxmanage 
vboxmanage controlvm linux poweroff
man ssh
ssh azyver@fe80::a00:27ff:fed3:3180
nslookup v-mint.local
vboxmanage showvminfo linux --details
sudo ifconfig
ssh azyver@fe80::a00:27ff:fed3:3180%vboxnet0
ssh azyvers@fe80::a00:27ff:fed3:3180%vboxnet0
ssh azyvers@192.168.56.101
cat /etc/default/ufw 
hostname
sudo ifconfig
history | grep vbox
vboxmanage startvm linux --type headless
vboxmanage list bridgedifs
vboxmanage list dhcpservers
vboxmanage list hostinfo
vboxmanage showvminfo linux
vboxmanage showvminfo linux --details
vboxmanage startvm linux --type headless
ssh azyver@192.168.56.1
ssh azyvers@192.168.56.1
ifconfig
sudo ifconfig
vboxmanage startvm linux 
ssh azyvers@v-mint.local
vboxmanage startvm linux --type headless
ssh azyvers@192.168.56.20
vboxmanage startvm linux
ssh azyvers@v-mint.local
vboxmanage startvm linux --type headless
ssh azyvers@v-mint.local
tmux list
tmux list-sessions
tmux attach 1
tmux attach -t 1
echo $TMUX
unset TMUX
tmux attach -t 1
vboxmanage 
ls /media/win/Users/DARTY/Desktop/
ls /media/win/cygwin/home/DARTY/
ls /media/win/cygwin/home/DARTY/VirtualBox\ VMs/
vboxmanage startvm linux --type headless
ssh azyvers@10.0.2.15
vboxmanage list natnetworks
vboxmanage list intnets
vboxmanage list vms
vboxmanage startvm linux --type headless
vboxmanage list vms
vboxmanage list ostypes
tmux 
vboxmanage controlvm linux poweroff
vboxmanage startvm linux --type headless
nano .ssh/config
ssh pdn
ssh pdn -c word
man ssh
ssh azyvers@192.168.56.101
nano .ssh/config 
ssh pdn
ssh pdn
history | grep -i win
ls .wine32/
emacs -nw
sudo emacs -nw /etc/hosts
fg
ls Bureau/
ls Bureau/iplay/
ls Bureau/iplay/Office2010/
ls -d */
sudo ifconfig
cd Téléchargements/
ls
sudo aptitude search exiftool
sudo aptitude install libimage-exiftool-perl
mplayer 26163_2014-05-21_19-11-27_111175_vf.mp3 
ls
exiftool 111172_2014-05-21_19-00-03_26163_.mp4 
mplayer 111172_2014-05-21_19-00-03_26163_.mp4 
ls
rm 111172_2014-05-21_19-00-03_26163_.mp4 
ls
mplayer 26163_2014-05-21_19-11-27_111175_vf.mp3 
ls
mplayer 26163_2014-05-21_19-03-56_111174_vf.mp3 
rm 26163_2014-05-21_19-03-56_111174_vf.mp3 
ls
hostname
ls Téléchargements/
cp Téléchargements/26163_2014-05-21_19-11-27_111175_vf.mp3 Bureau/iplay/
rm Téléchargements/26163_2014-05-21_19-11-27_111175_vf.mp3 
cd Bureau/
ls
du destination.mp4 
rm destination.mp4 
mkdir aziz
cd aziz/
ls -a
echo bonjour
echo bonjour >fichier.txt
echo je m\'appelle aziz >>fichier.txt 
cat fichier.txt 
sed 's/aziz/Aziz/' fichier.txt 
sed 's/aziz/Aziz/;s/^./\U/' fichier.txt 
sed 's/aziz/Aziz/;s/^./\&U/' fichier.txt 
sed 's/aziz/Aziz/;s/^./&\U/' fichier.txt 
sed 's/aziz/Aziz/;s/^./\u/' fichier.txt 
sed 's/aziz/Aziz/;s/^./\&u/' fichier.txt 
sed 's/aziz/Aziz/;s/^./&\u/' fichier.txt 
man sed
sed 's/aziz/Aziz/;s/^./\u\&/' fichier.txt 
sed 's/aziz/Aziz/;s/^\(.\)/\u\1/' fichier.txt 
cat fichier.txt 
sed -i 's/aziz/Aziz/;s/^\(.\)/\u\1/' fichier.txt 
cat fichier.txt 
rm fichier.txt 
touch fichier.txt
cat fichier.txt 
echo "" >fichier.txt 
rm fichier.txt 
ls
ps
ls
history | grep -i box
vboxmanage controlvm linux poweroff
vboxmanage startvm linux --type headless
ssh pdn
ls
ssh pdn
ssh a-mint.local
ssh -X a-mint.local
echo hello
zsh
ls
cd Bureau/iplay/
ls ../aziz/
rm -r ../aziz/
ls
mplayer 26163_2014-05-21_19-11-27_111175_vf.mp3 
ssh pdn
ps aux
htop
ssh pdn
2ls
ls
ls
cp -R Office2010 Bureau/iplay/
ls
ls Téléchargements/
tar tf Telechargements.tar 
ls
ls M
ls Musique/
ls Téléchargements/
mv Telechargements.tar wine17-unstabe.tar
rm Téléchargements/*
ls
mv wine17-unstabe.tar Téléchargements/
ls Téléchargements/
rm -r wine-1.5.22/
ls
mv winetricks Téléchargements/
ls Téléchargements/
ls Documents/
mv secours.org* Documents/
ls
mv new.org Documents/
ls
ls Documents/
mv Office2010/ Documents/
ls
ls Documents/
ls 

ls 
ls Bureau/
ls Bureau/*iso Documents/
mv Bureau/*iso Documents/
ls
ls Bureau/
ls Téléchargements/
ls Documents/
ls
ls VirtualBox\ VMs/
ls VirtualBox\ VMs/linux/
ls VirtualBox\ VMs/linux/Logs/
emacs
ls
ls VirtualBox\ VMs/
ls VirtualBox\ VMs/linux/
du -h VirtualBox\ VMs/linux/linux.vbox
ls /media/aziz/DVD_VIDEO_RECORDER/
sudo ls /media/aziz/DVD_VIDEO_RECORDER/
sudo file /media/aziz/DVD_VIDEO_RECORDER/
sudo ls /media/aziz/DVD_VIDEO_RECORDER/VIDEO_TS 
sudo du -h --max-depth=1 /media/aziz/DVD_VIDEO_RECORDER/
grep aziz /etc/group
ls /media/aziz/DVD_VIDEO_RECORDER/VIDEO_TS 
sudo ls /media/aziz/DVD_VIDEO_RECORDER/VIDEO_TS 
sudo du -h --max-depth=1 /media/aziz/DVD_VIDEO_RECORDER/VIDEO_TS 
ls
emacs -nw .
sudo aptitude install nmap
nmap -vvv -sn -PR 192.168.1.0/24
sudo ifconfig
nmap -sP 192.168.1.*
ip neigh
nmap -sP 192.168.1.*
ifconfig
sudo ifconfig
nmap -sP 192.168.1.*
ssh -X azyvers@192.168.1.23
tmux
vboxmanage --help
bluetile
sudo shutdown -r now
ssh pdn
ls 
cp /media/win/Users/DARTY/Desktop/MLGRM\ 21-05-2014\ *doc Bureau/iplay/
ls Bureau/iplay/
sudo aptitude
sudo aptitude search ssh
sudo aptitude install openssh-server
vboxmanage startvm linux --type headless
ssh pdn
tmux
sudo shutdown -r now
vboxmanage startvm linux --type headless
ssh pdn
sudo ifconfig
ssh azyvers@192.168.56.1
sudo ifconfig
ssh azyvers@192.168.1.13
ssh azyvers@192.168.1.15
virtualbox
vboxmanage
vboxmanage controlvm linux shutdown
vboxmanage controlvm linux poweroff
vboxmanage startvm linux 
ssh pdn
sudo shutdown -r now
sudo add-apt-repository ppa:ubuntu-wine/ppa
w3m google.fr
ls /etc/apt/sources.list.d/
w3m google.fr
tmux
tmux attach
sudo aptitude 
sudo nano /etc/apt/sources.list.d/ubuntu-wine-ppa-testing.list 
sudo mv /etc/apt/sources.list.d/ubuntu-wine-ppa-testing.list  /etc/apt/sources.list.d/ubuntu-wine-ppa-raring.list 
sudo aptitude 
ta
tmux attach
sudo aptitude 
ssh pdn
sudo dpkg -s conkeror
sudo dpkg -L conkeror
emacs -nw ~/.tmux.conf
lg conkeror /usr/share/applications/
cat /usr/bin/firefox 
sudo aptitude
cat /etc/apt/sources.list.d/official-package-repositories.list 
cat /etc/apt/sources.list.d/official-package-repositories.list 
mate-default-applications-properties 
gvfs-mime --query x-scheme-handler/http
gvfs
gvfs-mime --help
man gvfs-mime 
xdg-open "http://google.fr"
gvfs-mime --query x-scheme-handler/http
gvfs-mime --set x-scheme-handler/http conkeror.desktop
gvfs-open "http://google.fr"
gvfs-open "https://google.fr"
gvfs-mime --set x-scheme-handler/https conkeror.desktop
echo gvfs-mime --set x-scheme-handler/http conkeror.desktop
echo "* Change default webbrower to Conkeror in LinuxMint-MATE" >> confs/README.md 
echo gvfs-mime --set x-scheme-handler/http conkeror.desktop >> confs/README.md 
echo gvfs-mime --set x-scheme-handler/https conkeror.desktop >> confs/README.md 
cat confs/README.md 
cd confs/
git status
git add README.md 
git commit -m "change default webbrowser on mint-mate"
git push
git mv README.md README.org
git status
git commit -m "use orgmode for README"
git push
nanp README.org 
nano README.org 
git status
git commit
git add README.md 
git add README.org 
git commit
git status
git push
cd
ls -a
cat .gitconfig 
cat .bash_profile 
man w3m
source .bash_profile 
man w3m
sudo aptitude
sudo aptitude update
ls
ls Bureau/
ls Téléchargements/
ls Documents/
sudo aptitude update
ls Téléchargements/
ls /media/win/Users/DARTY/Desktop/
ls /media/win/Users/DARTY/Desktop/Aziz/
ls /media/win/Users/DARTY/Desktop/Aziz/*iso
ls /media/win/Users/DARTY/Desktop/*iso
ls /media/win/Users/DARTY/Downloads/*iso
ls /media/win/Users/DARTY/Documents/*iso
ls /media/win/Users/DARTY/*iso
ls /media/win/Downloads/*iso
ls
ls Documents/
dd if=Documents/debian-7.5.0-amd64-DVD-1.iso of=/dev/sdc
dd bs=2M if=Documents/debian-7.5.0-amd64-DVD-1.iso of=/dev/sdc
md5sum Documents/debian-7.5.0-amd64-DVD-1.iso 
ssh pdn
sudo aptitude search packagekit
sudo aptitude install gnome-packagekit
w3m
w3m google.fr
cat /etc/apt/sources.list.d/official-package-repositories.list 
sudo nano /etc/apt/sources.list.d/official-package-repositories.list 
ping debian.linuxmint.com
sudo dpkg --print-architecture
sudo dpkg --print-foreign-architectures
sudo apt-get install wine
sudo apt-get install wine1.6
sudo apt-get install wine1.6 wine1.6-i386 
sudo apt-get install wine1.6 wine1.6-i386 wine1.6-amd64 libpulse0:i386 
sudo aptitude search libpulse0
sudo aptitude show libpulse0:i386
sudo aptitude install libpulse0:i386
sudo aptitude install libpulse0
sudo aptitude 
cd
git clone 
git clone git@github.com:azizyemloul/confs.git
ls
git clone https://github.com/azizyemloul/confs.git
ls -a
cp .bluetilerc confs/
cd confs/
git status
git add .bluetilerc 
git status
git commit -m "ajout de bluetilerc depuis azydic"
git config --global user.email "azizyemloul@gmail.com"
git config --global user.name "Aziz"
git status
git commit -m "ajout de bluetilerc depuis azydic"
git status
git push
ls -a
lg browser /etc/alternatives/
cd ..
ls -a
cat .bashrc 
cd confs/
git pull
ls -a
cat .bash_profile 
nano ../.bash_profile
emacsclient -t ../.bash_profile
nano ../.bash_profile
source ../.bash_profile 
lg browser /etc/alternatives/
ls -l /etc/alternatives/*borwser*
ls -l /etc/alternatives/www-browser
ls -l /etc/alternatives/x-www-browser
ls -l /etc/alternatives/ | grep -i firefox
ls -l /etc/alternatives/ | grep  firefox
ls -l /etc/alternatives/ | grep  Firefox
ls -l /etc/alternatives/ | grep  -i mozilla
sudo aptitude show conkeror
sudo aptitude help
sudo aptitude show -v conkeror
sudo dpkg --help
mate-default-applications-properties 
echo $DISPLAY
echo $XDG_DATA_HOME
ls /usr/share/
cd Bureau/
ls
cd iplay/
ls
vboxmanage startvm linux --type headless 
tmux
sudo aptitude
tmux attach
