# steep-getting-started

Initialize steep:

```
$ bundle add rbs
$ bundle add rbs-inline
$ bundle add steep
$ bundle exec steep init
```

Edit Sttepfile:

```
target :app do
  check "."
  signature "sig"

  # library "pathname"
end
```

Generate rbs file by `rbs prototype` command:

```
$ rbs prototype rb --out-dir=sig euler001.rb
```

Copy type definitions from rbs file to rb file

Clean up sig directory:

```
$ rm -fr sig
```

Create rbs file from rbs-inline comments:

```
$ bundle exec rbs-inline . --output sig
```