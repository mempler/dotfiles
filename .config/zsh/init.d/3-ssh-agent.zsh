function check_ssh_agent() {
  if [ -f $HOME/.ssh-agent ]; then
    source $HOME/.ssh-agent > /dev/null
  else
    # no agent file
    return 1
  fi

  if [[ ${OSTYPE//[0-9.]/} == 'darwin' ]]; then
    ps -p $SSH_AGENT_PID > /dev/null
    # gotcha: does not verify the PID is actually an ssh-agent
    # just that the PID is running
    return $?
  fi

  if [ -d /proc/$SSH_AGENT_PID/ ]; then
    # verify PID dir is actually an agent
    grep ssh-agent /proc/$SSH_AGENT_PID/cmdline  > /dev/null  2> /dev/null;
    if [ $? -eq 0 ]; then
      # yep - that is an agent
      return 0
    else
      # nope - that is something else reusing the PID
      return 1
    fi
  else
    # agent PID dir does not exist - dead agent
    return 1
  fi
}

function launch_ssh_agent() {
  ssh-agent > $HOME/.ssh-agent
  source $HOME/.ssh-agent
  # load up all the pub keys
  for I in $HOME/.ssh/*.pub ; do
    echo adding ${I/.pub/}
    ssh-add ${I/.pub/}
  done
}

check_ssh_agent
if [ $? -eq 1 ];then
  launch_ssh_agent
fi
