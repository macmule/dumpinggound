### DO NOT USE THIS FILE IS JUST A DUMPING GROUND OF STUFF ###

[github file = "/macmule/dumpinggound/blob/master/contents.sh" start_line = "" end_line = ""]

#!/bin/bash
 
#Backup the original authorization file
/bin/cp /etc/authorization /etc/authorization.original.backup
 
#Modify /etc/authorization to allow any member of the everyone group access to unlock preferences
/usr/libexec/PlistBuddy -c "Set :rights:system.preferences:group everyone" /etc/authorization
/usr/libexec/PlistBuddy -c "Set :rights:system.preferences:shared true" /etc/authorization
 
SQLCMD
use UTS
GO
UPDATE font__font_clientSettings SET font_clientsettings_replication_policy = 'all' WHERE font_clientsettings_replication_policy = 'on-demand-local-cache';
UPDATE font__font_clientSettings SET font_clientsettings_has_personal_workgroup = 'T';
UPDATE font__font_clientSettings SET font_clientsettings_personal_workgroup_is_local = 'T';
UPDATE font__font_permissions SET font_permissions_canactivateacrossworkgroups = 'T';
GO

#!/bin/bash

#Backup the original authorization file
sudo cp /etc/authorization /etc/authorization.bak

#Modify /etc/authorization to create a kerberos ticket at login
sudo /usr/libexec/PlistBuddy -c "Add :rights:system.login.console:mechanisms:11 string "builtin:krb5store,privileged"" /etc/authorization

# Backup the original swupd.plist
sudo cp /etc/swupd/swupd.plist /etc/swupd/swupd.plist.bak

# Change the MetaIndexURL to point to your own SUS (replace swupdate.example.com with your SUS's FQDN).
sudo /usr/libexec/PlistBuddy -c 'set metaIndexURL http://swupdate.example.com:8088/catalogs.sucatalog' /etc/swupd/swupd.plist

