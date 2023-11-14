# Rust Notes

Rust language programming notes and references.

Table of Contents:

* [Frameworks and Libraries](#frameworks-and-libraries)
* [The Rust Programming Language](#the-rust-programming-language)
  * [Overview](#overview)
  * [Installing](#installing)
  * [Styles](#styles)
  * [Rust Files](#rust-files)
  * [Variables](#variables)
  * [Data Types](#data-types)
  * [Operators](#operators)
  * [Functions](#functions)
  * [Comments](#comments)
  * [Control Flow](#control-flow)
  * [Ownership](#ownership)
  * [Struct](#struct)
  * [Enums](#enums)
  * [Modules](#modules)
  * [Generics and Traits](#generics-and-traits)
  * [Testing](#testing)

## Frameworks and Libraries

### Web Frameworks

* [State of Rust Web Frameworks (Server, DB)](https://dev.to/readredready/state-of-rust-web-frameworks-server-3g42)
* [Web Development Frameworks](https://www.arewewebyet.org/topics/frameworks/)

### Crates of Interest

* [SQLx](https://github.com/launchbadge/sqlx) - Database driver.
* [Actix](https://actix.rs/) - Rust's powerful actor system and most fun web framework.
* [Tide](https://blog.yoshuawuyts.com/tide/) - Fast and friendly HTTP server framework for async Rust.
* [Warp](https://github.com/seanmonstar/warp) - A super-easy, composable, web server framework for warp speeds.
* [Tower-Web](https://github.com/carllerche/tower-web) - A fast, boilerplate free, web framework for Rust.
* [Rocket](https://rocket.rs/) - Rocket is a web framework for Rust.
* [Rouille](https://github.com/tomaka/rouille) - Rust web micro-framework.

## The Rust Programming Language

The following notes have been taken from the excellent resource called [The Rust Programming Language](https://doc.rust-lang.org/book/title-page.html).

### Overview

Rust is an expression-based language:

* Statements are instructions that perform some action and do not return a value.
* Expressions evaluate to a resulting value and do not include ending semicolons.
* If you add a semicolon to the end of an expression, you turn it into a statement.

```rust
// Statement
let x = 5;
// Expression (no semicolon)
x + 1
// Statement with an expression
let y = x + 2;
```

### Installing

Uses a command called `rustup`:

```bash
curl https://sh.rustup.rs -sSf | sh
```

To upgrade:

```bash
rustup update
```

To compile a source code file:

```bash
rustc main.rs
```

To create a new project:

```bash
cargo new project_name
```

To configure a project:

Following is an example of a __Cargo.toml__ configuration file:

```toml
[package]
name = "hello_cargo"
version = "0.1.0"
authors = ["Your Name <you@example.com>"]
edition = "2018"

[dependencies]
rand = "0.5.5"
```

To build a project:

```bash
cargo build
```

To run a project:

```bash
cargo run
```

To see if your code will compile:

```bash
cargo check
```

To build a release version of your application:

```bash
cargo build --release
```

### Styles

Rust uses the following style points:

* Snake case for function and variable names (an_example_of_snake_case).
* Four spaces for tabs.
* Use `rustfmt` to standardize on code style.

### Rust Files

Following is the guessing game from the [The Rust Programming Language](https://doc.rust-lang.org/book/title-page.html)
for reference:

```rust
use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1, 101);

    loop {
        println!("Please input your guess.");

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed: {}", guess);

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
```

Bring types into scope:

```rust
use std::io;
use std::cmp::Ordering;
use rand::Rng;
```

_Note: The [prelude](https://doc.rust-lang.org/std/prelude/index.html) is the list of things that Rust automatically imports into every Rust program._

Rust requires a `main` entry point:

```rust
fn main() {

}
```

Using an external type:

```rust
use rand::Rng;

fn main() {
    let random_number = rand::thread_rng().gen_range(1, 101);
    println!("{}", random_number)
}
```

### Variables

By default variables are immutable.

Declare variables with either `let` or `const`:

```rust
let x = 4;
const MAX_SIZE: u32 = 100_000;
```

Constants or `const` variables:

* Are always immutable.
* Must be annotated.
* Can't use `mut` with them (see next section).
* Can be declared in any scope including global.
* Can only be set by a constant expression (not computed at runtime).

You can make variables mutable by adding `mut` in front of the variable name:

```rust
let mut x = 5;
x = 6;
```

You can shadow variables by re-using the variable name with the let keyword.
Shadowing enables changing the type assigned to the variable name:

```rust
let x = 5;
let x = format!("{}", 5);
```

### Data Types

The compiler can usually infer what type we want to use based on the value and how we use it.

#### Scalar Types

A scalar type represents a single value. Rust supports four primary scalar types.

##### Integers

Rust performs two’s complement wrapping. Values greater than the maximum value the type can hold “wrap around”
to the minimum of the values the type can hold:

```rust
let x: i32 = -1000;
```

Sizes:

|Length|Signed|Unsigned|
|-|-|-|
|8-bit|i8|u8|
|16-bit|i16|u16|
|32-bit|i32|u32|
|64-bit|i64|u64|
|128-bit|i128|u128|
|CPU Arch|isize|usize|

Notation:

|Number Literals|Example|
|-|-|
|Decimal|56_989|
|Hex|0xff|
|Octal|0o77|
|Binary|0b1111_0000|
|Byte (u8 only)|b'A'|

##### Floating-point Numbers

Rust has two primitive types for floating-point numbers:

* `f64` which is the default.
* `f32`

```rust
let x: f32 = 199.99;
```

##### Boolean

Boolean `true` or `false` specified with the keyword `bool`:

```rust
let x: bool = true;
```

##### Character

The character type is four bytes in size and represents a Unicode Scalar Value.

Character literals are specified with single quotes:

```rust
let x = 'X';
```

#### Compound Types

Compound types can group multiple values into one type. Rust has two primitive compound types.

##### Tuple

A tuple is a general way of grouping together a number of values with a variety of types into one compound type.

Tuples are created by writing a comma-separated list of values inside parentheses:

```rust
let tup: (i32, f64, u8) = (500, 6.4, 1);
// Pattern matching
let (x, y, z) = tup;
// Period access
let x = tup.0;
let y = tup.1;
let z = tup.2;
```

##### Array

Every element of an array must have the same type and they are of a fixed length:

```rust
let a = [1,2,3,4,5];
// With type and length
let a: [i32; 5] = [1,2,3,4,5];
// Initialize array with the number three and a length of five
let a = [3, 5];
```

Array elements can be accessed using indexing:

```rust
let a = [1,2,3,4,5];
let first = a[0];
let second = a[1];
```

If you access an element in an array past its length, Rust will panic.

### Operators

The following numeric operators are supported:

|Operation|Symbol|Example|
|-|-|-|
|Addition|`+`|`5 + 10`|
|Subtraction|`-`|`95.5 - 4.3`|
|Multiplication|`*`|`4 * 30`|
|Division|`/`|`56.7 / 32.2`|
|Remainder|`%`|`43 % 5`|

### Functions

Function definitions in Rust start with fn and have a set of parentheses after the function name.

Parameter or argument types are defined in the function signature.

Rust doesn’t care where you define your functions, only that they’re defined somewhere.

Function return types are declared after an arrow `->`.

The return value is the value of the final expression.

The `return` keyword can also return a value and exit the function early.

```rust
fn main() {
    let x = five()
    let y = plus_one(x)
    print_values(x, y);
}

fn print_values(x: i32, y: i32) {
    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);
}

fn five() -> i32 {
    5
}

fn plus_one(x: i32) -> i32 {
    x + 1
}
```

### Comments

```rust
// Comment with two back slashes.
// There is no block comment, just use multiple line comments.
Let x = 5; // Comments can be on the same line as statements or expressions.
```

### Control Flow

#### `if` Expressions

Condition in `if` expressions must evaluate to a boolean.

Blocks of code associated with the conditions in `if` expressions are sometimes called arms.

```rust
fn main() {
    let number = 6;

    if number % 4 == 0 {
        println!("number is divisible by 4");
    } else if number % 3 == 0 {
        println!("number is divisible by 3");
    } else if number % 2 == 0 {
        println!("number is divisible by 2");
    } else {
        println!("number is not divisible by 4, 3, or 2");
    }
}
```

Because `if` is an expression it will return a value.

The arms of the `if` expression must return the same type.

```rust
fn main() {
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!("The value of number is: {}", number);

    // Error: if and else have incompatible types
    let unknown = if condition { 5 } else { "string" }
}
```

#### Loop

A continuous loop:

```rust
fn main() {
    loop {
        println!("again!");
    }
}
```

Returning values from loops:

```rust
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!("The result is {}", result);
}
```

An example of a `while` loop:

```rust
fn main() {
    let mut number = 3;

    while number != 0 {
        println!("{}!", number);

        number -= 1;
    }

    println!("LIFTOFF!!!");
}
```

An example of a `for` loop:

```rust
fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a.iter() {
        println!("the value is: {}", element);
    }
}
```

An example using a [Range](https://doc.rust-lang.org/std/ops/struct.Range.html) in a for loop:

```rust
fn main() {
    for number in (1..4).rev() {
        println!("{}!", number);
    }
    println!("LIFTOFF!!!");
}
```

### Ownership

Ownership enables Rust to make memory safety guarantees without needing a garbage collector.

Ownership rules:

* Each value in Rust has a variable that's called its __owner__.
* There can only be one owner at a time.
* When the owner goes out of scope, the value will be dropped.

Scope example:

```rust
// String pushed onto the stack
{                      // s is not valid here, it’s not yet declared
    let s = "hello";   // s is valid from this point forward

    // do stuff with s
}                      // this scope is now over, and s is no longer valid

// String allocated on the heap
{
    let s = String::from("hello"); // s is valid from this point forward

    // do stuff with s
}                                  // this scope is now over, and s is no
                                   // longer valid and "drop" is called
```

Simple values are stored on the stack and can easily be copied:

```rust
let x = 5;
let y = x;
```

Complex values are stored on the heap and, following rule number 2 above, can only have one owner:

```rust
let s1 = String::from("hello");
let s2 = s1; // This is a move, not a copy
// s1 is no longer valid and cannot be used
```

Complex types can be cloned:

```rust
let s1 = String::from("hello");
let s2 = s1.clone();
// s1 is still valid
```

As a general rule, any group of simple scalar values can be Copied.

* All the integer types, such as `u32`.
* The Boolean type, bool, with values `true` and `false`.
* All the floating point types, such as `f64`.
* The character type, `char`.
* Tuples, if they only contain types that are also Copy. For example, `(i32, i32)` is Copy, but `(i32, String)` is not.

Passing a variable to a function will move or copy, just as assignment does:

```rust
fn main() {
    let s = String::from("hello");  // s comes into scope

    takes_ownership(s);             // s's value moves into the function...
                                    // ... and so is no longer valid here

    let x = 5;                      // x comes into scope

    makes_copy(x);                  // x would move into the function,
                                    // but i32 is Copy, so it’s okay to still
                                    // use x afterward

} // Here, x goes out of scope, then s. But because s's value was moved, nothing
  // special happens.

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("{}", some_string);
} // Here, some_string goes out of scope and `drop` is called. The backing
  // memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("{}", some_integer);
} // Here, some_integer goes out of scope. Nothing special happens.
```

Returning values from a function can also transfer ownership:

```rust
fn main() {
    let s1 = gives_ownership();         // gives_ownership moves its return
                                        // value into s1

    let s2 = String::from("hello");     // s2 comes into scope

    let s3 = takes_and_gives_back(s2);  // s2 is moved into
                                        // takes_and_gives_back, which also
                                        // moves its return value into s3
} // Here, s3 goes out of scope and is dropped. s2 goes out of scope but was
  // moved, so nothing happens. s1 goes out of scope and is dropped.

fn gives_ownership() -> String {             // gives_ownership will move its
                                             // return value into the function
                                             // that calls it

    let some_string = String::from("hello"); // some_string comes into scope

    some_string                              // some_string is returned and
                                             // moves out to the calling
                                             // function
}

// takes_and_gives_back will take a String and return one
fn takes_and_gives_back(a_string: String) -> String { // a_string comes into
                                                      // scope

    a_string  // a_string is returned and moves out to the calling function
}
```

#### References and Borrowing

References allow you to refer to some value without taking ownership of it.

References are immutable by default.

Rules of references:

* At any given time, you can have either one mutable reference or any number of immutable references.
* References must always be valid.

The ampersands in the code below define references:

```rust
fn main() {
    let s1 = String::from("hello");

    // The `&s1` syntax lets us create a reference that refers to the value of s1 but does not own it.
    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len()
} // Here, s goes out of scope. But because it does not have ownership of what
  // it refers to, nothing happens.
```

Using references as function parameters is called borrowing.

References can be changed to be mutable:

```rust
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

You can have only one mutable reference to a particular piece of data in a particular scope.

This restriction allows for mutation but in a very controlled fashion.

The benefit of having this restriction is that Rust can prevent data races at compile time. A data race is similar to a race condition and happens when these three behaviors occur:

* Two or more pointers access the same data at the same time.
* At least one of the pointers is being used to write to the data.
* There’s no mechanism being used to synchronize access to the data.

You can work around this restriction using curly brackets to create a new scope:

```rust
let mut s = String::from("hello");

{
    let r1 = &mut s;
} // r1 goes out of scope here, so we can make a new reference with no problems.

let r2 = &mut s;
```

You cannot have a mutable reference while we have an immutable one:

```rust
let mut s = String::from("hello");

let r1 = &s; // Immutable reference: no problem
let r2 = &s; // Immutable reference: no problem
let r3 = &mut s; // Mutable reference: BIG PROBLEM

println!("{}, {}, and {}", r1, r2, r3); // Mutable with immutable!!!
```

The following example works with a mix of immutable references and
a mutable reference:

```rust
let mut s = String::from("hello");

let r1 = &s; // no problem
let r2 = &s; // no problem
println!("{} and {}", r1, r2);
// r1 and r2 are no longer used after this point

let r3 = &mut s; // no problem
println!("{}", r3);
```

In Rust the compiler guarantees that references will never be dangling references:

```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String { // dangle returns a reference to a String

    let s = String::from("hello"); // s is a new String

    &s // we return a reference to the String, s
} // Here, s goes out of scope, and is dropped. Its memory goes away.
  // Danger! Rust wont let you do this.
```

#### Slice Type

Slices let you reference a contiguous sequence of elements in a collection rather than the whole collection.

A string slice is a reference to part of a String, and it looks like this:

```rust
let s = String::from("hello world");

let hello = &s[..5]; // Range supports dropping the first index if starting at 0
let world = &s[6..11];
let remainder = &s[12..]; // Range supports dropping the last index if it is the length
let full = &s[..] // This is a slice of the entire string
```

The type that signifies “string slice” is written as `&str`:

```rust
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}
```

Better still, write the signature above using the following signature
because it allows us to use the same function on both &String values and &str values:

```rust
fn main() {
    let my_string = String::from("hello world");

    // first_word works on slices of `String`s
    let word = first_word(&my_string[..]);

    let my_string_literal = "hello world";

    // first_word works on slices of string literals
    let word = first_word(&my_string_literal[..]);

    // Because string literals *are* string slices already,
    // this works too, without the slice syntax!
    let word = first_word(my_string_literal);
}

// Note the change from &String to &str
fn first_word(s: &str) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}
```

Array slices work the same way:

```rust
let a = [1, 2, 3, 4, 5];

let slice = &a[1..3];
```

### Struct

A struct, or structure, is a custom data type that lets you name and package together multiple related values that make up a meaningful group.

An example to define and use a struct:

```rust
// Define the User struct
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

// Create an instance of the User struct
// Note that the entire instance must be mutable
let mut user1 = User {
    email: String::from("someone@example.com"),
    username: String::from("someusername123"),
    active: true,
    sign_in_count: 1,
};

user1.email = String::from("anotheremail@example.com");

// As a constructor function
// Using the field init shorthand syntax
fn build_user(email: String, username: String) -> User {
    User {
        email,
        username,
        active: true,
        sign_in_count: 1,
    }
}

// Using the struct update syntax to copy user1 details
let user2 = User {
    email: String::from("another@example.com"),
    username: String::from("anotherusername567"),
    ..user1
};
```

Tuple structs have the added meaning that the struct name provides but don’t have names associated with their fields:

```rust
struct Color(i32, i32, i32);
struct Point(i32, i32, i32);

let black = Color(0, 0, 0);
let origin = Point(0, 0, 0);
```

To print a struct use the `#[derive(Debug)]` annotation:

```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };

    println!("rect1 is {:?}", rect1);  // One line
    println!("rect1 is {:#?}", rect1); // Multiple lines
}
```

A full example using a struct:

```rust
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };

    println!(
        "The area of the rectangle is {} square pixels.",
        area(&rect1)
    );
}

fn area(rectangle: &Rectangle) -> u32 {
    rectangle.width * rectangle.height
}
```

Methods are different from functions in that they’re defined within the context of a struct, and their first parameter is always self, which represents the instance of the struct the method is being called on.

Defining a method and an associated function on a struct:

```rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

// Uses `self` reference
impl Rectangle {
    // Method using self
    fn area(&self) -> u32 {
        self.width * self.height
    }

    // Another method with an extra parameter
    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }

    // Associated function (does not use self)
    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size,
        }
    }
}

fn main() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };
    let rect2 = Rectangle {
        width: 10,
        height: 40,
    };
    let rect3 = Rectangle {
        width: 60,
        height: 45,
    };

    println!(
        "The area of the rectangle is {} square pixels.",
        rect1.area()
    );
    println!("Can rect1 hold rect2? {}", rect1.can_hold(&rect2));
    println!("Can rect1 hold rect3? {}", rect1.can_hold(&rect3));

}
```

### Enums

Without associated values:

```rust
enum IpAddrKind {
    V4,
    V6,
}

struct IpAddr {
    kind: IpAddrKind,
    address: String,
}

let home = IpAddr {
    kind: IpAddrKind::V4,
    address: String::from("127.0.0.1"),
};

let loopback = IpAddr {
    kind: IpAddrKind::V6,
    address: String::from("::1"),
};
```

With associated values and no need for a struct:

```rust
// Using a string
enum IpAddr {
    V4(String),
    V6(String),
}

let home = IpAddr::V4(String::from("127.0.0.1"));

let loopback = IpAddr::V6(String::from("::1"));

// Using integers and string
enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

let home = IpAddr::V4(127, 0, 0, 1);

let loopback = IpAddr::V6(String::from("::1"));
```

Enums can have methods defined on them:

```rust
impl Message {
    fn call(&self) {
        // method body would be defined here
    }
}

let m = Message::Write(String::from("hello"));
m.call();
```

Rust does not support `null`. This was a deliberate design decision for Rust to limit null’s pervasiveness and increase the safety of Rust code.

There is an `Option<T>` enum from the standard library that can encode the concept of a value being present or absent. It is so popular you don't need to bring it into scope:

```rust
// The definition from the standard library
enum Option<T> {
    Some(T),
    None,
}

// Using the Option enum with no need to bring Some or None into scope
let some_number = Some(5);
let some_string = Some("a string");
let absent_number: Option<i32> = None;
```

#### match Operator

The `match` operator allows you to compare a value against a series of patterns and then execute code
based on which pattern matches:

```rust
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}

// An alternative with a `state` variable
fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!("State quarter from {:?}!", state);
            25
        }
    }
}
```

Using `match` with `Option`:

```rust
fn main() {
    fn plus_one(x: Option<i32>) -> Option<i32> {
        match x {
            None => None,
            Some(i) => Some(i + 1),
        }
    }

    let five = Some(5);
    let six = plus_one(five);
    let none = plus_one(None);
}
```

The `match` operator supports the `_` pattern to match all other values:

```rust
fn main() {
    let some_u8_value = 0u8;
    match some_u8_value {
        1 => println!("one"),
        3 => println!("three"),
        5 => println!("five"),
        7 => println!("seven"),
        _ => (),
    }
}
```

#### if let

Think of `if let` as syntax sugar for a `match` that runs code when the value matches one pattern and then ignores all other values.

```rust
// Using `match` to count non-quarter coins
let mut count = 0;
match coin {
    Coin::Quarter(state) => println!("State quarter from {:?}!", state),
    _ => count += 1,
}

// Same using `if let`
let mut count = 0;
if let Coin::Quarter(state) = coin {
    println!("State quarter from {:?}!", state);
} else {
    count += 1;
}
```

### Modules

Package rules:

* Must contain at least one library or binary crate.
* Only supports one library crate, no more.
* Can contain as many binary crates as you would like.

Modules:

* Define Rust’s privacy boundary.
* Group related definitions together and name why they’re related.
* Define a module using the `mod` keyword.
* Modules are private by default.
* Use the `pub` keyword to define public resources.
* Structs are private by default.
* Enums are public by default

Cargo uses the following convention:

* `src/main.rs` for a binary crate.
* `src/bin` directory for multiple binary crates.
* `src/lib.rs` for a library crate.

Here is an example of a library crate:

```rust
// File: src/lib.rs
mod front_of_house {
    // `pub` exposes `hosting` and `add_to_waitlist` to `eat_at_restaurant` below
    pub mod hosting {
        pub fn add_to_waitlist() {}

        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}
        fn serve_order() {}
        fn take_payment() {}
        mod back_of_house {
            pub enum Appetizer {
                Soup,
                Salad,
            }
            fn fix_incorrect_order() {
                cook_order();
                // `super` references the parent module like `..` does on a file system.
                super::serve_order();
            }
            fn cook_order() {}

            // Exposing a struct
            pub struct Breakfast {
                pub toast: String,
                seasonal_fruit: String,
            }

            impl Breakfast {
                pub fn summer(toast: &str) -> Breakfast {
                    Breakfast {
                        toast: String::from(toast),
                        seasonal_fruit: String::from("peaches"),
                    }
                }
            }
        }
    }
}
// Resulting module tree
// crate
//  ├── front_of_house
//  │   ├── hosting
//  │   │   ├── add_to_waitlist
//  │   │   └── seat_at_table
//  │   └── serving
//  │       ├── take_order
//  │       ├── serve_order
//  │       ├── take_payment
//  │       └── back_of_house
//  │           ├─ fix_incorrect_order
//  │           └── cook_order
//  └── eat_at_restaurant

// Public function
pub fn eat_at_restaurant() {
    // Absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Relative path
    front_of_house::hosting::add_to_waitlist();

    // Order a breakfast in the summer with Rye toast
    let mut meal = back_of_house::Breakfast::summer("Rye");
    // Change our mind about what bread we'd like
    meal.toast = String::from("Wheat");
    println!("I'd like {} toast please", meal.toast);

    // The next line won't compile if we uncomment it; we're not allowed
    // to see or modify the seasonal fruit that comes with the meal
    // meal.seasonal_fruit = String::from("blueberries");

    // Using the public enum
    let order1 = back_of_house::Appetizer::Soup;
    let order2 = back_of_house::Appetizer::Salad;
}
```

Declare a module with only a semicolon after `mod` rather than using a block, tells Rust to load the contents of the module from another file with the same name as the module:

```rust
// src/main.rs
mod other_file;
```

The `use` keyword saves us from using long absolute or relative paths.

Rules for the path `use` keyword:

* Use the parent path for functions.
* Use the full path for enums and structs.

```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

// Only bring the parent module into scope. Not the function. Saves confusion.
use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
}
```

You can bring two modules into the same scope with the same name using the `as` keyword:

```rust
use std::fmt::Result;
use std::io::Result as IoResult;

fn function1() -> Result {
    // --snip--
}

fn function2() -> IoResult<()> {
    // --snip--
}
```

You can re-export by combining `pub` and `use` to bring an item into scope making that item available for others:

```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
}
```

Other examples of the `use` keyword:

```rust
// Single `use` statements
use rand::Rng;
use std::cmp::Ordering;
use std::io;

// Equivelant using nested paths
use rand::Rng;
use std::{cmp::Ordering, io};

// We can bring `io` and `Write` into scope
use std::io;
use std::io::Write;

// Using one statement with the `self` keyword
use std::io::{self, Write};

// We could also bring all public items into scope
// Glob can make it harder to tell what names are in scope
use std::collections::*;
```

### Generics and Traits

Because Rust compiles generic code into code that specifies the type in each instance, we pay no runtime cost for using generics. When the code runs, it performs just as it would if we had duplicated each definition by hand. The process of monomorphization makes Rust’s generics extremely efficient at runtime.

Defining a function that uses generics:

```rust
fn largest<T>(list: &[T]) -> T {
    let mut largest = list[0];

    for &item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest(&char_list);
    println!("The largest char is {}", result);
}
```

Define `structs` to use a generic type parameter:

```rust
struct Point<T> {
    x: T,
    y: T,
}

fn main() {
    let integer = Point { x: 5, y: 10 };
    let float = Point { x: 1.0, y: 4.0 };
}
```

Define a Point `struct` where `x` and `y` are both generics but could have different types:

```rust
struct Point<T, U> {
    x: T,
    y: U,
}

fn main() {
    let both_integer = Point { x: 5, y: 10 };
    let both_float = Point { x: 1.0, y: 4.0 };
    let integer_and_float = Point { x: 5, y: 4.0 };
}
```

Define `enums` to hold generic data types in their variants:

```rust
enum Option<T> {
    Some(T),
    None,
}
```

Define `enums` to use multiple generic types:

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

Implement methods on `structs` and `enums` and use generic types:

```rust
struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }
}

// The mixup method supports multiple Point types
impl<T, U> Point<T, U> {
    fn mixup<V, W>(self, other: Point<V, W>) -> Point<T, W> {
        Point {
            x: self.x,
            y: other.y,
        }
    }
}

fn main() {
    let p = Point { x: 5, y: 10 };

    println!("p.x = {}", p.x());

    let p1 = Point { x: 5, y: 10.4 };
    let p2 = Point { x: "Hello", y: 'c' };

    let p3 = p1.mixup(p2);
}
```

#### Traits

We can implement a trait on a type only if either the trait or the type is local to our crate.

```rust
pub trait Summary {
    fn summarize(&self) -> String;
}

pub struct NewsArticle {
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub retweet: bool,
}

impl Summary for Tweet {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }
}
```

We can define a default implementation for the `summarize` method:

```rust
pub trait Summary {
    fn summarize(&self) -> String {
        String::from("(Read more...)")
    }
}

// No need to implement summarize
impl Summary for NewsArticle {}
```

To use this version of `Summary`, we only need to define `summarize_author` when we implement the trait on a type:

```rust
pub trait Summary {
    fn summarize_author(&self) -> String;

    fn summarize(&self) -> String {
        format!("(Read more from {}...)", self.summarize_author())
    }
}

impl Summary for Tweet {
    fn summarize_author(&self) -> String {
        format!("@{}", self.username)
    }
}
```

To define traits as parameters:

```rust
// Using the `impl trait` syntax
pub fn notify(item: &impl Summary) {
    println!("Breaking news! {}", item.summarize());
}

pub fn notify(item1: &impl Summary, item2: &impl Summary) {
    println!("Breaking news! {}", item2.summarize());
}

// Or using `trait bound` syntax
pub fn notify<T: Summary>(item: &T) {
    println!("Breaking news! {}", item.summarize());
}

// This is forcing item1 and item2 to be the same type or T
pub fn notify<T: Summary>(item1: &T, item2: &T) {
    println!("Breaking news! {}", item2.summarize());
}

// Multiple trait bounds using the `+` syntax
pub fn notify(item: &(impl Summary + Display)) {}
pub fn notify<T: Summary + Display>(item: &T) {}

// Using the `where` clause to simplify the signature
fn some_function<T, U>(t: &T, u: &U) -> i32
    where T: Display + Clone,
          U: Clone + Debug
{}
```

Returning types that implement traits:

```rust
// You can only return impl Trait if you’re returning a single type
fn returns_summarizable() -> impl Summary {
    Tweet {
        username: String::from("horse_ebooks"),
        content: String::from(
            "of course, as you probably already know, people",
        ),
        reply: false,
        retweet: false,
    }
}
```

Example using the `largest` function:

```rust
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];

    for &item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest(&char_list);
    println!("The largest char is {}", result);
}
```

Using trait bounds to conditionally implement methods:

```rust
use std::fmt::Display;

struct Pair<T> {
    x: T,
    y: T,
}

impl<T> Pair<T> {
    fn new(x: T, y: T) -> Self {
        Self { x, y }
    }
}

impl<T: Display + PartialOrd> Pair<T> {
    fn cmp_display(&self) {
        if self.x >= self.y {
            println!("The largest member is x = {}", self.x);
        } else {
            println!("The largest member is y = {}", self.y);
        }
    }
}
```

#### Lifetimes

Lifetime annotations in function signatures:

```rust
// Input lifetimes
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```

Lifetime annotations in struct definitions:

```rust
// Input lifetimes
struct ImportantExcerpt<'a> {
    part: &'a str,
}

fn main() {
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().expect("Could not find a '.'");
    let i = ImportantExcerpt {
        part: first_sentence,
    };
}
```

Lifetime annotations in method definitions:

```rust
impl<'a> ImportantExcerpt<'a> {
    fn level(&self) -> i32 {
        3
    }
}

impl<'a> ImportantExcerpt<'a> {
    fn announce_and_return_part(&self, announcement: &str) -> &str {
        println!("Attention please: {}", announcement);
        self.part
    }
}
```

Static lifetime:

```rust
let s: &'static str = "I have a static lifetime.";
```

Generic type parameters, trait bounds, and lifetimes all in one function:

```rust
use std::fmt::Display;

fn longest_with_an_announcement<'a, T>(
    x: &'a str,
    y: &'a str,
    ann: T,
) -> &'a str
where
    T: Display,
{
    println!("Announcement! {}", ann);
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```

### Testing

Running tests:

* Use `cargo test` to run tests in Rust.
* Use `cargo test full_fn_name` to filter to a single test.
* Use `cargo test part_fn_name` to filter to multiple tests that match the part name.
* Use `cargo test -- --show-output` to see `println` messages in passing tests.
* Use `cargo test -- --ignored` to run `#[ignore]` tests.

Tests are defined using attributes:

* The `#[cfg(test)]` annotation tells Rust to compile and run the test code only when you run cargo test.
* The `#[test]` attribute indicates a test function.
* The `#[should_panic]` attribute indicates a test function that should panic.
* Use the optional `expected` parameter eg: `#[should_panic(expected = "Expected panic message here.")]`
* Use `#[ignore]` attribute to ignore expensive tests.
* In libraries, private functions can be tested by bringing them into scope.

Integration tests:

* Defined in a `tests` directory next to the `src` directory.
* Do not need the `#[cfg(test)]` annotation.
* Helper functions get defined in a file structure similar to `/tests/common/mod.rs`.

The standard library provides assertion macros:

* `assert` for boolean expressions.
* `assert_eq` for value comparison.
* `assert_ne` for not equal value comparison.
* Arguments specified after the required arguments are passed to the `format!` macro.

Common operators in tests include `==` and `!=` for comparison.

Values being compared must implement the `PartialEq` and `Debug` traits:

* Implement `PartialEq` to assert that values of those types are equal or not equal.
* Implement `Debug` to print the values when the assertion fails.
* Add the `#[derive(PartialEq, Debug)]` annotation to your `struct` or `enum` definition.

```rust
pub fn add_two(a: i32) -> i32 {
    a + 2
}

pub fn greeting(name: &str) -> String {
    String::from("Hello!")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    fn another() {
        panic!("Make this test fail");
    }
    #[test]
    fn it_adds_two() {
        assert_eq!(4, add_two(2));
    }

    #[test]
    fn greeting_contains_name() {
        let result = greeting("Carol");
        assert!(
            result.contains("Carol"),
            "Greeting did not contain name, value was `{}`",
            result
        );
    }

    #[test]
    #[should_panic]
    fn greater_than_100() {
        // Statements that should panic
    }

    #[test]
    #[should_panic(expected = "Guess value must be less than or equal to 100")]
    fn greater_than_100() {
        // Statements that should panic
    }

}
```

Using the `Result<T, E>` in tests. You can’t use the `#[should_panic]` annotation on tests that use `Result<T, E>`. Instead, you should return an `Err` value directly when the test should fail:

```rust
#![allow(unused_variables)]
fn main() {
    #[cfg(test)]
    mod tests {
        #[test]
        fn it_works() -> Result<(), String> {
            if 2 + 2 == 4 {
                Ok(())
            } else {
                Err(String::from("two plus two does not equal four"))
            }
        }
    }
}
```
