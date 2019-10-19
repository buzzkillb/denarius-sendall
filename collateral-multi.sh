#!/bin/bash
#denarius.daemon command is using snap daemon, change to denariusd for typical daemon
#denarius.conf
#enableaccounts=1
#staking=0

# put D address in a variable, for clarity
# and in case we should use it for something else
# d_address to where to send to
# d_account is the account label to send from
d_address=<D ADDRESS TO SEND TO>
d_account=FORTUNASTAKE
d_fee=0.00001

#run through FORTUNASTAKE1 through FORTUNASTAKE5
for ((i=1; i<5; i++))
do
# store current balance
# and check that denarius.daemon is running in the same time
if balance=$(denarius.daemon getbalance $d_account$i)
then
    # always use '[[' instead of '['
    # make sure it works with any number of decimals
    # use quotes
    send=$(echo "$balance - $d_fee" | bc)
    if [[ "$balance" =~ ^0.0*$ ]]
    then echo "no coins generated"
    else denarius.daemon sendtoaddress $d_address $send
    fi
else
    error=$?
    echo "something went wrong.  Is denarius.daemon running ?"
    return $error
fi
done
