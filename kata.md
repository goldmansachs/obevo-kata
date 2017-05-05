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

#### 1) Download the application
Either find the binary file link from the [Obevo Release page](https://github.com/goldmansachs/obevo/releases/latest)

Or use [this link](https://github.com/goldmansachs/obevo/releases/download/6.0.0/obevo-cli-6.0.0-dist.zip) directly.


#### 2) Checkout the kata code
From the [Kata Github project](/)


#### 3) Setup the environment variables for the kata
(Not technically required for Obevo's normal execution, but highly recommended for convenience for these exercises)

* OBEVO_HOME for the location of the binary that you unzipped
* KATA_HOME for the location of the kata project that you checked out

```
@REM In Windows
SET OBEVO_HOME=H:\obevo
SET KATA_HOME=H:\obevo-checkout\database-kata
```

The scripts will be run at %OBEVO_HOME%\bin


#### 4) Run the initial setup command for your files
This step would simulate you creating a database w/ tables, views, data, etc.
            
```
cd %KATA_HOME%
kata-files\kata-step1.bat
```

Your setup should look like this:

![](internal/db-kata-file-setup.jpg)


# Kata Folder Structure Overview
Let's review



#### (Optional) Confirm your Maven settings
In case you want to give the Maven plugin a try, ensure that your Maven settings.xml file has the &lt;pluginRepositories&gt;
section defined. Otherwise, the maven plugin calls won't work
            
# Kata Steps

## Setup the test HSQLDB database

First, to demo the tool, we need a database to try stuff on.

While you are free to try this against your own DB2, IQ, or ASE database, we provide an HSQL demo here so that you can get this setup quickly without any external dependencies


Step 1: start the HSQLDB server. This will open up the server on port 9092
```
cd %KATA_HOME%
kata-files\startDb.bat
```

Step 2: setup the environment (e.g. schemas, users). This will also create a user with id=katadeployer and
password=katadeploypass for you to use

```
cd %KATA_HOME%
kata-files\initDb.bat
```

In case you need to stop the DB:
```cd %KATA_HOME% kata-files\shutdownDb.bat```

### Viewing the DB:
To view the DB state, use any DB viewer tool that you'd like

* Choose &quot;Generic - JDBC&quot; as the type
* User/password is deployer/deploypass
* URL is jdbc:hsqldb:hsql://localhost:9092/obevokata
* Driver is org.hsqldb.jdbc.JDBCDriver
* For the Driver Location, choose the hsqldb-2.3.2 jar from the kata folder

Once you enter that, you can browse your local server.

## Kata Step 1 Deployment - Demonstrating a new deployment

These command starts the deployment:

* -sourcePath corresponds to the root folder of your DB files
* -env corresponds to the environment name defined in your system-config.xml file that you want to deploy
 * If your system-config.xml only has 1 environment in it, then you don't need the -env parameter. This option is used by some teams due to how they tokenize their code
 * Note that multiple environments can be deployed in one shot if you choose by: specifing the list of envs in a
 comma-delimited list and/or using a star wildcard (e.g. test\* will pull in test1, test20, test21, ...)

```%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath src/main/database -env test```

Enter "katadeployer" as the user id (without the quotes), and &quot;katadeploypass&quot; as the
password
* Note - if you'd like to do this via command line going forward, add these args: -deployUserId katadeployer -password katadeploypass

Follow the prompts to complete the deployment

Now, run the deployment again using the following command. The tool will detect that no changes were needed.
Note that the deployment command is the same as before - that's the point! Reduce the work on your
developers and deployers; let the tool figure out the diff

```%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath src/main/database -env test```

Fyi, here are some other command line arguments that may be of use (these are all optional):
* -noPrompt: bypasses all command-line prompts (e.g. hitting &quot;Y&quot; to confirm)
* -cleanFirst: drops all the objects in your schemas prior to deployment. Useful for
    dev/regression-test environments; obviously, not recommended for uat or prod\! You can prevent
    this in certain environments via the cleanBuildAllowed parameter in the system-config.xml file;
    see the xsd description for more info

## Kata Steps 2 and 3 - Demonstrating changes

Now we change some files (run the kata-step2.bat file to change the files. normally, you would just change in place)

Do a deployment again - same command as before
```
kata-files\kata-step2.bat
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath src/main/database -env test
```

These changes feature a couple of the more advanced features of Obevo (you may not need to use
these much, but they are good to know about). More on these below

Now try one more set of changes
```
kata-files\kata-step3.bat
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath src/main/database -env test
```

In step 3, you may notice a couple extra files that have the .baseline. word in them. The next section describes what this does

## Kata Step 3 In-Depth - Maven plugin for testing, and validating changes against a baseline

In the kata step3, we demonstrate the baseline feature. This is optional and is not used in your actual
DB deployments, but is used to help validate your schema.

Here is the use case:
* Table changes are typically executed as ALTER statements. Over the lifetime of a table, many alters get applied and would result in a full table DDL definition
* But every time you try to make an ALTER change, you implicitly want your table to look like the &quot;full table DDL&quot; that you have in mind
 * Some teams will incorporate this into their db script maintenance, e.g. maintaining a &quot;baseline&quot; ddl
* But there has not been a standard way to verify that the ALTERs will actually tie up to the &quot;baseline&quot; ddl.
* Can we do this?

In Obevo, we give this a shot! To do this:
* Add a *.baseline.sql file for each table object file that you maintain
 * The extension does not matter; it can be *.baseline.ddl too. The only requirement is that the &quot;word&quot; before the extension is &quot;baseline&quot;
* This file should have the SQLs for a full DDL. No //// CHANGE stuff, no //// METADATA stuff, just SQLs that are split by GOs
* These files are ignored when you do a regular deployment
* But these are used when you do a &quot;validateBaseline&quot; deployment via the Maven plugin (more on the plugin below). What this will do:
 * Executes a regular clean and deploy against the environment that you choose
 * Then executes another clean and deploy against that environment, but this time, if it sees
any baseline files, it will replace the &quot;regular&quot; file. (it will inherit any ////
METADATA entries associated w/ the regular file)
 * The tool then compares the table DDLs from the first deployment to the second deployment.
(This is aided greatly by the [http://schemacrawler.sourceforge.net/] utility. If it finds
any differences, it will fail the maven goal

Note that this can also potentially fit in well if you generate your DDLs from another source, e.g.
Hibernate or Reladomo. So you can have Hibernate or Mithra generate the baseline DDLs, and we can then
truly
verify that the DDLs from Hibernate/Mithra tie to your alters!
* We do have a utility available to do this for Hibernate - please contact the product team via Github for more info (haven't had the chance to put up this documentation yet)

In the kata example, we have left in a break on-purpose in TABLE_B so that you can see these feature
first-hand (the error looks like the snippet below). Give it a shot to fix this (i.e. add an ALTER
command on TABLE_B to get it in line with the baseline)

```[ERROR] ObjectCompareBreak{object=obevoKATA.DEMO_SCHEMA.TABLE_B.NEW_COLUMN1, clazz=interface schemacrawler.schema.Column, objectCompareBreakSide=RIGHT}```
