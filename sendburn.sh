#!/bin/bash
#burn D on nearly every block
#denariusd
#sleep 30
rand1=.00000"$RANDOM"
echo "get Burn address"
d_burn=DNRXXXXXXXXXXXXXXXXXXXXXXXXXZeeDTw
echo "getbalance"
denariusd getbalance
#sleep 1
echo "Send D $rand1 to $d_burn"
denariusd sendtoaddress $d_burn $rand1
#sleep 2
echo "repairwallet"
denariusd repairwallet
#sleep 2
