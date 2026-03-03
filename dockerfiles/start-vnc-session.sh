pkill -9 -f "novnc" && sudo pkill -9 x11vnc && pkill -9 -f "xf" && sudo pkill -9 Xorg
sudo rm -f /tmp/.X1-lock
X ${DISPLAY} > /dev/null 2>&1 & disown
startxfce4 > /dev/null 2>&1 & disown
wget https://edpr.iit.it/documents/216639/957505/2026_EVS_whiteLogo.png -O /tmp/evs_logo.png > /dev/null 2>&1
sudo x11vnc -localhost -display ${DISPLAY} -N -forever -shared > /dev/null 2>&1 & disown
/opt/novnc/utils/novnc_proxy --web /opt/novnc --vnc localhost:5901 --listen 6080 > /dev/null 2>&1 & disown
xfce4-terminal -e "xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /tmp/evs_logo.png"
