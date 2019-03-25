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

# Kata Lesson 3: ORM Integration and In-Memory Testing

In this lesson, we will cover some of the Java and unit-testing integrations.

These lessons will be more showing examples vs. doing exercises due to time constraints. We aim to prepare fuller kata
exercises in future.

## Part 1: Unit test integration and translation

(Please run kata-files/lesson1/kata-step4.sh or .bat as a pre-requisite for this example)

The class ExampleDbUnitTest.java shows a unit test with Obevo. Note the APIs for doing
deployments and table verifications.

There is a twist - we do have the ability to do some translations of traditional DBMS
platforms to in-memory. As of this moment, here is the list. (DB2 and Sybase are more mature implementations
of the translation functionality).

| From       | To   |
|:-----------|:-----|
| DB2        | HSQL |
| DB2        | H2   |
| Sybase ASE | HSQL |
| Sybase ASE | H2   |
| PostgreSQL | HSQL |

For more information, see [here](https://goldmansachs.github.io/obevo/in-memory-db-testing.html). We are aiming
to post more design information as well on this.

In summary, the general implementation algorithm:
* Create user-defined types with the in-memory implementation whose name matches the traditional DBMS (e.g. create a TEXT field as VARCHAR(255))
* Enabling any translation functionalities in the in-memory platform (though these are never 100%)
* Leveraging some basic ASTs to remove any complex SQLs after CREATE TABLE or column statements

To try out this functionality in action:

1) Modify Account.sql to add "with oids" at the end of the CREATE TABLE statement.
This is a PostgreSQL-specific SQL statement.

```
create table Account (
    ...
) with oids
GO

```


2) Run ExampleDbUnitTest using system-config-hsql.xml as the input. This defines an original HSQLDB
implementation, and thus you'll see the test fail as there is no translation invoked.

3) Now change ExampleDbUnitTest to specify system-config-postgresql.xml as the input and rerun the test.
You will see that it passes.


## Part 2: Hibernate Reverse-Engineering

Let's now dive into an example using Hibernate. Similar to how we implemented reverse-engineering from an existing
database, we can reverse-engineer from a Hibernate model as well.

Run HibernateRevengExample.java to try this out.
* Can work with Hibernate 3, 4, or 5
* Can work with annotated Java class or a config read from a file
* Can work with Envers

We've configured the example to write the generated DDLs to src/main/database/lesson/orm

* You can run HibernateTest.java to try out such a test.
* Our example Java model is in src/main/java and the obevo.lesson.orm package
* The sample model is similar in function to the model in Lesson 1
 


## Part 3: Validating changes to a model with the baselining feature

Though we can reverse-engineer directly from a Hibernate model, we do not want that reverse-engineering
to directly overwrite a file maintained for deployment, as that violates the rule we have around not
modifying stateful //// CHANGE entries. However, a Hibernate model may change, and we'd want those changes
reflected in our model. Is there a way to enforce this lookup?

We can do this w/ leveraging .baseline files and the BaselineValidator API.

The baseline file represents the "latest"/"full" version of the DDL that we should compare the
full content of the //// CHANGE entries against.
* We can do this on a per-object basis; no need to do it on an all-or-nothing basis

To enable this:
* Create a .baseline file that has the latest version
* Run the BaselineValidator API and ensure that you have no breaks.
* OrmLessonPart3.java has an example of this usage.


Let's try this out on an example in our code:

1) Add a new field "nickname" to the Hibernate model

```
public class Person {
    // ...

    @Column(name = "nickname")
    private String nickname;

    // ...
```

2) Run OrmLessonPart3.java, and you should see some breaks emitted.

Inspect Person.sql and Person.baseline.sql to see the differences: Person.baseline.sql will have the nickname field

```
ObjectCompareBreak[objectCompareBreakSide=RIGHT,compareSubject=DaColumnImpl[column=PUBLIC.COMPANY.PERSON.FIELD]]
ObjectCompareBreak[objectCompareBreakSide=RIGHT,compareSubject=DaColumnImpl[column=PUBLIC.COMPANY.PERSON_AUD.FIELD]]
```

3) Add the nickname field to Person.sql to get it in sync

```
//// CHANGE name=field
alter table Person
       add column field varchar(255)
GO

//// CHANGE name=field_AUD
alter table Person_AUD
       add column field varchar(255)
GO
```

4) Rerun OrmLessonPart3.java - you should see no breaks

For more information, see the documentation on [ORM DDL Generation](https://goldmansachs.github.io/obevo/orm-integration.html)
and [Baseline DDL Validation](https://goldmansachs.github.io/obevo/baseline-validation.html).

In the kata example, we have left in a break on-purpose in TABLE_B so that you can see these feature
first-hand (the error looks like the snippet below). Give it a shot to fix this (i.e. add an ALTER
command on TABLE_B to get it in line with the baseline)
