# steep-getting-started

Initialize steep:

```
$ bundle add rbs
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
