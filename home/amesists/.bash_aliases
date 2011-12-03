alias ssh4gfw='ssh -N -D 7070 tm-0000770@temp1.ssh4gfw.com'
alias ll='ls -l'
alias sshtestbed='ssh -p 43019 5090379085@202.120.40.98'

function send_to_testbed()
{
  scp -P 43019 $1 5090379085@202.120.40.98:$2
}

function receive_from_testbed()
{
  scp -P 43019 5090379085@202.120.40.98:$1 $2
}
