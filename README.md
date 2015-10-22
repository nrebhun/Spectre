# Spectre

[![Build Status](http://img.shields.io/travis/kylef/Spectre/master.svg?style=flat)](https://travis-ci.org/kylef/Spectre)

[*Sp*ecial *E*xecutive for *C*ommand-line *T*est *R*unning and
*E*xecution](https://en.wikipedia.org/wiki/SPECTRE).

A behavior-driven development (BDD) framework and test runner for Swift projects
and playgrounds. It is Foundation-free and Linux-ready!


## Usage

```swift
describe("a person") {
  let person = Person(name: "Kyle")

  $0.it("has a name") {
    try expect(person.name) == "Kyle"
  }

  $0.it("returns the name as description") {
    try expect(person.description) == "Kyle"
  }
}
```

### Reporters

Spectre currently has two built-in reporters, Standard and the Dot reporter.
Custom reporters are supported, simply make a type that conforms to `Reporter`.

- Standard
- Dot Reporter (`-t`)
- Tap Reporter (`--tap)` - [Test Anything Protocol](http://testanything.org/)-compatible output

#### Standard

The standard reporter produces output as follows:

##### Passing Tests

![Standard Reporter Success](Screenshots/success.png)

##### Failing Tests

![Standard Reporter Failure](Screenshots/failure.png)

#### Dot

Using the `-t` argument, you can use the dot reporter.

##### Passing Tests

![Dot Reporter Success](Screenshots/success-dot.png)

##### Failing Tests

![Dot Reporter Failure](Screenshots/failure-dot.png)

### Expectation

#### Equivalence

```swift
try expect(name) == "Kyle"
try expect(name) != "Kyle"
```

#### Truthiness

```swift
try expect(alive).to.beTrue()
try expect(alive).to.beFalse()
try expect(alive).to.beNil()
```

#### Error handling

```swift
try expect(try write()).to.throw()
try expect(try write()).to.throw(FileError.NoPermission)
```

#### Causing a failure

```swift
throw failure("Everything is broken.")
```

#### Custom assertions

You can easily provide your own assertions, you just need to throw a
failure when the assertion does not meet expectaions.

## Examples

The following projects use Spectre:

| Project | CI |
| ------- | -- |
| [Inquiline](https://github.com/nestproject/Inquiline) | [![Build Status](http://img.shields.io/travis/nestproject/Inquiline/master.svg?style=flat)](https://travis-ci.org/nestproject/Inquiline) |
| [CardKit](https://github.com/kylef/CardKit) | [![Build Status](http://img.shields.io/travis/kylef/CardKit/master.svg?style=flat)](https://travis-ci.org/kylef/CardKit) |

## Installation / Running

### Conche

[Conche](https://github.com/kylef/Conche) build system has integrated support
for Spectre. You can simply add a `test_spec` to your Conche podspec depending
on Spectre and it will run your tests with `conche test`.

### Playground

You can use Spectre in an Xcode Playground, open `Spectre.playground` in
this repository, failures are printed in the console.

![Spectre in an Xcode Playground](Screenshots/Playground.png)

### Manually

You can build Spectre as a Framework or a library and link against it.

For example, if you clone Spectre and run `make` it will build a library you
can link against:

```shell
$ swiftc -I .conche/modules -L .conche/lib -lSpectre -o runner myTests.swift
$ ./runner
```
