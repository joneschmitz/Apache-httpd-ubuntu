# Apache-httpd-ubuntu
Installation scripts for apache2 using httpd for ubuntu 20.04 as hosted on AWS Free Tier Ubuntu.

- Apache2Httpd_Install_Remote.sh - installs apache with httpd from remote resources hosted online
  - there is no garantuee for it to work in the future as remote files could be deleted
<br />

- Apache3Httpd_Install_Local.sh - installs apache with httpd from compressed folders in this repo

<hr>

- The script creates a service for *apache* and runs it
- httpd.conf is stored in the */usr/local/apache2/conf/* folder
- Web Pages stored in /usr/local/apache2/htdocs/
- Only accessible through port 80 (http) connections
  - must have port 80 open in your microservice's security settings
