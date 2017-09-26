#!/bin/bash

# --------------------------------------------------------------------------------------------------

function PRINT_USAGE {

    printf "\n\n"
    printf "Usage : $0 -u username -s <ftpSite> [ -c dir-name ] [ -v ] [ -h ] \n"
    printf "\n"
    printf "   -u <username>     FTP Username so we can upload to website (actually uses rsync now)\n"
    printf "   -s <ftpSite>      FTP site (e.g. ftp.burkins.com)\n"
    printf "   -h                Print this help screen and exit\n"
    printf "   -v                Turn on verbose\n"
    printf "\n\n"

}


# --------------------------------------------------------------------------------------------------
# -------------------------   MAIN   ---------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# Each letter represents an option, 
# if a colon follows the letter then there's an additional argument required (e.g. -u username)
# NOTE: getopts does not distinguish between mandatory and optional flags, must check yourself later
while getopts u:c:s:vhjrm  opt; do
    case $opt in
        v)
	    # -v   will enable VERBOSE flag
            VERBOSE=1
            ;;
        h)
	    # -h will print the usage (help) message
            PRINT_USAGE
            exit 1
            ;;
        u)
	    # -u username   (mandatory because it's enforced below)
            userName=$OPTARG
            ;;
        s)
	    # -s sitename    (mandatory because it's enforced below)
            siteName=$OPTARG
            ;;
        c)
	    # -u dirName     (optional, not enforced below)
            dirName=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument"
            exit 1
            ;;
    esac
done

# Consume ALL the command-line arguments (that were analyzed above by getopts                                                       
shift $((OPTIND - 1))

# Check to see if mandatory command-line arguments were provided
if [[ -z ${siteName+x} || -z ${userName+x} ]]; then
   printf "\nERROR: mandatory command-line parameters are missing"
   PRINT_USAGE
   exit
fi

# Print command-line arguments                                                                                                      
printf "\nCommand-Line Parameters\n-------------------------\n"
printf "userName          = %s\n" "$userName"
printf "siteName          = %s\n" "$siteName"
printf "dirName          = %s\n" "$dirName"
printf "\n"

# Example of gathering a password in a semi-secure fashion
printf "Enter Password: "
read -s ftpPassword
printf "Password that you entered: $ftpPassword"
printf "\n\n"

# --------------------------------------------------------------------------------------
# ------------------------------- End --------------------------------------------------
# --------------------------------------------------------------------------------------
