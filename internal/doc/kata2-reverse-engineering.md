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

We will setup an existing system by running the following script. (Remember to start your HSQLDB instance per the
[kata setup](kata-setup.md) instructions)

```
@REM In Windows
%KATA_HOME%\kata-files\lesson2\initDb-lesson2.bat
```

```
# In Linux/Bash
$KATA_HOME/kata-files/lesson2/initDb-lesson2.sh
```


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
see the [initDb-lesson2.ddl](/kata-files/lesson2/initDb-lesson2.ddl) file for an example; this was the file used to deploy the
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



## Step1: Reverse-Engineer the DDLs from the DB to files

Execute the following command (_it may take a few seconds to run_). This will output the DDLs to %KATA_HOME%\target\lesson2-reveng,
as indicated by the command.

```
@REM In Windows
%OBEVO_HOME%\bin\deploy.sh NEWREVENG -mode SCHEMA -dbType HSQL -jdbcUrl jdbc:hsqldb:hsql://localhost:9092/obevokata -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath %KATA_HOME%/reverse-engineering-example
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh NEWREVENG -mode SCHEMA -dbType HSQL -jdbcUrl jdbc:hsqldb:hsql://localhost:9092/obevokata -dbSchema MYLARGESCHEMA -username katadeployer -password katadeploypass -outputPath $KATA_HOME/reverse-engineering-example
```

Explaining the arguments in more depth:
* -mode &lt;SCHEMA or DATA&gt;: Indicates whether we reverse-engineer the schema DDLs or data rows from the tables. For this kata, we will only cover the SCHEMA mode
* -dbType &lt;dbtype&gt;: The DB type to connect to. Supports values ORACLE, MSSQL, DB2, SYBASE_ASE, POSTGRESQL, HSQL
* -jdbcUrl &lt;jdbc:yourUrl&gt;: The URL to connect to
* -dbSchema &lt;yourSchema&gt;: The schema (or database for MSSQL and SYBASE_ASE) to reverse-engineer; only 1 schema can be done per command
* -username and -password: Credentials to pass in
* -outputPath &lt;directory&gt;: The directory to write the output to


#### What is in the output directory

1) /interim: This directory contains the output generated from the raw HSQLDB reverse-engineering command.

Obevo will use this interim file as the input to the next step to generate the Obevo directory structure.

These interim files are kept as it is possible to edit the interim files and rerun the reverse-engineering from that
point if needed; see the next section for details.

2) /final: Contains the reverse-engineered project. Includes a sample system-config.xml based on the provided input.


#### Two-step reverse-engineering for certain DBMS types using the /interim directory

(This section is not applicable for this kata; it is informational for you in case you apply this to your real project).

For HSQLDB, we were able to reverse-engineer the product using a single command to Obevo, as Obevo was able to invoke
the HSQLDB reverse-engineering APIs directly. We can do the same for Oracle

However, the other DBMS types supported by Obevo do not have a Java API for reverse-engineering, but a command line API
instead. As those APIs have slightly more complexity to invoke (e.g. due to such requirements as setting environment
variables beforehand), we will not invoke them directly in Obevo.

Instead, the Obevo reverse-engineering command will print out instructions for what you should do to invoke the next
step of reverse-engieering. For example, PostgreSQL requires the pg_dump command and DB2 the db2look command.

