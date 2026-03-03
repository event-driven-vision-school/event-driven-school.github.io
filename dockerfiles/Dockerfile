FROM ubuntu:22.04
LABEL org.opencontainers.image.title="Event driven vision School Docker Image"
LABEL org.opencontainers.image.description="Stack of components required to run Event driven vision School assignments"
LABEL org.opencontainers.image.source="https://github.com/orgs/event-driven-vision-school/evs-school.github.io"
LABEL org.opencontainers.image.authors="Ugo Pattacini <ugo.pattacini@iit.it>, Massimiliano Iacono <massimiliano.iacono@iit.it>"

# Non-interactive installation mode
ENV DEBIAN_FRONTEND=noninteractive

# Update apt database
RUN apt update

# Install essentials
RUN apt install -y wget sudo git build-essential cmake dos2unix

# Install VSCode
# better off downling the deb file than relying on packages.microsoft.com sources that are often broken
RUN wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868 && \
    apt install -y ./code.deb && \
    rm code.deb

# Install graphics
RUN apt install -y xfce4 xfce4-goodies xserver-xorg-video-dummy xserver-xorg-legacy x11vnc && \
    apt remove -y xfce4-power-manager xfce4-screensaver light-locker && \
    apt autoremove -y && \
    sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config
COPY xorg.conf /etc/X11/xorg.conf
RUN dos2unix /etc/X11/xorg.conf


# Install noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    git clone https://github.com/novnc/websockify /opt/novnc/utils/websockify && \
    echo "<html><head><meta http-equiv=\"Refresh\" content=\"0; url=vnc.html?autoconnect=true&reconnect=true&reconnect_delay=1000&resize=scale&quality=9\"></head></html>" > /opt/novnc/index.html

# Set up script to launch graphics and vnc
COPY start-vnc-session.sh /usr/bin/start-vnc-session.sh
RUN chmod +x /usr/bin/start-vnc-session.sh && \
    dos2unix /usr/bin/start-vnc-session.sh

# Set up VSCode launcher
COPY ["Visual Studio Code.desktop", "/home/student/Desktop/Visual Studio Code.desktop"]
RUN chmod +x "/home/student/Desktop/Visual Studio Code.desktop"


# Create user student
RUN useradd -l -u 33333 -G sudo -md /home/student -s /bin/bash -p student student && \
    # passwordless sudo for users in the 'sudo' group
    sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# Make sure specific dirs are owned by student user
RUN chown -R student.student /home/student
# Manage ports
EXPOSE 5901 6080 
# Clean up unnecessary installation products
RUN rm -Rf /var/lib/apt/lists/*

# Switch to student user
USER student

# Set environmental variables
ENV DISPLAY=:1

# Launch bash from /workspace
WORKDIR /workspace
CMD ["bash"]