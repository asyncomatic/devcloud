## devcloud


### prerequisites
The following are prerequisites for installing and running **devcloud** on a local machine:

- docker execution environment, including:
  - docker - ```$ which docker```
  - docker-compose - ```$ which docker-compose```

&nbsp;
### installation
Installation of **devcloud** is fairly straightforward once the prerequisites have been satisfied.

&nbsp;
#### 1. clone repo
Begin by cloning this repo to your local machine:
<pre>
    $ git clone git@git.soma.salesforce.com:asyncomatic/devcloud.git
    $ cd devcloud
</pre>
&nbsp;

#### 2. starting devcloud
To start the **devcloud** services, execute ```make start``` in the repo's root directory. This step may take several 
minute the first time it is executed as various Docker images need to be pulled to your local machine.

If the services started successfully, you should see the following Docker containers:
<pre>
    $ make start
    
    .... (Docker images downloaded and started) ....
    
    $ make status
    NAMES                STATUS          PORTS
    devcloud_scheduler   Up 36 seconds   0.0.0.0:8080->8080/tcp
    devcloud_postgres    Up 37 seconds   0.0.0.0:5432->5432/tcp
    devcloud_kafka       Up 38 seconds   9092/tcp, 0.0.0.0:9094->9094/tcp
    devcloud_zookeeper   Up 49 seconds   2888/tcp, 0.0.0.0:2181->2181/tcp, 3888/tcp
        
</pre>
&nbsp;

### next steps
Congratulations, you have successfully installed and configured **devcloud**! It's now time to:

- clone and setup [examples](https://github.com/asyncomatic/examples/) on your local machine
- run one of the sample tests (via curl or Postman) to check your installation
- start adding your own tests

Happy testing!


