# megahelp

Helper scripts for managing RAIDs on MegaRAID controller cards.

## Dependencies

* Bash
* StorCLI / PERCCLI (depending on your card)
* A Mail tranfer agent (MTA) if you want email

For more information on managing RAIDs using StorCLI, see
https://github.com/MSU-Libraries/storcli-docs

## Scripts

Common flags between all scripts:

* `-c`/`--controller ID` Pass the controller id to use. Default: `0`
* `-s`/`--search DIR` Add a search path where to find the StorCLI or PERCCLI binary.
* `-b`/`--binary PATH` Specify the full path to the StorCLI or PERCCLI binary.

By deafult, the scripts will automatically search for the binary in the following directorires:

* `/opt/MegaRAID/storcli/`
* `/opt/MegaRAID/perccli/`
* `/usr/local/sbin/`
* `/usr/local/bin/`

### megahelp-silence
Silence an ongoing alarm from the controller. A silenced alarm can reactivate if the controller's
state changes; this _does not disable_ the alarm from recurring.  

The `megahelp-silence` command does not accept any additional flags beyond the common ones.  

### megahelp-report
Generate a report of health for the controller, disks, RAIDs,
and virtual disks. Including an option to email this report
only if a problem is identified.

Flags specific to `megahelp-report`:

* `-g`/`--ghs"` Report as a problem if there is no Global Hot Spare available.
* `-e`/`--email` If a problem is detected, send an email with report contents.
* `-a`/`--address EMAIL` The address where emailed reports are sent. Default: `root@localhost`
* `-p`/`--only-on-problem` Only display report if a problem is detected.

This command can be used to get automated email when a controller detects a problem by
use of cron.
```
# Hardware RAID problem notification
30 4,16 * * *   root    /usr/sbin/megahelp-report -e -a admin@example.edu
```

## Author and Copyright
Written by Nathan Collins (npcollins/gmail/com)  

Copyright © 2017 Michigan State University Board of Trustees  

## License
Released under the MIT License
