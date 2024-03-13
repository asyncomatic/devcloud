## devcloud


### prerequisites
The following are prerequisites for installing and running the **devcloud** project on your local machine:

- docker execution environment
<pre>
    $ docker -v
    Docker version 20.10.21, build baeda1f

</pre>

Installing and configuring Docker is relatively simple, but beyond the scope of this document; 
please refer to the official Docker documentation for [detailed instructions](https://docs.docker.com/get-docker/).

&nbsp;
### installation
Installing the **java-starter** project is fairly straightforward once all the prerequisites have been satisfied:
<pre>
    $ git clone git@github.com:asyncomatic/devcloud.git
    $ cd devcloud
    $ ./devcloud install

</pre>

During the installation process, you will be given the chance to modify the default configuration by setting custom 
values for certain environment variables:
<pre>
    $ ./devcloud install

    Please provide values for the specified environment variables, or hit &lt;Enter&gt; to accept the defaults:

    POSTGRES_USER [default: 'postgres']:
    POSTGRES_PASSWORD [default: 'password']:
    POSTGRES_DB [default: 'devcloud']:
    SCHEDULER_AUTH_TOKEN [default: none]:

</pre>

You may set custom values for any of these, or simply accept the defaults. **NOTE**: If you choose to set a value for the SCHEDULER_AUTH_TOKEN, all API calls to the scheduler will require an 
appropriate "Authorization" header
<pre>
    Authorization: Bearer &lt;SCHEDULER_AUTH_TOKEN&gt;

</pre>

see "[scheduling a sample test](https://github.com/asyncomatic/java-starter/blob/main/README.md#scheduling-a-sample-test)" 
for more details.

### running devcloud
To start **devcloud** and confirm it is running:
<pre>
    $ ./devcloud start
    [+] Running 1/1
     ⠿ Container devcloud_zookeeper  Started
    [+] Running 2/2
     ⠿ Container devcloud_zookeeper  Running
     ⠿ Container devcloud_kafka      Started
    [+] Running 1/1
     ⠿ Container devcloud_postgres  Started
    [+] Running 1/1
     ⠿ Container devcloud_scheduler  Started

</pre>
<pre>
    $ ./devcloud status
    NAMES                STATUS         PORTS
    devcloud_scheduler   Up 2 minutes   0.0.0.0:8080->8080/tcp
    devcloud_postgres    Up 2 minutes   0.0.0.0:5432->5432/tcp
    devcloud_kafka       Up 2 minutes   9092/tcp, 0.0.0.0:9094->9094/tcp
    devcloud_zookeeper   Up 3 minutes   2888/tcp, 0.0.0.0:2181->2181/tcp, 3888/tcp

</pre>

To tail the **devcloud** logs:
<pre>
    $ ./devcloud logs

</pre>

at which point you should see log messages similar to those shown below
<pre>
    .... (log messages stream by) ....
    devcloud_postgres   | The files belonging to this database system will be owned by user "postgres".
    devcloud_postgres   | This user must also own the server process.
    devcloud_postgres   | 
    devcloud_postgres   | The database cluster will be initialized with locale "en_US.utf8".
    devcloud_postgres   | The default database encoding has accordingly been set to "UTF8".
    devcloud_postgres   | The default text search configuration will be set to "english".
    devcloud_kafka      | ===> User
    devcloud_kafka      | uid=1000(appuser) gid=1000(appuser) groups=1000(appuser)
    devcloud_kafka      | ===> Configuring ...
    devcloud_kafka      | Running in Zookeeper mode...
    devcloud_kafka      | ===> Running preflight checks ... 
    devcloud_kafka      | ===> Check if /var/lib/kafka/data is writable ...
    devcloud_kafka      | ===> Check if Zookeeper is healthy ...
    devcloud_kafka      | SLF4J: Class path contains multiple SLF4J bindings.
    devcloud_zookeeper  | ===> User
    devcloud_zookeeper  | uid=1000(appuser) gid=1000(appuser) groups=1000(appuser)
    devcloud_zookeeper  | ===> Configuring ...
    devcloud_zookeeper  | ===> Running preflight checks ... 
    devcloud_zookeeper  | ===> Check if /var/lib/zookeeper/data is writable ...
    devcloud_zookeeper  | ===> Check if /var/lib/zookeeper/log is writable ...
    devcloud_zookeeper  | ===> Launching ... 
    devcloud_zookeeper  | ===> Launching zookeeper ... 
    .... (more log messages stream by) ....

</pre>

Finally, to stop **devcloud**:
<pre>
    $ ./devcloud stop

</pre>

&nbsp;

### next steps
Congratulations, you have successfully installed and configured **devcloud**! It's now time to:

- clone and setup the [java-starter](https://github.com/asyncomatic/java-starter/) project on your local machine
  ([instructions](https://github.com/asyncomatic/java-starter/blob/main/README.md));
- run one of the [sample tests](https://github.com/asyncomatic/java-starter/tree/main/src/main/java/io/github/asyncomatic/starter/examples/tests) 
(via curl or Postman) to verify everything is setup correctly; and
- start adding your own tests

Happy testing!


