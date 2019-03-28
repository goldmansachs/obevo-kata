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

# Kata Lesson 2: Reverse-engineering and onboarding an existing system

Pre-requisite: [Setup the kata](kata-setup.md) if you haven't done so already.


## Background: Use case description for onboarding existing databases

(If your team has a long-lived system with many database objects that you'd like to get under SDLC control, this
section is for you.)

If you are reading this page, it likely means that you have some interest in getting your database deployments under
SDLC control. If your system isn't yet in production, then [Lesson 1](kata1-deploy-new-system.md) applies for your team.

But it may seem daunting to try this on an existing system. You may be thinking:
* How do I manage the objects that are already in production?
* How do I deploy new objects without disturbing old objects?
* Can I deploy a full schema in dev or uat without modifying the objects in production?

If your system sounds like this, then this Kata Lesson is for you.

Obevo provides a way to onboard systems that addresses these concerns while keeping your source code maintainable.

What do we mean by this? Let's demonstrate with an example.


## Existing Database System example

We will setup an existing system by running the following script. (Remember to start your DB instance per the
[kata setup](kata-setup.md) instructions)

<table>
<tr><td>Windows</td><td><pre>%KATA_HOME%\kata-files\lesson2\%KATA_PLATFORM%\initDb-lesson2.bat</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$KATA_HOME/kata-files/lesson2/$KATA_PLATFORM/initDb-lesson2.sh</pre></td></tr>
</table>


This deploys a system with:
* 500 tables
* 100 views
* 1000 stored procedures
* 10 user types

There are a number of interdependencies among these objects:
* Tables may depend on user types
* Views may depend on tables or other views
* Stored procedures may depend on tables, views, or other stored procedures

Given these interdependencies, it is not a trivial task to deploy the schema by simply generating the DDL for each
individual object and deploying them; the **_order_** in which we deploy objects is also critical.

Many reverse-engineering tools will generate scripts for an entire schema that produces a correct order of the objects;
see the initDb-lesson2.ddl file (in /kata-files/lesson2/<platform>/initDb-lesson2.ddl) for an example; this was the file used to deploy the
existing system in the script above.

While this can work for deploying a brand-new schema, we run into a couple issues when using this for practical
purposes.

#### 1) Difficult to deploy incremental change to a production system.

Let's say that you want to deploy a change to TABLE428; such a change would require an alter statement. Where would this
alter statement go?

We have 2 difficulties if we decide to put it at the end of the same file:
* We'd need a way to demarcate between the old changes and new change, so that only the new change will be applied
incrementally to production.
* This single file becomes a bottleneck for all developers to code changes on the production schema, leading to more
VCS conflicts and more cumbersome code reviews.

Alternatively, we can put new changes into separate files. But now we need a way to determine how those other files get
ordered, and in addition we get to another problem ...


#### 2) Difficult to maintain and view your objects in your source code

Continuing the above example, we can have a source code structure as follows:

* initDb.ddl
* 1-alterTableA.ddl
* 2-alterTableB.ddl
* 3-editViewC.ddl
* 4-alterTableB.ddl
* 5-createTableZ.ddl
* 6-editViewC.ddl

This structure has some unpleasant characteristics:

* We cannot see what is in this DB; the initDb.ddl file has over 1000 objects defined in it! We would not think to
define 1000 classes in a file for your application code; why do it for your database code?
* We have changes for a particular object spread out over multiple files:
** TableB is mentioned in initDb.ddl, 2-alterTableB.ddl, and 4-alterTableB.ddl
** ViewC is mentioned in initDb.ddl, 3-editViewC.ddl, and 6-editViewC.ddl
* Object code for rerunnable objects such as views will be repetitive. If we can simply drop and add a view, why need
3-editViewC.ddl and 6-editViewC.ddl? When can we clean up 3-editViewC.ddl, while still ensuring that the DB can be
deployed correctly?


#### The alternative: File-per-object file structure, but how do we get there?

In [Kata Lesson 1](kata1-deploy-new-system), we see it is possible to maintain a file-per-object structure that is
easy to maintain while still being able to order the deployments accordingly.

But can this _really_ work for a large and complex use case?

