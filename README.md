# dutch-numbers
Numeric datatypes built from scratch

As a self-development exercise, I re-implemented
some numeric datatypes without using any of the
implementation language's underlying numeric
datatypes.

I chose Ruby for this, partly because I haven't
written anything in Ruby for ages, and partly
because its mixins/inheritance model make parts
of it a little bit easier.

At time of writing, this endeavour includes:

- A natural number datatype, `Counter`, which
represents numeric values as nested lists
- An integer datatype, `Dint`, which represents
a signed integer as an object with a positive
and negative `Counter` component

*Mijn verontschuldigingen* to any Dutch people
reading this. This exercise a sequel
to "Swiss numbers", which implemented the standard
arithmetic operators in terms of `+`, and which
were nowhere near as impressive. 