sudo rm -rf /private/etc/swupd/com.apple.server.swupdate.plist
sudo rm -rf /private/etc/swupd/com.apple.server.swupdate.plist.previous
sudo rm -rf /private/var/db/swupd/html/content/downloads/*

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
      <key>PrimaryCatalog</key>
      <string>http://swupdate.example.com/content/catalogs/index.sucatalog</string>
      <key>CatalogsList</key>
      <array>
            <string>http://swupdate.example.com/content/catalogs/index.sucatalog</string>
            <string>http://swupdate.example.com/content/catalogs/others/index-leopard.merged-1.sucatalog</string>
            <string>http://swupdate.example.com/content/catalogs/others/index-leopard-snowleopard.merged-1.sucatalog</string>
      </array>
</dict>

sudo /usr/libexec/PlistBuddy -c 'set metaIndexURL http://swupdate.example.com:8088/content/meta/mirror-config-1.plist' /etc/swupd/swupd.plist

ln -s /usr/share/swupd/html/content/catalogs/index.sucatalog
ln -s /usr/share/swupd/html/content/catalogs/others/index-leopard.merged-1.sucatalog
ln -s /usr/share/swupd/html/content/catalogs/others/index-leopard-snowleopard.merged-1.sucatalog

<VirtualHost jss.mycompany.com:80>
	Redirect 301 / http://jss.mycompany.com:9006
</VirtualHost>

defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool true

sudo languagesetup

sudo languagesetup –langspec French

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences AppleLanguages "(en, ja, fr, de, es, it, nl, sv, nb, da, fi, pt, zh-Hans, zh-Hant, ko)"

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences AppleLocale "en_GB"

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences Country "en_GB"

/usr/bin/defaults write -g AppleLanguages "(en, ja, fr, de, es, it, nl, sv, nb, da, fi, pt, zh-Hans, zh-Hant, ko)"

defaults write /Library/ScriptingAdditions/Adobe\ Unit\ Types.osax/Contents/Info CFBundleVersion 2.1.0

sudo dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin

sudo dsconfigad -useuncpath disable

sudo nano /private/etc/apache2/httpd.conf

Include /private/etc/apache2/extra/httpd-vhosts.conf

sudo nano  /private/etc/apache2/extra/httpd-vhosts.conf

sudo serveradmin command web:command=restoreFactorySettings

sudo ln -s /Shared\ Items/CasperShare /private/var/empty

LABEL=Users\040HD /Users hfs rw

#!/bin/sh

# Gets the UUID of the Partition "Users HD"
usersUUID=`diskutil info Users\ HD | grep Volume\ UUID: | awk '{print $3}'`

# Echo UUID
echo "Users HD UUID is $usersUUID..."

# Empty the FSTAB file, just leaving the UUID mountpoint
echo > $1/private/etc/fstab "UUID=$usersUUID /Users hfs rw"

# Echo we've completed
echo "Created FSTAB at $1/private/etc..."

# Correct owner
chown root $1/private/etc/fstab

# Correct permissions
chmod 755 $1/private/etc/fstab

# Echo that we've corrected permissions
echo "Repaired FSTAB permissions..."

defaults write com.apple.Safari  com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool true

defaults write com.apple.Safari ExtensionsEnabled -bool YES

if ADGroups contains "<insert_printer_name>" then
     if installedPrinters does not contain "<insert_printer_name>" then 
          try
               do shell script "/usr/sbin/lpadmin -p <insert_printer_name> -E -v lpd://<insert_printer_name>.macmule.com -P /Library/Printers/PPDs/Contents/Resources/en.lproj/Canon\\ iR-ADV\\ C5200s-B2\\ PS\\ V1.0 -o printer-is-shared=false -o EFDuplex=False" 
     on error 
               do shell script "/usr/sbin/lpadmin -p <insert_printer_name> -E -v lpd://<insert_printer_name>.macmule.com -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd -o printer-is-shared=false" 
          end try 
     end if 
end if

lpoptions -p <insert_printer_name> -l

defaults write ~/Library/Preferences/com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false

defaults write ~/Library/Preferences/com.apple.Safari NewWindowBehavior -integer 0

sudo touch /var/log/jamfChangeManagement.log 

sudo chmod 777 /var/log/jamfChangeManagement.log


sudo cp -r /usr/local/mysql/support-files/my-huge.cnf /private/etc/my.cnf
sudo chown root /etc/my.cnf

w32tm /monitor

sudo launchctl unload /System/Library/LaunchDaemons/org.ntp.ntpd.plist

sudo nano /etc/ntp-restrict.conf

sudo launchctl load /System/Library/LaunchDaemons/org.ntp.ntpd.plist

# Backup the original swupd.plist
sudo cp /Library/Server/Software\ Update/Config/swupd.plist /Library/Server/Software\ Update/Config/swupd.plist.bak

# Change the MetaIndexURL to point to your own SUS (replace swupdate.example.com with your SUS's FQDN).
sudo /usr/libexec/PlistBuddy -c 'set metaIndexURL http://swupdate.example.com:8088/catalogs.sucatalog' /Library/Server/Software\ Update/Config/swupd/swupd.plist

sudo rm -rf /Library/Application\ Support/JAMF/Downloads/*

#!/bin/bash

# Get the username of the currently logged in user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

#################
# Allow the Microsoft Sharepoint Plug-In
#################
/usr/libexec/plistbuddy -c "delete ManagedPlugInPolicies:com.microsoft.sharepoint.browserplugin" /Users/$loggedInUser/Library/Preferences/com.apple.Safari.plist
/usr/libexec/plistbuddy -c "add ManagedPlugInPolicies:com.microsoft.sharepoint.browserplugin dict" /Users/$loggedInUser/Library/Preferences/com.apple.Safari.plist
/usr/libexec/plistbuddy -c "add ManagedPlugInPolicies:com.microsoft.sharepoint.browserplugin:PlugInFirstVisitPolicy string PlugInPolicyAllowNoSecurityRestrictions" /Users/$loggedInUser/Library/Preferences/com.apple.Safari.plist

#!/usr/bin/python
import CoreFoundation 

ManagedPlugInPolicies = {

# Always Allow Sharepoint plugin
    "com.microsoft.sharepoint.browserplugin": { 
        "PlugInFirstVisitPolicy": "PlugInPolicyAllowNoSecurityRestrictions", 
    }} 

CoreFoundation.CFPreferencesSetAppValue("ManagedPlugInPolicies", ManagedPlugInPolicies,  "com.apple.Safari") 
CoreFoundation.CFPreferencesAppSynchronize("com.apple.Safari")

killall cfprefsd

sudo defaults write /Library/Preferences/com.apple.loginwindow PasswordExpirationDays 10

system_profiler SPHardwareDataType | grep 'Hardware UUID' | awk '{print $3}'

## Get the Macs UUID
set macUUID to do shell script "system_profiler SPHardwareDataType | grep 'Hardware UUID' | awk '{print $3}'"
log "Retreived this Macs UUID..."
## Try to delete the local items Keychain db's
try
	do shell script "rm -rf ~/Library/Keychains/" & macUUID & "/*"
end try
## Delete the login Keychain
try
	do shell script "security delete-keychain ~/Library/Keychains/login.keychain"
	log "Deleted old keychain..."
on error ## If cannot find the login keychain, then prompt to create a new one.
	log "Couldn't find old Login Keychain..."
	cannotFindKeychain_(me)
end try
log "Deleted local items keychain..."
## Close the password prompt window
closePasswordPromptWindow_(me)
## 10.9.x needs the mac client to restart as securityd or another daemon process owned by the system is used to update the local items keychain
log "Prompting to restart"
display dialog "Your Mac needs to restart to finish updating your Keychain. Please dismiss any Local Items keychain prompts, close any open Applications & click Restart Now." with icon 0 buttons ("Restart Now")
## Restart the Mac
log "Restarting..."
tell application "System Events"
	restart
end tell

defaults write org.pmbuko.ADPassMon selectedBehaviour -int 2

do shell script "dscl . -passwd /Users/$USER " & quoted form of enteredOldPassword & " " & quoted form of enteredNewPassword

defaults write org.pmbuko.ADPassMon enableKeychainLockCheck -bool true

try
  do shell script "security unlock-keychain -p ~/Library/Keychains/login.keychain"
  set keychainState to "unlocked"
  log "  Keychain unlocked..."
on error
  set keychainState to "locked"
end try

do shell script "security set-keychain-password -o " & quoted form of enteredOldPassword & " -p " & quoted form of enteredNewPassword & " ~/Library/Keychains/login.keychain"

defaults write org.pmbuko.ADPassMon keychainPolicy "<some text>"

defaults write org.pmbuko.ADPassMon pwPolicyURLButtonTitle "<button title>"
defaults write org.pmbuko.ADPassMon pwPolicyURLButtonURL "<some url>"

defaults write org.pmbuko.ADPassMon pwPolicyURLBrowser "<browser name>"

defaults write org.pmbuko.ADPassMon passwordCheckInterval -int "<interval in hours>"

defaults write org.pmbuko.ADPassMon allowPasswordChange -bool "<boolean value>"

dscl '<Domain Node Name>' -read /Users/<username> | grep "UniqueID:"

sudo jamf recon

sudo jamf recon -endUsername $3

sudo /Library/Application\ Support/JAMF/bin/setregproptool -c

/usr/local/mysql/bin/mysql -u root

mysql> USE jamfsoftware;

mysql> select computer_id,default_distribution_point_id from computers where default_distribution_point_id != '';

+-------------+-------------------------------+
| computer_id | default_distribution_point_id |
+-------------+-------------------------------+
|         200 |                             8 |
|           3 |                            14 |
|           7 |                             7 |
|           8 |                             6 |
|           9 |                             4 |
|          10 |                             8 |
|         292 |                            12 |
|          12 |                            14 |
|          13 |                            14 |
|          15 |                            5  |

mysql> update computers set default_distribution_point_id=-1;

+-------------+-------------------------------+
| computer_id | default_distribution_point_id |
+-------------+-------------------------------+
|         200 |                            -1 |
|           3 |                            -1 |
|           7 |                            -1 |
|           8 |                            -1 |
|           9 |                            -1 |
|          10 |                            -1 |
|         292 |                            -1 |
|          12 |                            -1 |
|          13 |                            -1 |
|          15 |                            -1 |

<Event><Timestamp data_type="4">05/19/2014 15:21:44.008</Timestamp><Computer-Name data_type="1">NPSServer</Computer-Name><Event-Source data_type="1">IAS</Event-Source><User-Name data_type="1">ComputerName.domain.com</User-Name><Calling-Station-Id data_type="1">f8-1e-df-e8-84-5a</Calling-Station-Id><Called-Station-Id data_type="1">00-3a-98-9c-aa-70:Internal Test network</Called-Station-Id><NAS-Port data_type="0">1</NAS-Port><NAS-IP-Address data_type="3">10.255.100.1</NAS-IP-Address><NAS-Identifier data_type="1">WLANCON</NAS-Identifier><Vendor-Specific data_type="2">0000376301060000000F</Vendor-Specific><Service-Type data_type="0">2</Service-Type><Framed-MTU data_type="0">1300</Framed-MTU><NAS-Port-Type data_type="0">19</NAS-Port-Type><Tunnel-Type data_type="0">13</Tunnel-Type><Tunnel-Medium-Type data_type="0">6</Tunnel-Medium-Type><Tunnel-Pvt-Group-ID data_type="1">110</Tunnel-Pvt-Group-ID><Client-IP-Address data_type="3">10.255.100.1</Client-IP-Address><Client-Vendor data_type="0">0</Client-Vendor><Client-Friendly-Name data_type="1">WLANCON</Client-Friendly-Name><Cisco-AV-Pair data_type="1">audit-session-id=0aff64010001f864537a1279</Cisco-AV-Pair><Proxy-Policy-Name data_type="1">Secure Wireless Connections</Proxy-Policy-Name><Provider-Type data_type="0">1</Provider-Type><SAM-Account-Name data_type="1">DOMAIN\ComputerName.domain.com</SAM-Account-Name><Fully-Qualifed-User-Name data_type="1">DOMAIN\ComputerName.domain.com</Fully-Qualifed-User-Name><Class data_type="1">311 1 10.1.2.42 05/16/2014 02:17:48 1307</Class><Authentication-Type data_type="0">5</Authentication-Type><Packet-Type data_type="0">1</Packet-Type><Reason-Code data_type="0">0</Reason-Code></Event>
<Event><Timestamp data_type="4">05/19/2014 15:21:44.008</Timestamp><Computer-Name data_type="1">NPSServer</Computer-Name><Event-Source data_type="1">IAS</Event-Source><Class data_type="1">311 1 10.1.2.42 05/16/2014 02:17:48 1307</Class><Authentication-Type data_type="0">5</Authentication-Type><Fully-Qualifed-User-Name data_type="1">DOMAIN\ComputerName.domain.com</Fully-Qualifed-User-Name><SAM-Account-Name data_type="1">DOMAIN\ComputerName.domain.com</SAM-Account-Name><Provider-Type data_type="0">1</Provider-Type><Proxy-Policy-Name data_type="1">Secure Wireless Connections</Proxy-Policy-Name><Client-Friendly-Name data_type="1">WLANCON</Client-Friendly-Name><Client-Vendor data_type="0">0</Client-Vendor><Client-IP-Address data_type="3">10.255.100.1</Client-IP-Address><Packet-Type data_type="0">3</Packet-Type><Reason-Code data_type="0">8</Reason-Code></Event>
<Event><Timestamp data_type="4">05/19/2014 15:36:50.977</Timestamp><Computer-Name data_type="1">NPSServer</Computer-Name><Event-Source data_type="1">IAS</Event-Source><User-Name data_type="1">ComputerName$</User-Name><Calling-Station-Id data_type="1">b8-e8-56-36-b6-58</Calling-Station-Id><Called-Station-Id data_type="1">00-3a-98-9c-aa-70:Internal Test network</Called-Station-Id><NAS-Port data_type="0">1</NAS-Port><NAS-IP-Address data_type="3">10.255.100.1</NAS-IP-Address><NAS-Identifier data_type="1">WLANCON</NAS-Identifier><Vendor-Specific data_type="2">0000376301060000000F</Vendor-Specific><Service-Type data_type="0">2</Service-Type><Framed-MTU data_type="0">1300</Framed-MTU><NAS-Port-Type data_type="0">19</NAS-Port-Type><Tunnel-Type data_type="0">13</Tunnel-Type><Tunnel-Medium-Type data_type="0">6</Tunnel-Medium-Type><Tunnel-Pvt-Group-ID data_type="1">110</Tunnel-Pvt-Group-ID><Client-IP-Address data_type="3">10.255.100.1</Client-IP-Address><Client-Vendor data_type="0">0</Client-Vendor><Client-Friendly-Name data_type="1">WLANCON</Client-Friendly-Name><Cisco-AV-Pair data_type="1">audit-session-id=0aff64010001f8e5537a1704</Cisco-AV-Pair><Proxy-Policy-Name data_type="1">Secure Wireless Connections</Proxy-Policy-Name><Provider-Type data_type="0">1</Provider-Type><SAM-Account-Name data_type="1">DOMAIN\ComputerName$</SAM-Account-Name><Fully-Qualifed-User-Name data_type="1">DOMAIN\ComputerName$</Fully-Qualifed-User-Name><Class data_type="1">311 1 10.1.2.42 05/16/2014 02:17:48 1389</Class><Authentication-Type data_type="0">5</Authentication-Type><NP-Policy-Name data_type="1">Secure Wireless Connections</NP-Policy-Name><Quarantine-Update-Non-Compliant data_type="0">1</Quarantine-Update-Non-Compliant><Packet-Type data_type="0">1</Packet-Type><Reason-Code data_type="0">0</Reason-Code></Event>
<Event><Timestamp data_type="4">05/19/2014 15:36:50.977</Timestamp><Computer-Name data_type="1">NPSServer</Computer-Name><Event-Source data_type="1">IAS</Event-Source><Class data_type="1">311 1 10.1.2.42 05/16/2014 02:17:48 1389</Class><Session-Timeout data_type="0">30</Session-Timeout><Quarantine-Update-Non-Compliant data_type="0">1</Quarantine-Update-Non-Compliant><NP-Policy-Name data_type="1">Secure Wireless Connections</NP-Policy-Name><Authentication-Type data_type="0">5</Authentication-Type><Client-IP-Address data_type="3">10.255.100.1</Client-IP-Address><Client-Vendor data_type="0">0</Client-Vendor><Client-Friendly-Name data_type="1">WLANCON</Client-Friendly-Name><Proxy-Policy-Name data_type="1">Secure Wireless Connections</Proxy-Policy-Name><Provider-Type data_type="0">1</Provider-Type><SAM-Account-Name data_type="1">DOMAIN\ComputerName$</SAM-Account-Name><Fully-Qualifed-User-Name data_type="1">DOMAIN\ComputerName$</Fully-Qualifed-User-Name><Packet-Type data_type="0">11</Packet-Type><Reason-Code data_type="0">0</Reason-Code></Event>

<Reason-Code data_type="0">8</Reason-Code>

<User-Name data_type="1">ComputerName.domain.com</User-Name>

<User-Name data_type="1">ComputerName$</User-Name>

safari.self.browserWindow.addEventListener("command", handle_command, false);

function handle_command(event) {
    if (event.command === "toggle_bar")
        toggle_bar();
    if (event.command === "contextual_search")
        contextual_search();
}

function toggle_bar() {
    if (safari.self.visible)
        safari.self.hide();
    else
        safari.self.show();
}

function showBar() {
    if (!safari.self.visible)
        safari.self.show();
}

<!DOCTYPE html>
<html>
	<head>
		<title>macmule Toolbar</title>
		<link rel="stylesheet" href="extension_bar.css" type="text/css" charset="utf-8">
	</head>
	<body>
		<script src="toolbar_button.js" type="text/javascript" charset="utf-8"></script>
		<div id="logo" style="float:left">
			<a id="main_link" href="http://macmule.com"><img src="extension_bar_icon.png" width="19" height="17" alt="mymacmule" title="mymacmule" url_piece="/" ></a>	
		</div>
		&nbsp;
		<span id="links">
			|
			<a href="http://techjournal.318.com" class="link">318</a>
			<a href="http://www.afp548.com" class="link">afp548</a>
			<a href="http://derflounder.wordpress.com" class="link">Der Flounder</a>
			<a href="http://grahamgilbert.com" class="link">Graham Gilbert</a>
			<a href="http://krypted.com" class="link">Krypted</a>
			<a href="http://managingosx.wordpress.com" class="link">Managing OSX</a>
			|
			<a href="https://jamfnation.jamfsoftware.com/index.html" class="link">JAMFNation</a>
			<a href="http://www.macenterprise.org" class="link">Mac Enterprise</a>
			<a href="http://webchat.freenode.net/?channels=#%23osx-server" class="link">osx-server IRC</a>
			|
			<a href="http://support.apple.com/kb/HT6175?viewlocale=en_US" class="link">Apple TCP UDP Ports</a>
			<a href="http://static.afp548.com/mactips/bootpd.html" class="link">NetBoot</a>
			<a href="http://support.apple.com/kb/ht1159" class="link">OSX Builds</a>
			<a href="http://ss64.com" class="link">ss64</a>
		</span>
	</body>
</html>

body
{
margin:0;
padding:3px;
}

#logo
{
border:1px solid rgba(0,0,0,0);padding:2px 2px 1px 2px
}

#logo:hover
{
border-radius:3px;border:1px solid #999;background:-webkit-gradient(linear,left top,left bottom,from(#ddd),to(#afafaf))
}

#logo:active
{
border-radius:3px;border:1px solid #999;background:-webkit-gradient(linear,left top,left bottom,from(#aaa),to(#ccc))
}

#links
{
margin-top:3px;
display:inline-block
}

a.link
{
color:#282828;
font-weight:bold;
text-shadow:0 1px 0 rgba(255,255,255,0.4);
text-decoration:none;
padding:1px 2px 2px;
display:inline-block;
border-radius:8px;
cursor:default;
border:none;
background:none;
font:bold 11px helvetica,
}

a.link:hover
{
color:#fff;
text-shadow:0 1px 0 rgba(0,0,0,0.4);
background:rgba(0,0,0,0.21)
}

a.link:active,a.link.toggled
{
color:#fff;
text-shadow:0 1px 0 rgba(0,0,0,0.4);
-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.5),0 1px 1px rgba(255,255,255,0.8)
}

a.link .toggled
{
background:rgba(0,0,0,0.35)
}

	<key>NSToolbar Configuration BrowserToolbarIdentifier</key>
	<dict>
		<key>TB Default Item Identifiers</key>
		<array>
			<string>BackForwardToolbarIdentifier</string>
			<string>com.mycomany.extension-myDeveloperID identifier</string>
			<string>CloudTabsToolbarIdentifier</string>
			<string>ShareToolbarIdentifier</string>
			<string>InputFieldsToolbarIdentifier</string>
			<string>ShowDownloadsToolbarIdentifier</string>
		</array>
		<key>TB Display Mode</key>
		<integer>2</integer>
		<key>TB Icon Size Mode</key>
		<integer>1</integer>
		<key>TB Is Shown</key>
		<integer>1</integer>
		<key>TB Item Identifiers</key>
		<array>
			<string>BackForwardToolbarIdentifier</string>
			<string>CloudTabsToolbarIdentifier</string>
			<string>ShareToolbarIdentifier</string>
			<string>com.mycomany.extension-myDeveloperID identifier</string>
			<string>InputFieldsToolbarIdentifier</string>
			<string>ShowDownloadsToolbarIdentifier</string>
		</array>
		<key>TB Size Mode</key>
		<integer>1</integer>
	</dict>
	
security find-generic-password -l "Safari Extensions List" -g

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

/dev/disk0
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *251.0 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                  Apple_HFS Macintosh HD            85.0 GB    disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
   4:                  Apple_HFS Users HD                165.0 GB   disk0s4
   
#!/bin/bash

jamf policy -trigger OSXPostflightConfig

#!/bin/bash

sudo touch /.JSS-Managed

#!/bin/sh

jssSupervisedStatusReceipt=`ls -a / | grep -i .jss-* | grep -v .jssUpdates-* | grep -v .jssMaintenance-* | cut -c 6-`

echo "<result>$jssSupervisedStatusReceipt</result>"

Error creating partition map: Placing a partition map on a Core Storage logical volume is not supported (-69671)

diskutil coreStorage
Usage:  diskutil [quiet] coreStorage|CS <verb> <options>,
        where <verb> is as follows:

     list                     (Show status of CoreStorage volumes)
     info[rmation]            (Get CoreStorage information by UUID or disk)
     convert                  (Convert a volume into a CoreStorage volume)
     revert                   (Revert a CoreStorage volume to its native type)
     create                   (Create a new CoreStorage logical volume group)
     delete                   (Delete a CoreStorage logical volume group)
     createVolume             (Create a new CoreStorage logical volume)
     deleteVolume             (Delete a volume from a logical volume group)
     encryptVolume            (Encrypt a CoreStorage logical volume)
     decryptVolume            (Decrypt a CoreStorage logical volume)
     unlockVolume             (Attach/mount a locked CoreStorage logical volume)
     changeVolumePassphrase   (Change a CoreStorage logical volumes passphrase)

diskutil coreStorage <verb> with no options will provide help on that verb

#!/bin/sh

# Echo target drive
echo "Target drive is: $1"

# Delete the CoreStorage volume
/usr/sbin/diskutil coreStorage deleteVolume "$1"
echo "CoreStorage volume $1 deleted"

# Get the UUID of the CoreStorage Logical Volume Group
csLVGUUID=`/usr/sbin/diskutil coreStorage list | awk '/Logical Volume Group/{print $NF}'`
echo "Logical Volume Group has UUID: $csLVGUUID..."

# Create "Macintosh HD" volume in Logical Volume Group above 
/usr/sbin/diskutil corestorage createVolume "$csLVGUUID" jhfs+ "Macintosh HD" 33%
echo "Volume "Macintosh HD" created with "33%" of space available from $csLVGUUID..."
	
# Create "Users HD" volume in Logical Volume Group above
/usr/sbin/diskutil corestorage createVolume "$csLVGUUID" jhfs+ "Users HD" 100%
echo "Volume "Users HD" created with the remaining space available from $csLVGUUID..."

#!/bin/sh

# Get the UUID of the CoreStorage Logical Volume Group
csLVGUUID=`/usr/sbin/diskutil corestorage list | awk '/Logical Volume Group/{print $NF}'`
echo "We are going to delete the Logical Volume Group with UUID: $csLVGUUID..."
	
# Delete the CoreStorage Volume
/usr/sbin/diskutil corestorage delete "$csLVGUUID"
echo "Deleted the Logical Volume Group $csLVGUUID..."

/usr/sbin/diskutil corestorage revert $1

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.macmule.corestoragerevert</string>
	<key>Program</key>
		<string>/Applications/CoreStorage Revert.app/Contents/MacOS/applet</string>
	<key>RunAtLoad</key>
	<true/>
</dict>
</plist>

#!/bin/sh
## postinstall

pathToScript=$0
pathToPackage=$1
targetLocation=$2
targetVolume=$3

## Delete the AutoCasperNBI installed Casper Imaging launch agent
sudo rm -rf "$3"/Library/LaunchAgents/com.AutoCasperNBI.CasperImaging.plist

## If the launch agent exists after the above, error
if [ -f "$3"/Library/LaunchAgents/com.AutoCasperNBI.CasperImaging.plist ]; then

	echo "Error: com.AutoCasperNBI.CasperImaging.plist not deleted…"

	exit 1

else

	echo "Success: com.AutoCasperNBI.CasperImaging.plist deleted…"

fi

-- Get the name Volume Name of the Macs CoreStorage volume.
set csVolume to do shell script "diskutil cs list | awk '/Volume Name:/{out=$3; for(i=4;i<=NF;i++){out=out\" \"$i}; print out}'"

-- If the above command come back with a Volume Name.
if csVolume is not "" then
	
	-- Set this app to the front
	tell application "System Events" to set frontmost of process "CoreStorage Revert" to true
	
	-- Advise that volume needs to be reverted, offering option to skip if wanted
	display dialog "The volume " & csVolume & " is a CoreStorage volume & needs to be reverted to image this Mac." & return & return & "Do you wish to revert?" & return & return & "Once reverted Casper Imaging will launch." buttons {"Skip", "Revert"} with title "CoreStorage volumes detected" with icon 2 default button "Revert"
	
	-- If user chose to skip, then run the launchCasperImaging function
	if button returned of the result is "Skip" then
		my launchCasperImaging()
	else
		
		-- Revert the Core Storage volume
		do shell script "diskutil coreStorage revert /Volumes/" & quoted form of csVolume
		-- Run the launchCasperImaging function
		my launchCasperImaging()
		
	end if
	
else -- If the 1st command came back with no value, this means that no volumes have CoreStorage enabled	
	
	-- Run the launchCasperImaging function
	my launchCasperImaging()
	
end if

-- This function will launch Casper Imaging & quit this app.
on launchCasperImaging()
	tell application "Casper Imaging" to launch
	tell me to quit
end launchCasperImaging

Error: -69745: This operation can only be performed if there is exactly one Core Storage logical volume present in the group

Set-CASMailbox -Identity: "EmailAlias" -ActiveSyncAllowedDeviceIDs: "<DeviceID_1>"

Set-CASMailbox -Identity: "EmailAlias" -ActiveSyncBlockedDeviceIDs: "<DeviceID_1>"

chflags hidden /mach_kernel

/Library/LaunchDaemons/com.edb.launchd.portfoliodb.plist
/Library/LaunchDaemons/com.extensis.dam-server.web.admin.launchd.plist
/Library/LaunchDaemons/com.extensis.portfolio.server.media.delegate.plist
/Library/LaunchDaemons/com.extensis.portfolio.server.elasticsearch.plist

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Disabled</key>
	<false/>
	<key>Label</key>
	<string>Extensis Portfolio Server Media Delegate</string>
	<key>KeepAlive</key>
	<true/>
	<key>ProgramArguments</key>
	<array>
		<string>/Applications/Extensis/Portfolio Server/applications/tomcat/bin/media-delegate-launchd.sh</string>
	</array>
	<key>UserName</key>
	<string>administrator</string>
</dict>
</plist>

#
# Specify options to pass to the Java VM.
#
if [ "x$JAVA_OPTS" = "x" ]; then
   JAVA_OPTS="-Xms128m -Xmx4g -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true -Dorg.jboss.resolver.warning=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000"
   JAVA_OPTS="$JAVA_OPTS -Djboss.modules.system.pkgs=$JBOSS_MODULES_SYSTEM_PKGS -Djava.awt.headless=true"
   JAVA_OPTS="$JAVA_OPTS -Djboss.server.default.config=standalone.xml"
else
   echo "JAVA_OPTS already set in environment; overriding default settings with values: $JAVA_OPTS"
fi

# Increase the initial and maximum java heap size from the default
export CATALINA_OPTS="-Xms256m -Xmx1536m"

if [ "x$ES_MAX_MEM" = "x" ]; then
    ES_MAX_MEM=4g
fi

<key>DisabledSystemIdentifiers</key>
<array>
	<string>iMac10,1</string>
	<string>iMac11,1</string>
	<string>iMac11,2</string>
	<string>iMac11,3</string>
	<string>iMac12,1</string>
	<string>iMac12,2</string>
	<string>iMac13,1</string>
	<string>iMac13,2</string>
	<string>iMac13,3</string>
	<string>iMac14,1</string>
	<string>iMac14,2</string>
	<string>iMac14,3</string>
	<string>iMac14,4</string>
	<string>iMac15,1</string>
	<string>iMac7,1</string>
	<string>iMac8,1</string>
	<string>iMac9,1</string>
	<string>Mac-50619A408DB004DA</string>
	<string>Mac-F305150B0C7DEEEF</string>
	<string>MacBook5,1</string>
	<string>MacBook5,2</string>
	<string>MacBook6,1</string>
	<string>MacBook7,1</string>
	<string>MacBook8,1</string>
	<string>MacBookAir2,1</string>
	<string>MacBookAir3,1</string>
	<string>MacBookAir3,2</string>
	<string>MacBookAir4,1</string>
	<string>MacBookAir4,2</string>
	<string>MacBookAir5,1</string>
	<string>MacBookAir5,2</string>
	<string>MacBookAir6,1</string>
	<string>MacBookAir6,2</string>
	<string>MacBookAir7,1</string>
	<string>MacBookAir7,2</string>
	<string>MacBookPro10,1</string>
	<string>MacBookPro10,2</string>
	<string>MacBookPro11,1</string>
	<string>MacBookPro11,2</string>
	<string>MacBookPro11,3</string>
	<string>MacBookPro12,1</string>
	<string>MacBookPro3,1</string>
	<string>MacBookPro4,1</string>
	<string>MacBookPro5,1</string>
	<string>MacBookPro5,2</string>
	<string>MacBookPro5,3</string>
	<string>MacBookPro5,4</string>
	<string>MacBookPro5,5</string>
	<string>MacBookPro6,1</string>
	<string>MacBookPro6,2</string>
	<string>MacBookPro7,1</string>
	<string>MacBookPro8,1</string>
	<string>MacBookPro8,2</string>
	<string>MacBookPro8,3</string>
	<string>MacBookPro9,1</string>
	<string>MacBookPro9,2</string>
	<string>Macmini3,1</string>
	<string>Macmini4,1</string>
	<string>Macmini5,1</string>
	<string>Macmini5,2</string>
	<string>Macmini5,3</string>
	<string>Macmini6,1</string>
	<string>Macmini6,2</string>
	<string>Macmini7,1</string>
	<string>MacPro3,1</string>
	<string>MacPro4,1</string>
	<string>MacPro5,1</string>
	<string>MacPro6,1</string>
	<string>Xserve3,1</string>
</array>

<key>EnabledSystemIdentifiers</key>
<array>
	<string>MacBook11,1</string>
</array>

sudo softwareupdate --ignore JavaForOSX

sudo softwareupdate --reset-ignored

sudo launchctl load -w /System/Library/LaunchDaemons/org.postfix.master.plist

sudo launchctl load -w /System/Library/LaunchDaemons/org.net-snmp.snmpd.plist

yoyo-server:~ administrator$ sudo su
Password:
sh-3.2# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/var/root/.ssh/id_rsa): 
Created directory '/var/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /var/root/.ssh/id_rsa.
Your public key has been saved in /var/root/.ssh/id_rsa.pub.
The key fingerprint is:
73:77:c8:83:17:2c:9e:b1:6e:71:2d:bf:68:e7:8e:3b root@yoyo-server.local
The keys randomart image is:
+--[ RSA 2048]----+
|                 |
|           .     |
|          o o    |
|         . B +   |
|        S B O o  |
|         + = =   |
|          o   .  |
|         .  Eo.. |
|           .+*+  |
+-----------------+
sh-3.2# cat /private/var/root/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnJyINccu7biZsEws9zjvO+C0DxQUbFf5KpdtIvUyDwf+OiENtPwdcCRpn1q5VnQeXfcPuQD4oXTp2LXqdcYF/PHyHSs7i0Vs03TCBZvn7/FPU7wnP5KwXqaPze8rvswJ0tV7sfFHr588A9jfTpH3dA+cyDAnoJbYAqw2IrngoJYQ1pYQaD3quz73nQWMevQHE/BeBzsYShnWmgeuxAIiD3Bk+b+kt3Jildbmw0Zry8hONcl/k4FqFzJcX2BDtxFotpSvJiBCCT9Dg02SF+i8Umg/VfZW5+dVTckepQFPMo1esatYTzKK7XCacBT/WmPrmb/Pfk9wL2YUvWt+P/DAb root@yoyo-server.local

main-server:~ administrator$ sudo su
Password:
sh-3.2# sudo nano ~/.ssh/authorized_keys

#!/bin/sh

#wait for network from chicolte
. /etc/rc.common
CheckForNetwork
while [ "${NETWORKUP}" != "-YES-" ]; do
  sleep 5
  NETWORKUP=
  CheckForNetwork
done

echo "\n"

date +"%H:%M:%S %m-%d-%y"

emailAlert=$(/usr/bin/rsync -avrpogz --delete -e ssh 'root@server.mycompany.com:"/Some/Folder"' '/Some/Folder/')

if [ -z "$emailAlert" ]; then

        emailAlert="$(date +"%H:%M:%S %m-%d-%y") There was an error running the Rsync"

        echo $emailAlert | `mail -s  "ERROR: /Some/Folder RSync $(hostname -s) $(date +"%H:%M:%S %m-%d-%y")"  email@mycompany.com`

        echo "\n"

else
        echo $emailAlert

        echo "\n"
fi

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.launchdaemon.name</string>
	<key>ProgramArguments</key>
	<array>
		<string>/path/to/rsync/script</string>
	</array>
	<key>RunAtLoad</key>
	<true/>
	<key>StandardErrorPath</key>
	<string>/path/to/error.log</string>
	<key>StandardOutPath</key>
	<string>/path/to/success.log</string>
	<key>StartCalendarInterval</key>
	<dict>
		<key>Hour</key>
		<integer>22</integer>
		<key>Minute</key>
		<integer>0</integer>
		<key>Weekday</key>
		<integer>6</integer>
	</dict>
</dict>
</plist>

22:00:00 05-16-15
receiving file list ... done sent 20 bytes received 224914 bytes 40897.09 bytes/sec total size is 115490575028 speedup is 513442.05

22:00:00 04-25-15
receiving file list ... done deleting Packages/012 JavaForOSX 2014-001.pkg .DS_Store Packages/ Packages/010 Keynote 6.5.3 MAS.dmg Packages/010 Numbers 3.5.3 MAS.dmg Packages/010 Pages 5.5.3 MAS.dmg Packages/010 iMovie 10.0.7 MAS.dmg Packages/012 Adobe Acrobat Update 10.1.13.pkg Packages/012 FEX Plugin for Illustrator CS6 3.5.4.dmg Packages/012 FEX Plugin for InDesign CS6 3.5.2.dmg Packages/012 FEX Plugin for Photoshop CS6 3.5.4.dmg Packages/012 FEX Pro Client 4.2.3 .dmg Packages/012 Java 8 Update 45.pkg Packages/012 Java For OSX 2014-001.pkg sent 476 bytes received 3309371428 bytes 289546.52 bytes/sec total size is 115486529472 speedup is 34.90
