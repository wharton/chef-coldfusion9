COOKBOOK FILES
==============

ColdFusion 9
------------
You must download the 32-bit linux ColdFusion 9 installer and place 
it in this folder. This file is available form adobe.com, 
http://www.adobe.com/products/coldfusion-developer.html.

* ColdFusion_9_WWE_linux.bin


ColdFusion 9 Update 1 (9.0.1) 
-----------------------------
By default this cookbook is configured to download the ColdFusion 
9.0.1 installer, however if you will be using this cookbook 
frequently you may want to pre-download this installer and place it 
in this directory so chef doesn't have to download it every time 
you provision a server. This file is available from adobe.com, 
http://www.adobe.com/support/coldfusion/downloads_updates.html#cf9.

* ColdFusion_update_901_WWEJ_linux.bin

To use this cookbook file comment out the related 
`default['cf9']['standalone']` default attribute(s).


ColdFusion 9.0.1 Cumulative Hot Fix 2
-------------------------------------
As with the ColdFusion 9.0.1 installer, this cookbook is configured 
to download the files for this hot fix by default. However if you 
will be using this cookbook frequently you may want to download 
these files and place them in this directory so chef doesn't have
to download them every time you provision a server. These files are 
available from adobe.com, 
http://kb2.adobe.com/cps/918/cpsid_91836.html.

* CF901.zip
* CFIDE-901.zip

To use these cookbook files comment out the related 
`default['cf9']['chf9010002']` default attribute(s).


ColdFusion Security Hotfix
--------------------------
As with the ColdFusion 9.0.1 installer, this cookbook is configured 
to download the files for this hot fix by default. However if you 
will be using this cookbook frequently you may want to download 
these files and place them in this directory so chef doesn't have
to download them every time you provision a server. These files are 
available from adobe.com, 
http://kb2.adobe.com/cps/925/cpsid_92512.html.

* CF901jar.zip

To use these cookbook files comment out the related 
`default['cf9']['hf900100003']` default attribute(s).

