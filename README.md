# steep-getting-started

Suppose you have the following file:

```rb
class Object
  def numbers(up_to)
    (1...up_to).to_a
  end

  def only_multiples_of_3_or_5(numbers)
    numbers.map { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }
  end

  def sum_up(numbers)
    numbers.reduce(0) { |sum, it| sum + it }
  end
end

puts sum_up only_multiples_of_3_or_5 numbers 1000
```

## Procedure

Install gems and initialize steep:

```
bundle init
bundle add rbs
bundle add rbs-inline
bundle add steep
bundle exec steep init
```

Edit Sttepfile:

```rb
target :app do
  check "."
  signature "sig"

  # library "pathname"
end
```

Generate rbs file by `rbs prototype` command:

```
rbs prototype rb --out-dir=sig .
```

Copy type definitions from rbs file to rb file

```diff
diff --git a/euler001.rb b/euler001.rb
index f68ae60..8ccd8b5 100644
--- a/euler001.rb
+++ b/euler001.rb
@@ -1,12 +1,17 @@
+# rbs_inline: enabled
+
 class Object
+  #: (untyped up_to) -> untyped
   def numbers(up_to)
     (1...up_to).to_a
   end
 
+  #: (untyped numbers) -> untyped
   def only_multiples_of_3_or_5(numbers)
     numbers.map { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }
   end
 
+  #: (untyped numbers) -> untyped
   def sum_up(numbers)
     numbers.reduce(0) { |sum, it| sum + it }
   end
```

Clean up sig directory:

```
rm -fr sig
```

Create rbs file from rbs-inline comments:

```
bundle exec rbs-inline --output sig .
```

Edit rbs-inline comments:

```diff
diff --git a/euler001.rb b/euler001.rb
index 8ccd8b5..2ef2de3 100644
--- a/euler001.rb
+++ b/euler001.rb
@@ -1,17 +1,17 @@
 # rbs_inline: enabled

 class Object
-  #: (untyped up_to) -> untyped
+  #: (Integer up_to) -> Array[Integer]
   def numbers(up_to)
     (1...up_to).to_a
   end

-  #: (untyped numbers) -> untyped
+  #: (Array[Integer] numbers) -> Array[Integer]
   def only_multiples_of_3_or_5(numbers)
     numbers.map { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }
   end

-  #: (untyped numbers) -> untyped
+  #: (Array[Integer] numbers) -> Integer
   def sum_up(numbers)
     numbers.reduce(0) { |sum, it| sum + it }
   end
```

Regenerate rbs files:

```
bundle exec rbs-inline --output sig .
```
