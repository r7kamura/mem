# Mem
Memoize any method call.

## Installation
```
gem install mem
```

## Usage
```
class Foo
  extend Mem

  def initialize
    @count = 0
  end

  def bar
    baz
  end

  # `memoize` defines bar_with_memoize & bar_without_memoize,
  # and the result of 1st method call is stored into @bar.
  memoize :bar

  private

  def baz
    @count += 1
  end
end

foo = Foo.new
foo.bar #=> 1
foo.bar #=> 1
foo.bar #=> 1
```