Yes it can, with Obevo reverse-engineering. Our [Onboarding Guide](https://goldmansachs.github.io/obevo/onboarding-guide.html)
gives you the full details on setting up your existing DB (most relevant to this kata lesson, see the [Existing Systems Onboarding Guide](https://goldmansachs.github.io/obevo/existing-onboarding-guide.html)).

For this Kata Lesson, we will give you a quick synopsis of what to do, using our example HSQLDB instance.



## Step 1: Reverse-Engineer the DDLs from the DB to files

* Step Objectives: Execute a reverse-engineering operation using the API against a live and large schema
* Verification Step: Run the tests in RevengLessonStep1.java
* Pre-requisite: please run the script kata-files/lesson2/$KATA_PLATFORM/initDb-lesson2.sh or .bat to create the schema you will reverse-engineer
---------

Execute the following command (_it may take anywhere from a few seconds to a minute to run_). This will output the DDLs to $KATA_HOME/src/main/database/lesson/reveng,
as indicated by the command.

#### For HSQL:
<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat NEWREVENG -mode SCHEMA -dbType HSQL -jdbcUrl jdbc:hsqldb:hsql://localhost:9092/obevokata -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath %KATA_HOME%/src/main/database/lesson/reveng</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh NEWREVENG -mode SCHEMA -dbType HSQL -jdbcUrl jdbc:hsqldb:hsql://localhost:9092/obevokata -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath $KATA_HOME/src/main/database/lesson/reveng</pre></td></tr>
</table>

This outputs the files directly to your directory.

#### For PostgreSQL:
<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat NEWREVENG -mode SCHEMA -dbType POSTGRESQL -dbHost localhost -dbPort 5432 -dbServer postgres -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath %KATA_HOME%/src/main/database/lesson/reveng</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh NEWREVENG -mode SCHEMA -dbType POSTGRESQL -dbHost localhost -dbPort 5432 -dbServer postgres -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath $KATA_HOME/src/main/database/lesson/reveng</pre></td></tr>
</table>

For some tooling, we do not have the full automation ready within Obevo itself due to vagaries around calling other
tooling.

However, the command above will emit the appropriate pg_dump command to get the output from your PostgreSQL server,
which you can then feed into the Obevo reverse-engineering tool.

The commands will look something like below (but do not use this text for your kata; use the output from Obevo's tool):

```
# enter your container name - for the kata use case, it is obevo-postgresql-instance 
CONTAINER_NAME=obevo-postgresql-instance
docker exec $CONTAINER_NAME pg_dump -O -s -h localhost -p 5432 --username=katadeployer -d postgres -n MYLARGESCHEMA > /yourFolder/obevo-kata/src/main/database/lesson/reveng/interim/revengoutput.txt

# now append the -inputPath argument at the end, as the Obevo command indicates:
$OBEVO_HOME/bin/deploy.sh NEWREVENG -mode SCHEMA -dbType POSTGRESQL -dbHost localhost -dbPort 5432 -dbServer postgres -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath $KATA_HOME/src/main/database/lesson/reveng -inputPath $KATA_HOME/src/main/database/lesson/reveng/interim
```

For more details on how reverse-engineering is handled for other DBMS platforms, see the [DBMS-specific reverse engineering tools](https://goldmansachs.github.io/obevo/reverse-engineer-dbmstools.html)
doc.

#### Explaining the arguments in more depth:
* -mode &lt;SCHEMA or DATA&gt;: Indicates whether we reverse-engineer the schema DDLs or data rows from the tables. For this kata, we will only cover the SCHEMA mode
* -dbType &lt;dbtype&gt;: The DB type to connect to. Supports values ORACLE, MSSQL, DB2, SYBASE_ASE, POSTGRESQL, HSQL
* -jdbcUrl &lt;jdbc:yourUrl&gt;: The URL to connect to
* -dbSchema &lt;yourSchema&gt;: The schema (or database for MSSQL and SYBASE_ASE) to reverse-engineer; only 1 schema can be done per command
* -username and -password: Credentials to pass in
* -outputPath &lt;directory&gt;: The directory to write the output to


#### What is in the output directory

1) /interim: This directory contains the output generated from the reverse-engineering command.

Obevo will use this interim file as the input to the next step to generate the Obevo directory structure.

* For HSQL, Obevo's NEWREVENG command populates this on its own
* For PostgreSQL, the pg_dump command will populate it, as mentioned above

These interim files are kept as it is possible to edit the interim files and rerun the reverse-engineering from that
point if needed; see the next section for details.

2) /final: Contains the reverse-engineered project. Includes a sample system-config.xml based on the provided input.



## Step 2: Update system-config.xml to point to a new dev schema

* Step Objectives: Become familiar with the idea around creating a new dev environment
* Verification Step: None; we will verify in the next step
---------

The reverse-engineering generates a system-config.xml file with two environments defined.

The first is named "prod" and corresponds to the connection parameters that you passed in during your reverse-engineering
command. It is named "prod" as we assume that you would want to reverse-engineer the golden copy of your DDL source code
from production.

The second is named "dev" and is there as a placeholder for you to edit. It also includes some comments that give more
pointers on editing the file. For this kata example, we will write this to another schema in the same HSQLDB instance.

Please replace the existing dev1 configuration with the code snippet below. Of note:
* We will allow clean builds (i.e. to wipe away the schema) in dev, but not prod
* We use the dbSchemaSuffix parameter to create the schema for our environment as MYLARGESCHEMA_DEV1

<table>
<tr><td>For HSQL:</td><td><pre><dbEnvironment name="dev1" cleanBuildAllowed="true"
    jdbcUrl="jdbc:hsqldb:hsql://localhost:9092/obevokata" dbSchemaSuffix="_DEV1" /></pre></td></tr>
<tr><td>For PostgreSQL:</td><td><pre><dbEnvironment name="dev1" cleanBuildAllowed="true"
    dbHost="localhost" dbPort="5432" dbServer="postgres" dbSchemaSuffix="_DEV1" /></pre></td></tr>
</table>


## Step 3: Verify the DDLs are correct by executing a deploy against the dev environment

* Step Objectives: Deploy a new dev database from your prod DB code
* Verification Step: Run the tests in RevengLessonStep3.java
---------

Use the commands below, which will deploy the dev1 environment that you setup from the reverse-engineered output.

Note the -forceEnvSetup argument - what is it for? Let's dive in:

* We've specified a schema MYLARGESCHEMA_DEV1 - who will create it?
* In production, you may want further control on the database schemas that you create and do it separately from Obevo.
* However, Obevo can setup simple schemas for some DBMS types (including HSQLDB and PostgreSQL).
* This functionality is enabled with -forceEnvSetup, which will create schemas, groups, and users defined in system-config.xml

<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env dev1 -deployUserId katadeployer -password katadeploypass -forceEnvSetup</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env dev1 -deployUserId katadeployer -password katadeploypass -forceEnvSetup</pre></td></tr>
</table>

The deployment should succeed. As a result, we know that the DDLs are valid and can be deployed to any new environment,
which will prove useful for testing and development purposes.

## Step 4: Initialize the production environment 

* Step Objectives: Initialize your production schema to ensure that you can deploy changes to it again
* Verification Step: Run the tests in RevengLessonStep4.java
---------

However, there is one more step left. While we can deploy these DDLs to a new dev environment, we would not want to
re-execute them against our production schema, as the DDLs already exist there.

To check this, run the PREVIEW command; this will show you what objects still need to be deployed to the environment.
Ideally, this would be a no-op against production, but Obevo will still show that a new schema needs deployment.

    <table>
    <tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat PREVIEW -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
    <tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh PREVIEW -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
    </table>

To fix this, we need to initialize the schema, i.e. to tell Obevo that this schema has already been deployed, which we
will do next. (For reference, you can see the expected file output in kata-files/lesson2/$KATA_PLATFORM/expected)

The INIT command will perform a deployment that populates the [Deploy Audit Log](https://goldmansachs.github.io/obevo/design-walkthrough.html#Deployment_Algorithm)
tables in the environments, but not the actual SQLs defined in your DDLs.

The command arguments are the same as for the DEPLOY and PREVIEW commands, except that we specify INIT as the first
argument.

<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat INIT -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh INIT -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
</table>


Once that completes, try a regular deploy against the "prod" environment and verify that it is a no-op
<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
</table>


## Step 5: Test that subsequent incremental changes work

* Step Objectives: Deploy a new incremental change against your production database.
* Verification Step: Run the tests in RevengLessonStep5.java
---------

Lastly, let's prove to ourselves that we can still do subsequent migrations.

Change the content of a couple objects as follows:

1) In table0.sql
    ```
    //// CHANGE name=change2
    ALTER TABLE table0 ADD COLUMN newcol integer
    GO
    ```

2) In view0.sql - change "select 1" to "select 2"
    ```
    CREATE VIEW view0 AS
     SELECT 2 AS c1
     ...
    ```

Then rerun the deployments against prod and dev1. You will see
that with the same input code base, we can deploy to a brand new schema _and_ incrementally to a production schema.

<table>
<tr><td>Windows</td><td><pre>REM first, clean dev1
%OBEVO_HOME%\bin\deploy.bat DEPLOY -action clean -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env dev1 -deployUserId katadeployer -password katadeploypass
REM then re-deploy both dev1 and prod to compare
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env dev1 -deployUserId katadeployer -password katadeploypass
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre># first, clean dev1
$OBEVO_HOME/bin/deploy.sh DEPLOY -action clean -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env dev1 -deployUserId katadeployer -password katadeploypass
# then re-deploy both dev1 and prod to compare
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env dev1 -deployUserId katadeployer -password katadeploypass
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database/lesson/reveng/final -env prod -deployUserId katadeployer -password katadeploypass</pre></td></tr>
</table>




## That's it!

And that's it! You have taken an existing system with hundreds of DB objects and
onboarded it to Obevo.



You can now do the same for your existing systems. Some of your systems may not be so simple and
need a couple file corrections before you complete your onboarding. The [Existing Systems Onboarding Guide]()