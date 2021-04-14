## User Patches
Here you can put your user patches. 

Those patches will be copied into the community patches so you can add them to your configurations (.cfg).
### Example
You have two user patches inside resources/patches directory "userpatch1.mypatch" and "userpatch2.mypatch". 

Now you can add configuration file into "resources/configs/myconfig.cfg". 

Beside the usual configurations of wine-tkg, you can add your userpatches into the "_community_patches" key like the following: 

_community_patches="userpatch1.mypatch userpatch2.mypatch"
