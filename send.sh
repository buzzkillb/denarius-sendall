#!/bin/bash

# put D address in a variable, for clarity
# and in case we should use it for something else
d_address=<INPUTDENARIUSSENDTOADDRESSHERE>
d_fee=0.00001
# store current balance
# and check that denariusd is running in the same time
if balance=$(denariusd getbalance)
then
    # always use '[[' instead of '['
    # make sure it works with any number of decimals
    # use quotes
    send=$(echo "$balance - $d_fee" | bc)
    if [[ "$balance" =~ ^0.0*$ ]]
    then echo "no coins generated"
    else denariusd sendtoaddress $d_address $send
    fi
else
    error=$?
    echo "something went wrong.  Is denariusd running ?"
    return $error
fi