For more details, see the [DBMS-specific reverse engineering tools](https://goldmansachs.github.io/obevo/reverse-engineer-dbmstools.html)
page.


## Step 2: Update system-config.xml to point to a new dev schema

The reverse-engineering generates a system-config.xml file with two environments defined.

The first is named "prod" and corresponds to the connection parameters that you passed in during your reverse-engineering
command. It is named "prod" as we assume that you would want to reverse-engineer the golden copy of your DDL source code
from production.

The second is named "dev" and is there as a placeholder for you to edit. It also includes some comments that give more
pointers on editing the file. For this kata example, we will write this to another schema in the same HSQLDB instance.

Please replace the existing dev1 configuration with the code snippet below. Of note:
* We will allow clean builds (i.e. to wipe away the schema) in dev, but not prod
* We use the dbSchemaSuffix parameter to create the schema for our environment as MYLARGESCHEMA_DEV1

```
<dbEnvironment name="dev1" cleanBuildAllowed="true"
        jdbcUrl="jdbc:hsqldb:hsql://localhost:9092/obevokata" dbSchemaSuffix="_DEV1">
</dbEnvironment>
```


## Step 3: Verify the DDLs are correct by executing a deploy against the dev environment

Use the commands below, which will deploy the dev1 environment that you setup from the reverse-engineered output.

Note that Obevo will automatically create schemas in HSQLDB (MYLARGESCHEMA_DEV1 for our environment's case).

```
@REM In Windows
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/reverse-engineering-example/final -env dev1 -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/reverse-engineering-example/final -env dev1 -deployUserId katadeployer -password katadeploypass
```


The deployment should succeed. As a result, we know that the DDLs are valid and can be deployed to any new environment,
which will prove useful for testing and development purposes.



However, there is one more step left. While we can deploy these DDLs to a new dev environment, we would not want to
re-execute them against our production schema, as the DDLs already exist there.

To check this, run the PREVIEW command; this will show you what objects still need to be deployed to the environment.
Ideally, this would be a no-op against production, but Obevo will still show that a new schema needs deployment.

```
@REM In Windows
%OBEVO_HOME%\bin\deploy.bat PREVIEW -sourcePath %KATA_HOME%/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh PREVIEW -sourcePath $KATA_HOME/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```


To fix this, we need to initialize the schema, i.e. to tell Obevo that this schema has already been deployed, which we
will do next.


(For reference, you can see the expected file output in kata-files/lesson2/expected)


## Step 4: Run INIT against the production environment

The INIT command will perform a deployment that populates the [Deploy Audit Log](https://goldmansachs.github.io/obevo/design-walkthrough.html#Deployment_Algorithm)
tables in the environments, but not the actual SQLs defined in your DDLs.

The command arguments are the same as for the DEPLOY and PREVIEW commands, except that we specify INIT as the first
argument.

```
@REM In Windows
%OBEVO_HOME%\bin\deploy.bat INIT -sourcePath %KATA_HOME%/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh INIT -sourcePath $KATA_HOME/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```


Once that completes, try a regular deploy against the "prod" environment and verify that it is a no-op
```
@REM In Windows
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```


## Step 5: Test that subsequent incremental changes work

Lastly, let's prove to ourselves that we can still do subsequent migrations.

Change the content of one of the views in your codebase. Then rerun the deployments against prod and dev1. You will see
that with the same input code base, we can deploy to a brand new schema _and_ incrementally to a production schema.

```
@REM In Windows
REM first, clean dev1
%OBEVO_HOME%\bin\deploy.bat DEPLOY -action clean -sourcePath %KATA_HOME%/reverse-engineering-example/final -env dev1 -deployUserId katadeployer -password katadeploypass
REM then re-deploy both dev1 and prod to compare
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/reverse-engineering-example/final -env dev1 -deployUserId katadeployer -password katadeploypass
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
# first, clean dev1
$OBEVO_HOME/bin/deploy.sh DEPLOY -action clean -sourcePath $KATA_HOME/reverse-engineering-example/final -env dev1 -deployUserId katadeployer -password katadeploypass
# then re-deploy both dev1 and prod to compare
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/reverse-engineering-example/final -env dev1 -deployUserId katadeployer -password katadeploypass
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/reverse-engineering-example/final -env prod -deployUserId katadeployer -password katadeploypass
```



## That's it!

And that's it! You have taken an existing system with hundreds of DB objects and
onboarded it to Obevo.



You can now do the same for your existing systems. Some of your systems may not be so simple and
need a couple file corrections before you complete your onboarding. The [Existing Systems Onboarding Guide]()