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

sudo languagesetup –langspec

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences AppleLanguages "(en, ja, fr, de, es, it, nl, sv, nb, da, fi, pt, zh-Hans, zh-Hant, ko)"

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences AppleLocale "en_GB"

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences Country "en_GB"

/usr/bin/defaults write -g AppleLanguages "(en, ja, fr, de, es, it, nl, sv, nb, da, fi, pt, zh-Hans, zh-Hant, ko)"
