# pipeline

A tool for managing Kanban boards with configurable columns. Will eventually
support adding/removing cards to/from columns, and moving cards between
columns.

General syntax:
```
$ ./pipeline <pipeline name> <command> <args>
```

This command will perform some `<command>` on the file `pipelines/<pipeline name>`.
The number and permitted values in `<args>` will depend on `<command>`.

In general, all commands will display the final state of the pipeline after
they finish running.

## Create Pipeline
```
$ ./pipeline kinnardsPipeline add todo "task 1"
--- todo
task 1
--- fortnight
--- today
--- done
```

The above command will modify the file `pipelines/kinnardsPipeline` from:
```
("todo")
("fortnight")
("today")
("done")
```

to:
```
("todo" "task 1")
("fortnight")
("today")
("done")
```

The general syntax for `add` is:
```
$ ./pipeline <pipeline name> add <column name> <item>
```

(Surround multi-word args in quotes as above.)

## Get Pipeline
## Create Item
## Get Item 
## Move Item
