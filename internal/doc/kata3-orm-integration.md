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

