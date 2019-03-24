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

# Kata Lesson 1: Deploying a New System

Pre-requisite: [Setup the kata](kata-setup.md) if you haven't done so already.

## Overview of Sample Model

For this lesson, we will be working with the database code inside /src/main/database.

We have a simple domain model to deal with - the typical "Bank" example, as described below.

|Table Name|Table Type \[1]|Description|
|------|------|------|
|Person|App|The customers looking to manage money in the bank|
|Account|App|Indicates the amount of money that each person has at the bank|
|AccountType|Static Code Table|Denotes the types of accounts possible (checking / savings / ...)|
|Country|Static Code Table|List of countries|
|AccessLog|App|Indicates accesses to the system|

\[1] Table Type indicates whether the data is managed dynamically by the app or statically (e.g. at deploy time)
as a code table.


##### What exactly is in the /src/main/database folder?

The [Obevo project-structure documentation](https://goldmansachs.github.io/obevo/db-project-structure.html)
explains the code structure in more detail, but we will give a quick introduction here:

**system-config.xml**: defines the runtime environment that you intend to deploy to.

**DEMO_SCHEMA**: your logical schema (i.e. it will have the objects you intend to manage in a physical schema).
* i.e. your application has one canonical logical schema that is deployed to many environments, such as dev, qa, and prod


**Object Type Folders**: We can manage various object types under each schema. For this project, we have:
* table: the standard table type in SQL
* view: the standard view type in SQL
* staticdata: data files that you intend to load into tables (i.e. for cases where you want to manage the content of the table in your code)
* migration: ad-hoc SQL update scripts that are executed only once. Intended as a utility for edge cases

Let's now try to deploy a schema!


## General Kata Structure for this Lesson

For each step, you will be making changes in src/main/database to ensure that the corresponding
unit test passes (e.g. DeployLessonStep1, DeployLessonStep2)

* Note: these test examples show our usage of our DB Metadata API (based on [SchemaCrawler](http://www.schemacrawler.com)) to
introspect DB metadata. Feel free to ask if you'd like to learn more

Answers are in kata-files/lesson1/step* if you want to compare or need some help.

You can use the scripts in kata-files/kata-step*.sh (or .bat for Windows) if you want to jump to
different steps.  

Modify DeployLessonBase to specify the platform you will use (postgresql or hsql).


## Step 1: Deploy a new schema

* Step Objectives: Perform a deployment, gain familiarity with the command-line API
* Verification Step: Run the tests in DeployLessonStep1.java
* Pre-requisite: please run the script kata-files/lesson1/kata-step1.sh or .bat to add your base files if you haven't already. For this step only, we will modify the files for you (subsequent steps are on your own)
---------

This command executes a deployment:

<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test</pre></td></tr>
</table>

Argument Description:
* -sourcePath corresponds to the root folder of your DB files
* -env corresponds to the environment name defined in your system-config.xml file that you want to deploy
 * If your system-config.xml only has 1 environment in it, then you don't need the -env parameter. This option is used by some teams due to how they tokenize their code
 * Note that multiple environments can be deployed in one shot if you choose by: specifing the list of envs in a
 comma-delimited list and/or using a star wildcard (e.g. test* will pull in test1, test20, test21, ...)

Enter "katadeployer" as the user id (without the quotes), and "katadeploypass" as the password

Follow the prompts to complete the deployment.



### Step 1a: Rerun deploy to confirm a no-op deployment
Now, run the deployment again using the same command.

The tool will detect that no changes were needed. Note that the deployment command is the same as
before - that's the point! Reduce the work on your developers and deployers; let the tool figure out the difference.


### Additional Command Line Tips

1) -deployUserId / -password: Let's you specify the login non-interactively

<table>
<tr><td>Windows</td><td><pre>%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass</pre></td></tr>
<tr><td>Linux/Bash</td><td><pre>$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass</pre></td></tr>
</table>

2) -noPrompt: bypasses all command-line prompts (e.g. hitting "Y" to confirm)

3) -action CLEAN,DEPLOY

    You can specify the CLEAN action to drop all objects in your schemas (the default action value is DEPLOY).
    This is useful for dev/regression-test environments; obviously, not recommended for uat or prod!
    You can prevent cleans in certain environments via the cleanBuildAllowed parameter in system-config.xml.

For more details, see the [Command-line API documentation](https://goldmansachs.github.io/obevo/command-line-api.html)


## Step 2: Basic Schema Modifications

* Step Objectives: Learn how to modify a schema using Obevo by modifying your DB code in /src/main/database
* Verification Step: Run the tests in DeployLessonStep2.java
* Answer lookup: your files in /src/main/database should match /kata-files/lesson1/step2
---------

Next, let's try to perform some basic modifications on the schema that is typical of many database applications.

* Adding columns
* Deleting columns
* Creating views
* Deleting views
* Modifying static table data
* Updating dynamic table data

Note that we do changes on both stateful and stateless object types here.
Some of the columns have "mistake" or "rollback" in the name; that is fine, we will use these
to expound on further examples later on.

1) In Account, create two new columns per the syntax below.

```
alter table Account add column accountOpenDate date
GO
alter table Account add column rollbackImmediate integer
```

Note that due to some DBMS platforms not executing DDL changes transactionally, that we prefer such statements to
get broken up into multiple "//// CHANGE" scripts (more details [here](https://goldmansachs.github.io/obevo/error-handling.html).

2) In AccountType, drop the myMistakenColumn. Remember to update the staticdata file accordingly

```
alter table AccountType drop column myMistakenColumn
```

3) In Person, go ahead and add *and* drop some columns

```
alter table Person drop column myMistakenColumn
GO
alter table Person add column dob date
```

4) Modify the Country.csv static data file

* Val Verde is not an actual country; delete it
* Let's add Brazil (BR) to the table
* Update the full name of US to "United States of America"

FYI - for more details on the static-data functionality, see [here](https://goldmansachs.github.io/obevo/db-project-structure.html#Managing_Static_Data__Code_Tables).
We have a few advanced features not demonstrated in this kata, e.g.
* Handling static data tables with foreign key dependencies
* Auto-updating a timestamp column for audit
 

5) Let's do some ad-hoc data corrections in the Person table using a /migration script. This is not
a primary feature of Obevo, but on occasions clients have needed it, so we allow this.

We treat this as an incremental change (coded similarly to tables, except we are allowed to delete
/migration scripts).

More info on migration scripts [here](https://goldmansachs.github.io/obevo/db-project-structure.html#Ad-hoc_data_migrations)

```
INSERT INTO Person (id, firstName, lastName, addressCountryName)
VALUES (1, 'F1', 'L1', 'Japan')
GO
INSERT INTO Person (id, firstName, lastName, addressCountryName)
VALUES (2, 'F2', 'L2', 'United Kingdom')
GO
```


## Step 3: Rollback (work-in-progress)

Lesson will be available at a later date, though the code is already available


## Step 4 - Data Migration (work-in-progress)

Lesson will be available at a later date, though the code is already available


## That's it! Onto the next lesson

This lesson showed you how to deploy a brand new schema and make changes.

Please continue to the other kata lessons via [this page](/README.md).
