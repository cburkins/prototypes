# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias gotoIrisDashboard='cd /var/www/html'
alias rm='rm -i'
alias gpom='git pull origin master'


#echo
#cat /etc/redhat-release
#echo
#echo

# Setup your command prompt to include git branch (when in git repository directory)
source ~/.git-prompt.sh
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PS1='[\u@IrisDashboard(Prod) \W$(__git_ps1 " (%s)")]\$ '

# Save prompt history (into .bash_history) with every command
export PROMPT_COMMAND='history -a'


