This collection of linux programs is my exploration of linux programs such as journalctl, systemd, ssh, and general bash programing. 


As follows, the backup script uses the rsync utility that can be used to backup data to a remote server through ssh. This script features:
- linked deletetion (i.e. backuped files on destination are deleted if they are deleted from source directory)
- writes all file changes to a backup log
- backup log keeps a record of
    a. date backup was made
    b. name of file that was backed up
    c. remote server ip the backup was made on
    




Getting started: <br>
Type the following commands in your terminal. <br>
In  any directory, do:<br>
<ol>
  <li> git clone https://github.com/ericchanko/acit2420_wk11.git </li>
  <li> cd acit2420_wk11 </li>
  <li> mv wthr.service /etc/systemd/system </li>
  <li> mv wthr.timer /etc/systemd/system </li>
</ol>

Configuring files: <br>
In <b>wthr.service</b> change the following:
<ul>
  <li>ExecStart=/path/to/directory/wthr </li>
  <li>WorkingDirectory=/path/to/directory </li>
</ul>
To change frequency of getting weather updates, change the following in <b>wthr.timer</b>:
<ul>
  <li>onClaender=frequency </li>
</ul>
reload the system using: <br>
sudo systemctl daemon-reload <br>

start the service using: <br>
sudo systemctl start wthr.service <br>

enable the service (to persist after shutdown) using: <br>
sudo systemctl enable wthr.service <br>



Now in your working directory, you will get an update contained in weather.txt depending on the frequency you designated in wthr.timer.
To force a weather updated, type <b>./wthr</b> in your working directory
