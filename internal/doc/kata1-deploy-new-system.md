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

## Steps 2 and 3 - Modifying a schema
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

## Step 3 In-Depth - Maven plugin for testing, and validating changes against a baseline

In the kata step3, we demonstrate the baseline feature. This is optional and is not used in your actual
DB deployments, but is used to help validate your schema.

For which use case would you typically use this?
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



## That's it! Onto the next lesson

Lesson 1 showed you how to deploy a brand new schema.

But you may have an existing schema that you want to onboard. For an idea of how that process goes, please go
to [Lesson 2](kata2-reverse-engineering.md).
