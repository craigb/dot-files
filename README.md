dot-files
=========

Installation requires a few prereqs:

Set-ExecutionPolicy Unrestricted
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y git
choco install -y vim


Then setup.cmd can be run from the command prompt.
