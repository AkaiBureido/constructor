## Construct - the automated directory structure creator tool

```bash
$ construct [template name] {--template-parameters=<value>}
```

Inside the `.construct` folder you will put your templates.

Example of construct directory:

```text
.construct/html
|-html5/
|-|-Templates/
|-|-|-plain.template.html
|-|-bootstrap/
|-|-|-{..files..}
|-ruby
|-|-Templates/
|-|-gem
|-|-|-Templates/
|-|-|-plain
....
...
..
.
```

As you see the name of the template is simply the relative path from .construct
root. You can either have files that reference templates or directories with set
of files. For I only process the template files.

```bash
$ construct html5/bootstrap
$ construct ruby/gem/plain --project_name="MyFuzzyGem"
```
