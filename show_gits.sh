#!/bin/bash

## For viewing git status output for each of the subdirectories of a
## directory

SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add 
}

# test for identities
function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2 ];then
            start_agent
        fi
    fi 
}

# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
	test_identities
    fi
# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
    if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
        test_identities
    else
        start_agent
    fi
fi

input=$1
if [ -n "$input" ]
then
    arg=$1
else
    arg=-s
fi

if [ "$arg" = '-s' ]
then
    for i in ./*
    do 
	if [ -d "$i" ]; 
	then
	    cd $i
	    if [ -d "./.git" ]
	    then
		echo "Directory = $i"
		echo `git status`
		echo
	    fi
	    cd ..
	fi
    done

elif [ "$arg" = '-f' ]
then 
    for i in ./*
    do 
	if [ -d "$i" ]; 
	then
	    cd $i
	    if [ -d "./.git" ]
	    then
		echo "Directory = $i"
		echo `git fetch`
		echo
	    fi
	    cd ..
	fi
    done
    
else
    echo "Not a valid input argument"
    echo "-s ~ git show (default)"
    echo "-f ~ git fetch"
fi