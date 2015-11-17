#!/bin/bash
#just run all this stuff from your local terminal with $ get_output <usernamelxhalle>
ssh $1@lxhalle.in.tum.de
#On lxhalle run:
#scp -r h039y39@supermuc.lrz.de:~/PoS/output/* ~/OUT
#exit
#On local machine run:
scp -r $1@lxhalle.in.tum.de:~/OUT/* output
