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

Now in your working directory, you will get an update contained in weather.txt depending on the frequency you designated in wthr.timer.
To force a weather updated, type <b>./wthr</b> in your working directory
