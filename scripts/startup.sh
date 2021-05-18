addgroup --gid $GROUPID builder
adduser --uid $USERID --gid $GROUPID --disabled-password -gecos "" builder
export PATH=$PATH:/usr/xbin
> /etc/environment
echo 'builder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers