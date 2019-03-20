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

What exactly is in the /src/main/database folder? The [Obevo project-structure documentation](https://goldmansachs.github.io/obevo/db-project-structure.html)
explains the code structure in more detail, but we will give a quick introduction here:

system-config.xml defines the runtime environment that you intend to deploy to.

DEMO_SCHEMA is your logical schema (i.e. it will have the objects you intend to manage in a physical schema).
* i.e. your application has one canonical logical schema that is deployed to many environments, such as dev, qa, and prod

We can manage different object types under each schema. For this project, we have:
* table: the standard table type in SQL
* view: the standard view type in SQL
* staticdata: data files that you intend to load into tables (i.e. for cases where you want to manage the content of the table in your code)
* migration: ad-hoc SQL update scripts that are executed only once. Intended as a utility for edge cases

Let's now try to deploy a schema!


## Step 1 - Deploying a new schema
This command executes a deployment:

```
@REM In Windows
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test
```

* -sourcePath corresponds to the root folder of your DB files
* -env corresponds to the environment name defined in your system-config.xml file that you want to deploy
 * If your system-config.xml only has 1 environment in it, then you don't need the -env parameter. This option is used by some teams due to how they tokenize their code
 * Note that multiple environments can be deployed in one shot if you choose by: specifing the list of envs in a
 comma-delimited list and/or using a star wildcard (e.g. test* will pull in test1, test20, test21, ...)

Enter "katadeployer" as the user id (without the quotes), and "katadeploypass" as the password

Follow the prompts to complete the deployment

Now, run the deployment again using the same command. The tool will detect that no changes were needed. Note that the
deployment command is the same as before - that's the point! Reduce the work on your developers and deployers; let the
tool figure out the difference.

* Note - if you'd like to do this via command line going forward, add these args: -deployUserId katadeployer -password katadeploypass

```
@REM In Windows
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

For reference, here are some other command line arguments that may be of use (these are all optional):
* -noPrompt: bypasses all command-line prompts (e.g. hitting "Y" to confirm)
* -cleanFirst: drops all the objects in your schemas prior to deployment. Useful for
    dev/regression-test environments; obviously, not recommended for uat or prod! You can prevent
    this in certain environments via the cleanBuildAllowed parameter in the system-config.xml file;
    see the xsd description for more info

## Step 2 - Basic Schema Modifications

adding columns
deleting columns
new view
delete view

## Step 3 - Rollback

and 3 - Modifying a schema

step 3
rollback with deploy
rollback with regular script


## Step 4 - Data Migration
data migration



Let's try out some alterations in the database.

For this kata, run the kata-step2 script to change the files. Normally, you would modify the files as you normally
would (e.g. via a text editor). The script will do that for you as a convenience.

No re-deploy the schema using the same command as before.

```
@REM In Windows
%KATA_HOME%\kata-files\lesson1\kata-step2.bat
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$KATA_HOME/kata-files/lesson1/kata-step2.sh
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

These changes feature a couple of the more advanced features of Obevo (you may not need to use
these much, but they are good to know about). For more info, see the [Kata 2 Details](kata1-step2.md)

Now try one more set of changes. For more info, see the [Kata 3 Details](kata1-step3.md)

```
@REM In Windows
%KATA_HOME%\kata-files\lesson1\kata-step3.bat
%OBEVO_HOME%\bin\deploy.bat DEPLOY -sourcePath %KATA_HOME%/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

```
# In Linux/Bash
$KATA_HOME/kata-files/lesson1/kata-step3.sh
$OBEVO_HOME/bin/deploy.sh DEPLOY -sourcePath $KATA_HOME/src/main/database -env test -deployUserId katadeployer -password katadeploypass
```

In step 3, you may notice a couple extra files that have the .baseline. word in them. The next section describes what this does



## That's it! Onto the next lesson

Lesson 1 showed you how to deploy a brand new schema.

Please continue to the other kata lessons via [this page](/README.md).
