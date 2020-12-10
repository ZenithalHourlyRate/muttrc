#!/usr/bin/env bash
# popup a small notification with 'notify-send'
dis=`formail -X From: -X Subject:`
from=`echo "$dis" | formail -X From:`
sub=`echo "$dis" | formail -X Subject:`

# tweaks < > are special
from=${from//</\(}
from=${from//>/\)}
from=${from//&/\.}
sub=${sub//</\(}
sub=${sub//>/\)}
sub=${sub//&/\.}

sub=${sub:0:75}
from=${from:0:75}
#TM=20000

# notice: change to correct dbus session address!
DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus' \
/usr/bin/notify-send -u normal -t 0 "$1: $sub" "$from"
