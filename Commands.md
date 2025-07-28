# Command Cheat Sheet

This page is my long-term memory of command line tools.

Easy access with an alias:

```shell
alias cmd="curl -s 'https://raw.githubusercontent.com/grantcarthew/notes/main/Commands.md'"
```

Easy script:

```shell
#!/usr/bin/env bash

usage() {
    cat <<-EOF
Usage: cmd [filter]

Queries my command notes from GitHub

Optional arguments:
  filter                 String filter for the page
  -h, --help             Show this help message and exit
EOF
}

if [[ "${1}" == '-h' || "${1}" == '--help' || $# -gt 1 ]]; then
    usage
    exit 1
fi

url='https://raw.githubusercontent.com/grantcarthew/notes/main/Commands.md'
if [[ -n "${1}" ]]; then
  curl -s "${url}" | rg -i "${1}"
else
  curl -s "${url}"
fi
```

Other Resources:

- [tldr.sh](https://tldr.sh/)
- [cheat.sh](http://cheat.sh/)
  - To use cheat.sh: `curl cheat.sh/<command>` Eg. `curl cheat.sh/rg`
- [Bash-Oneliner](https://github.com/onceupon/Bash-Oneliner)


## Linux

```shell
tar -xzf /path/to/yourfile.tar.gz -C /path/to/target/directory  # Extract a tar archive into a directory
tar -czf archive.tar.gz /path/to/directory  # Create a gzip-compressed tar archive
tar -tf archive.tar  # List contents of a tar archive
tar -cWf archive.tar /path/to/directory  # Verify an archive

df -h  # Show free disk space
du -shc /var/*  # Show directory disk usage
du -h --max-depth=1 /var  # Show directory disk usage going one folder deep
du -h /var/ | sort -rh | head -5  # Show to five directory disk usage
resize2fs /dev/<device><partition> #[Linux] Resize the file system to an expanded partition
lsblk  # List block devices or disk devices and partitions

find -name "<search string>*" -exec mv -t ./<target dir>/ {} + # Move all the found files to the target dir

watch <command> # Runs the command at a 2 second interval displaying result

ssh-keygen -t ed25519 -C "<comment>"  # Generate a new SSH key pair
ssh-add  # Adds your SSH key to the SSH Agent (ssh-agent)

sed -i 's/old-text/new-text/g' input.txt  # Replace string in a text file globally case-sensitive
sed -i 's/old-text/new-text/gI' input.txt  # Replace string in a text file globally case-insensitive
sed -i 's/old-text/new-text/' input.txt  # Replace first instance of string in a text file
sed 's+http://+https://www.example.com+g' input.txt  # Replace string in a text file globally case-sensitive different delimiter
sed -i -e '/FOO/s/love/sick/' input.txt  # Replace string in a text file once only if the line includes the word FOO
sed -i 's/\r$//g' input.txt # Replaces CR leaving just the LF at the end of the lines

sudo apt update  # Downloads the latest package lists
sudo apt-get upgrade # Upgrade installed packages
sudo apt upgrade # Upgrade and install packages
sudo apt full-upgrade # Upgrades, installs, and removes packages

sudo dpkg -i $(curl -w "%{filename_effective}" -LO $(curl -s https://api.github.com/repos/bvaisvil/zenith/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '64[.]deb$')) # Installs the latest package directly from a GitHub repo

sudo dhclient -r -v <interface name> && sudo rm /var/lib/dhcp/dhclient.* ; sudo dhclient -v <interface name>  # Release DHCP IP Address and renew

rsync -av --progress /path/to/source /path/to/destination  # Synchronize files/directories from a source to a destination
rsync -avn /path/to/source /path/to/destination  # Perform a trial run with no changes made
rsync -av --delete /path/to/source /path/to/destination  # Delete extraneous files from the destination directory
rsync -av --exclude 'file_to_exclude' /path/to/source /path/to/destination  # Exclude files from being copied
rsync -av --include 'file_to_include' --exclude '*' /path/to/source /path/to/destination  # Include files that were previously excluded
rsync -avu /path/to/source /path/to/destination  # Skip files that are newer on the receiver
rsync -avz /path/to/source /path/to/destination  # Compress file data during the transfer
rsync -avz -e ssh user@remote_host:/path/to/source /path/to/destination  # Use SSH for the transfer
rsync -avp /path/to/source /path/to/destination  # Preserve permissions
rsync -avo /path/to/source /path/to/destination  # Preserve owner
rsync -avg /path/to/source /path/to/destination  # Preserve group
rsync -avc /path/to/source /path/to/destination  # Skip based on checksum, not mod-time & size

jhead -n%Y-%m-%d-%H%M%S *.jpg  # Rename all jpg image files to ISO datetime format

rg -Io 'string\.to\.match\.before([^"]+)\.and\.after' -r '$1' | sort -u  # Ripgrep replace, ouput just the content of the regex group

date +%Y-%m-%d  # Date in ISO format of yyyy-mm-dd
```

## Git

Notes:

* GitHub now uses `main` as the `master` branch name

```shell
git init # Creates a new git repository in the current directory
git status # Show the repository status
git diff # Show the file differences in the working tree
git diff --staged # Show the file differences in staged files

git clone <remote-repository-address> # Clones the remote repository
git fetch # Download objects and refs
git fetch --all # Fetch all remotes
git pull <remote> <branch-name> # Update local with changes from remote
git pull # Update local with changes from origin (works after 'git pull origin master' once)
git pull --all # Updates local with all branches and changes from origin

git branch # List local branches
git branch -a # List all branches
git checkout -b <branch-name> # Create a new branch and switch to it
git branch <branch-name> # Create a new branch without switching to it
git checkout <branch-name> # Switch to a new branch
git checkout origin/<branch-name> # Switch to an upstream branch
git branch -m <new-branch-name> # Rename the current branch
git branch -m <old-branch-name> <new-branch-name> # Rename a branch
git merge <branch-name> # Merges the changes in <branch-name> into the current branch
git branch -d <branch-name> # Deletes a pushed or merged branch
git branch -D <branch-name> # Force delete a branch
git push <origin-or-remote-name> --delete <branch-name> # Delete a remote branch

git add . # Stage all changed files for commiting
git add <file-path> # Stage the file for commiting
git add <file-path>\* # Stage all the files in the directory for commiting
git reset # Undo the git add command for all files, no changes lost
git reset <file-path> # Undo the git add command for a single file, no changes lost
git commit -m "<message>" # Commit the staged files into the local repository
git commit --amend # Change the last commit message for local only
git reset --soft HEAD~1 # Undo the last commit locally preserving changes
git reset --hard HEAD~1 # Delete the last commit losing all modifications
git reset --hard HEAD # Delete all changes in the working tree
git reset --hard <commit-hash> # Deletes everything back to the previous commit
git push origin <branch-name> # Push the local repository changes up to the origin
git push -f origin <branch-name> # Force push the local repository changes up to the origin

git log # Show the commit logs
git log --oneline # Shows the commit logs with key and message only
git log <file-path> # Shows the commit logs for a single file

git checkout <file-path> # Resets a changed file back to the last commit state
git checkout <commit-hash> -- <file-path> # Resets a file back to a commit state
git checkout <commit-hash> # Switch the working tree to a previous commit
git checkout -b <branch-name> <commit-hash> # Create a new branch from an previous commit
git revert <commit-hash> # Adds a new commit at the HEAD set to a previous commit
git rm <file-name> # Remove a file from the working tree and from git
git rm --cached <file-name> # Remove a file from git without remove the local file

git tag # List all tags
git tag <tag-name> # Creates a lightweight tag to the current commit
git tag -a <tag-name> # Creates an annotated tag to the current commit
git push origin <tag-name> # Pushes a local tag to the origin
git push origin --tags # Pushes all local tags to the origin

git remote -v # List all remotes
git remote add <remote-alias> <remote-address> # Add a new remote
git remote rm <remote-alias> # Remove a remote

git update-index --assume-unchanged .vscode/* # Ignore local changes to tracked files
```

## SQL

```shell
sqlcmd -i <sql file> -U <user> -S <server address> -P <password> # Execute an SQL script
```

## Windows

```shell
wsl --list -v  # Show Windows Subsystem for Linux virtual machines
wsl --set-version <name> 2  # Set wsl distro to use WSLv2
WSLENV=GOPATH/l:USERPROFILE/w:SOMEVAR/wp # Share environment variables between Windows and WSL
```

## Cloud

```shell
terraform force-unlock -force <lock id> # Removes a lock from the state
rg -l '.' | entr -c bash -c 'echo "-- $(date +%T) --" && terraform fmt -recursive && terraform validate' # Watch files and validate
```

## Container

```shell
docker login # Login to the public Docker container registry
docker login <repository address> # Login to a container registry
docker exec -it <container name> /bin/sh  # Start a terminal into a running container (try /bin/bash)
docker exec -it <container name> <command>  # Execute a command in a running container
docker exec -it -e VAR=1 <container name> /bin/sh # Start a terminal with environment variables set
docker stats # Show running container statistics
docker logs <container id> # Display the standard out / error from within the container
docker logs <container id> -f # Follow the standard out / error

docker-compose up # Launch the services defined in the docker-compose.yml file
docker-compose up -d # Launch the services as a daemon
docker-compose ps # Show the running containers
docker-compose stop # Stop the services defined in the docker-compose.yml file

kubectl logs <pod name> # Display the logs from a pod
kubectl logs <pod name> -f # Follow the logs from a K8s pod
kubectl logs --previous <pod name> <container name> # Display the logs from the previous running container
kubectl delete pod <pod name> # Restart a pod if deployment unchanged
kubectl exec -it <pod name> -- sh # Start an interactive shell into a running single container pod
kubectl exec <pod name> -- sh -c 'echo $<env variable name>' # Display a pod environment variable
kubectl get deployment --output yaml # Print the current deployment to the terminal
kubectl debug node/<node-name> -it --image=ubuntu # Root access to cluster node
kubectl rollout restart deployment/<deployment-name> # Restart all pods in a deployment
kubectl rollout restart deployment -n <namespace> # Restart all deployments in a namespace

helm install <release name> <chart name> # Installs a new package into the K8s cluster
helm install <release name> <chart directory> # Installs a new package from an unpacked chart
helm install <chart name> --generate-name # Installs a new package generating a release name
helm install -f <values yml> <release name> <chart name> # Installs a new package with custom configuration
helm install --set key=value,key2=value2,outer.inner=value,list={a,b,c},list[0].key=value <release name> <chart name> # Installs a new package with custom configuration
helm status <release name> # Display a deployed charts information
helm show values <chart name> # Displays configurable options
helm get values <chart name> # Displays the user supplied values
helm upgrade -f <values yml> <release name> <chart name> # Upgrade the chart or configuration
```

## VIM

```vim
h " Move cursor left
j " Move cursor down
k " Move cursor up
l " Move cursor right
gg " Go to the top
G " Go to the bottom
w " Move forward a word
b " Move back a word
% " Move between brackets

v " Select
V " Select line
y " Copy selected
p " paste selected

q<letter> " Starts recording a macro
q " Finishes recording a macro
@<letter> " Executes a macro

x " Delete a character
dd " Delete line
:g/string/d " Delete all lines that contain string

o " New line below
O " New line above

:g/string/d " Deletes every line that contains <string>
```
