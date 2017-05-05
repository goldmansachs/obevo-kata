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

Kata Overview:
* Part A: Kata Setup
* Part B: File Overview
* Part C: Kata Exercise Steps

# Part A: Kata Setup

#### 1) Download the application
Download the binary from either:
* [Obevo Release page](https://github.com/goldmansachs/obevo/releases/latest)
* Or [this direct link](https://github.com/goldmansachs/obevo/releases/download/6.0.0/obevo-cli-6.0.0-dist.zip)


#### 2) Checkout the kata code
From the [Kata Github project](https://github.com/goldmansachs/obevo-kata)

```
git clone https://github.com/goldmansachs/obevo-kata.git
```


#### 3) Setup the environment variables for the kata
(Not technically required for Obevo's normal execution, but highly recommended for convenience for these exercises)

* OBEVO_HOME for the location of the binary that you unzipped
* KATA_HOME for the location of the kata project that you checked out

```
@REM In Windows
SET OBEVO_HOME=H:\obevo
SET KATA_HOME=H:\obevo-checkout\database-kata
```

```
# In Linux/Bash
export OBEVO_HOME=/home/myuser/obevo
export KATA_HOME=/home/myuser/obevo-checkout/database-kata
```


The scripts will be run at %OBEVO_HOME%\bin (Windows) a.k.a. $OBEVO_HOME/bin (Linux/Bash)

For the rest of this kata, we will use the Windows convention when writing the commands.


#### 4) Run the initial setup command for your files
This step would simulate you creating a database w/ tables, views, data, etc.

 Windows: ```%KATA_HOME%\kata-steps\kata-step1.bat```

 Linux: ```$KATA_HOME/kata-steps/kata-step1.sh```

Your setup should look like this:

![](db-kata-file-setup.jpg)


#### 5) (Optional) Setup Maven to try out the JUnit test and Maven plugin
(If you are already familiar with Maven setup, you can ignore this section)

In this kata, we also demonstrate how to use Obevo in a unit test and to run a test deployment as part of your build.

For that, you will need Maven, which you can download from [here](https://archive.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip)


# Part B: File Overview
Let's review the files in your project.

Files you should ignore:
* /internal/:  files for the Obevo developers to test out the kata in the continuous build
* LICENSE.txt, NOTICE.txt: files required for Apache licensed projects
* kata.md, README.md: documentation files for this kata
* .travis.yml: meant only for the Kata's own continuous build that the Obevo team maintains

Files you will use for the kata:
* kata-db-files/: We will setup a local HSQLDB instance for this kata. The binaries and scripts for that are in this folder
* src/main/database/: Your DB system will be defined in here for the kata. The kata checkout starts with only system-config.xml. You will add more files from...
* kata-steps/: This folder has the example DB files to use in your kata. You can hand-write them yourself into src/main/database, but we provide scripts in this folder to make it easier to move through the kata.
* src/test/java: We show an example here of how to use Obevo in your unit tests.
* pom.xml: standard pom for your project

You can use the kata files as templates for your own project; though for the pom.xml, you should ignore the &lt;profiles&gt;
section, as that is meant only for the Kata's own continuous build that the Obevo team maintains.

# Part C: Kata Exercise Steps

## Setup the test HSQLDB database

First, to demo the tool, we need a database against which to run our scripts.

While you are free to try this against your own database, we provide an HSQL demo here so that you can get this setup quickly without any external dependencies.


Step 1: start the HSQLDB server. This will open up the server on port 9092

 Windows: ```%KATA_HOME%\kata-db-files\startDb.bat```

 Linux: ```$KATA_HOME/kata-db-files/startDb.sh```

Step 2: setup the environment (e.g. schemas, users). This will also create a user with id=katadeployer and
password=katadeploypass for you to use

 Windows: ```%KATA_HOME%\kata-db-files\initDb.bat```

 Linux: ```$KATA_HOME/kata-db-files/initDb.sh```

In case you need to stop the DB:

 Windows: ```%KATA_HOME%\kata-db-files\shutdownDb.bat```

 Linux: ```$KATA_HOME%/kata-db-files/shutdownDb.sh```


### Viewing the DB:
To view the DB state, use any DB viewer tool that you'd like with the following information.

* User/password is deployer/deploypass
* URL is jdbc:hsqldb:hsql://localhost:9092/obevokata
* Driver is org.hsqldb.jdbc.JDBCDriver
* Driver jar is available at kata-db-files/hsqldb-2.3.2.jar


## Kata Step 1 Deployment - Demonstrating a new deployment

These command starts the deployment:

* -sourcePath corresponds to the root folder of your DB files
* -env corresponds to the environment name defined in your system-config.xml file that you want to deploy
 * If your system-config.xml only has 1 environment in it, then you don't need the -env parameter. This option is used by some teams due to how they tokenize their code
 * Note that multiple environments can be deployed in one shot if you choose by: specifing the list of envs in a
 comma-delimited list and/or using a star wildcard (e.g. test* will pull in test1, test20, test21, ...)

 Windows: ```%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test```

 Linux: ```$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test```

Enter "katadeployer" as the user id (without the quotes), and "katadeploypass" as the
password

Follow the prompts to complete the deployment

Now, run the deployment again using the following command. The tool will detect that no changes were needed.
Note that the deployment command is the same as before - that's the point! Reduce the work on your
developers and deployers; let the tool figure out the difference

* Note - if you'd like to do this via command line going forward, add these args: -deployUserId katadeployer -password katadeploypass

 Windows: ```%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass```

 Linux: ```$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass```

Fyi, here are some other command line arguments that may be of use (these are all optional):
* -noPrompt: bypasses all command-line prompts (e.g. hitting "Y" to confirm)
* -cleanFirst: drops all the objects in your schemas prior to deployment. Useful for
    dev/regression-test environments; obviously, not recommended for uat or prod\! You can prevent
    this in certain environments via the cleanBuildAllowed parameter in the system-config.xml file;
    see the xsd description for more info

## Kata Steps 2 and 3 - Demonstrating changes

Now we change some files (run the kata-step2.bat file to change the files; normally, you would just change in place)

Do a deployment again - same command as before

* Windows:
```
%KATA_HOME%\kata-db-files\kata-step2.bat
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

* Linux:
```
$KATA_HOME/kata-db-files/kata-step2.sh
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

These changes feature a couple of the more advanced features of Obevo (you may not need to use
these much, but they are good to know about). For more info, see the [Kata 2 Details](kata-step2.md)

Now try one more set of changes. For more info, see the [Kata 3 Details](kata-step3.md)

* Windows:
```
%KATA_HOME%\kata-db-files\kata-step3.bat
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

* Linux:
```
$KATA_HOME/kata-db-files/kata-step3.sh
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

In step 3, you may notice a couple extra files that have the .baseline. word in them. The next section describes what this does

## Kata Step 3 In-Depth - Maven plugin for testing, and validating changes against a baseline

In the kata step3, we demonstrate the baseline feature. This is optional and is not used in your actual
DB deployments, but is used to help validate your schema.

Here is the use case:
* Table changes are typically executed as ALTER statements. Over the lifetime of a table, many alters get applied and would result in a full table DDL definition
* But every time you try to make an ALTER change, you implicitly want your table to look like the "full table DDL" that you have in mind
 * Some teams will incorporate this into their db script maintenance, e.g. maintaining a "baseline" ddl
* But there has not been a standard way to verify that the ALTERs will actually tie up to the "baseline" ddl.
* Can we do this?

In Obevo, we give this a shot! To do this:
* Add a *.baseline.sql file for each table object file that you maintain
 * The extension does not matter; it can be *.baseline.ddl too. The only requirement is that the "word" before the extension is "baseline"
* This file should have the SQLs for a full DDL. No //// CHANGE sections, no //// METADATA sections, just SQLs that are split by GOs
* These files are ignored when you do a regular deployment
* But these are used when you do a "validateBaseline" deployment via the Maven plugin (more on the plugin below). What this will do:
 * Executes a regular clean and deploy against the environment that you choose
 * Then executes another clean and deploy against that environment, but this time, if it sees
any baseline files, it will replace the "regular" file. (it will inherit any ////
METADATA entries associated w/ the regular file)
 * The tool then compares the table DDLs from the first deployment to the second deployment.
(aided by the [SchemaCrawler library](http://schemacrawler.sourceforge.net/) utility. If it finds
any differences, it will fail the maven goal

Note that this can also potentially fit in well if you generate your DDLs from another source, e.g.
Hibernate or Reladomo. i.e.
* Use Hibernate or Reladomo generate the baseline DDLs
* Then verify that those baseline DDLs match your alters

For more information, see the documentation on [ORM DDL Generation](https://goldmansachs.github.io/obevo/orm-integration.html)
and [Baseline DDL Validation](https://goldmansachs.github.io/obevo/baseline-validation.html).

In the kata example, we have left in a break on-purpose in TABLE_B so that you can see these feature
first-hand (the error looks like the snippet below). Give it a shot to fix this (i.e. add an ALTER
command on TABLE_B to get it in line with the baseline)

```
[ERROR] ObjectCompareBreak{object=obevoKATA.DEMO_SCHEMA.TABLE_B.NEW_COLUMN1, clazz=interface schemacrawler.schema.Column, objectCompareBreakSide=RIGHT}
```
