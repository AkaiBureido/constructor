# Construct

The automated directory structure creator tool.

## Installation

Add this line to your application's Gemfile:

    gem 'Construct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Construct

## Usage

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

