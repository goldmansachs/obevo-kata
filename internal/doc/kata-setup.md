<!--

    Copyright 2017 Goldman Sachs.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

-->

# Kata Setup


### 1) Setup Java (Java 7 minimum)

Link to [JDK downloads](http://www.oracle.com/technetwork/java/javase/overview/java8-2100321.html)


### 2) Download Obevo
Download the binary from either:
* [Obevo Release page](https://github.com/goldmansachs/obevo/releases/latest)
* Or [this direct link](https://github.com/goldmansachs/obevo/releases/download/7.0.2/obevo-cli-7.0.2-dist.zip)


### 3) Checkout the kata code
From the [Kata Github project](https://github.com/goldmansachs/obevo-kata)

```
git clone https://github.com/goldmansachs/obevo-kata.git
```


### 4) Setup the environment variables for the kata
(Not technically required for Obevo's normal execution, but highly recommended in these kata
exercises for convenience)

* OBEVO_HOME for the location of the binary that you unzipped
* KATA_HOME for the location of the kata project that you checked out
* KATA_PLATFORM for the DB type you will work with (either postgresql or hsql) 

<table>
<tr><td>Windows</td><td><pre>SET OBEVO_HOME=H:\obevo
SET KATA_HOME=H:\obevo-checkout\database-kata
SET KATA_PLATFORM=postgresql</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>export OBEVO_HOME=/home/myuser/obevo
export KATA_HOME=/home/myuser/obevo-checkout/database-kata
export KATA_PLATFORM=postgresql</pre></td></tr>
</table>

The scripts will be run at %OBEVO_HOME%\bin (Windows) a.k.a. $OBEVO_HOME/bin (Linux/Bash)


#### Whether to use PostgreSQL or HSQL for the kata

The kata is designed to work with both platforms. However, while the HSQLDB scripts are tested against each of
Mac/Linux/Windows, the PostgreSQL is only tested against Mac/Linux.

It was originally written for HSQL only as it did not require any external dependencies (i.e.
all software is available in the kata codebase and runnable from your machine).

But with the ease of accessing software via Docker containers, it became possible to run this
with a traditional RDBMS. We went with PostgreSQL due to its popularity and ease of setting up
the containers.

If you do go with PostgreSQL, then you will need to:

1. Install [Docker](https://www.docker.com)
2. Optionally, run the following "docker pull" commands to download the relevant containers upfront

   * This step is only to save time from doing the large download in the kata steps later. The kata
   scripts would automatically pull the right software anyway if it wasn't available. 
        ```
        docker pull postgres
        docker pull dpage/pgadmin4
        ```

### 5) Run the initial setup command for your files
This step would simulate you creating a database w/ tables, views, data, etc.

<table>
<tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\lesson1\kata-step1.bat</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/lesson1/kata-step1.sh</pre></td></tr>
</table>

Your setup should look like this:

![](db-kata-file-setup.jpg)


### 6) (Optional) Setup Maven to try out the JUnit test and Maven plugin
(If you are already familiar with Maven setup, you can ignore this section)

In this kata, we also demonstrate how to use Obevo in a unit test and to run a test deployment as part of your build.

For that, you will need Maven, which you can download from [here](https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.zip)


### 7) Understand the files in your project
Files you should ignore:
* /internal/:  files for the Obevo developers to test out the kata in the continuous build
* LICENSE.txt, NOTICE.txt: files required for Apache licensed projects
* kata.md, README.md: documentation files for this kata
* .travis.yml: meant only for the Kata's own continuous build that the Obevo team maintains

Files you will use for the kata:
* kata-files/setup/: We will setup a local HSQLDB instance for this kata. The binaries and scripts for that are in this folder
* src/main/database/: Your DB systems will be defined in here for the kata (first lesson being in lesson/deploy). The kata checkout starts with only system-config.xml. You will add more files from...
* kata-files/lesson*/: These folders contain scripts needed during your kata lessons.
* src/test/java: We show an example here of how to use Obevo in your unit tests.
* pom.xml: standard pom for your project

You can use the kata files as templates for your own project; though for the pom.xml, you should ignore the &lt;profiles&gt;
section, as that is meant only for the Kata's own continuous build that the Obevo team maintains.


### 8) Setup your test database

To demo the tool, we need a database against which to run our scripts.

While you are free to try this against your own database, we provide options to set this up locally on your
host without any external dependencies.

As described above, your choices are either HSQLDB or PostgreSQL. The commands below are the same regardless
of your DB; just make sure that your environments are setup correctly.

This table summarizes how the two are used. Steps to setup will follow:

|                        | PostgreSQL                                     | HSQLDB                                       |
|:-----------------------|:-----------------------------------------------|:---------------------------------------------|
| Windows Variable Setup | SET KATA_PLATFORM=postgresql                   | SET KATA_PLATFORM=hsql                       |
| Bash Variable Setup    | export KATA_PLATFORM=postgresql                | export KATA_PLATFORM=hsql                    |
| JDBC URL for Kata      | jdbc\:hsqldb\:hsql\://localhost:9092/obevokata | jdbc\:postgresql\://localhost\:5432/postgres |
| Binary                 | Pulled from Docker                             | Jars provided in this Github repo            |
| Login / Passowrd       | katadeployer/katadeploypass                    | katadeployer/katadeploypass                  |



##### Step 1: Start the database server

<table>
<tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\setup\%KATA_PLATFORM%\startDb.bat</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/setup/$KATA_PLATFORM/startDb.sh</pre></td></tr>
</table>


##### Step 2: Setup the environment (e.g. schemas, users).
By the end of this step, the katadeployer DB user will be available for you to connect with.
(Our PostgreSQL setup does it in step 1; the HSQLDB setup does it in step 2)

<table>
<tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\setup\%KATA_PLATFORM%\initDb.bat</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/setup/$KATA_PLATFORM/initDb.sh</pre></td></tr>
</table>


##### Stopping the DB:

(In case you stop/start)

<table>
<tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\setup\%KATA_PLATFORM%\shutdownDb.bat</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/setup/$KATA_PLATFORM/shutdownDb.sh</pre></td></tr>
</table>


### Viewing the DB:

To view the DB state, you can either use your own tooling, or use the scripts provided within this repo.

##### Option A: Using our provided scripts

For both PostgreSQL and HSQLDB, the scripts are the same as follows.

Once the GUI is started, the setup steps are different; the next subsections will elaborate.

<table>
<tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\setup\%KATA_PLATFORM%\dbviewer.bat</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/setup/$KATA_PLATFORM/dbviewer.sh</pre></td></tr>
</table>



###### Option A: Setup for HSQLDB

Our scripts start HSQLDB's own [DatabaseManager tool](http://hsqldb.org/doc/util-guide/dbm-chapt.html).

The script already is configured by default to connect to the example server.


###### Option A: Setup for PostgreSQL

Our scripts start the [pgAdmin Web UI tool via Docker](https://hub.docker.com/r/dpage/pgadmin4/)

When you run the dbviewer script, you will get a message that directs you to the URL and login to use, such as
the below. Please go to that URL:

```
pgadmin4 setup successful

Please visit http://localhost:8080 w/ username = katadeployer@obevo-kata.com and password as katadeploypass to access the page
```

In the UI, right-click the Servers button to create a new server. Go to the Connection tab.

* Host value:
  * you won't be able to specify localhost as pgadmin and your Postgres instance are each running from
Docker containers
    * (unless you leverage more advanced Docker features, which we will leave out-of-scope for this kata. You are free to go that route if you are proficient with Docker)
  * To get the IP, run the getPostgrepIpForDbviewer script:
    <table>
    <tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\setup\%KATA_PLATFORM%\getPostgrepIpForDbviewer.bat</pre></td></tr>
    <tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/setup/$KATA_PLATFORM/getPostgrepIpForDbviewer.sh</pre></td></tr>
    </table>
* Port value: 5432
* Maintenance database: postgres
* Username: katadeployer
* Password: katadeploypass



###### Option B: Using your own tooling

Alternately, you can go with your own tooling if you'd prefer.

For HSQLDB, the following information may be of use:
* User/password is katadeployer/katadeploypass
* URL is jdbc\:hsqldb\:hsql://localhost:9092/obevokata
* Driver is org.hsqldb.jdbc.JDBCDriver
* Driver jar is available at kata-files/setup/hsqldb-2.3.4.jar


For PostgreSQL, note that you should be able to specify "localhost" as your URL if your tool isn't
running from another Docker container.



### Start the Kata:

You are now ready to try the kata!

Choose one of the lessons from the [Home Page](/README.md) to begin.
