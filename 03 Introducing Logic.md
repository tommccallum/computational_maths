# Introducing Logic

We are most interested in the logic of TRUE and FALSE and the ability to infer new true statements.

Given two propositions (or statements) p and q how can we combine them.

A statement is simple a sentence that can be true or false.  In computation a sentence is an expression.

These are the most common forms that you will come across in computation:

* *not* p infers that this statement is true only if p is false.
* p *and* q infers that both p and q must be true for the proposition to be true.
* p *or* q infers that either p is true, or q is true or both p and q are true.

(There is an extra one XOR which is p xor q, this is true if either p is true, or q is true, but not both.)

In computation we borrow the concepts of truth tables [2] from Logic which allows us to manually work out the relevant truth outcomes or a 
compound expression.

Q: This sentence is not true.  Is it true or false?
A: Logic tends to break down when we get self-referencing statements. This is the classic "get AI into an infinite loop" scenario. Related to this type of tortuous logic is the Halting Problem [3], a key theorem in the Theory of Computation.

Logic gives us rules (De Morgan's laws and Double Negation) we can follow to convert between different logically equivalent forms.  We can use these rules ot simplify our conditional logic.

For example, the following are logically equivalent - which one is easier to understand is debatable!

```
if ( !(calculation_success AND download_success) ) {
    // do something
}
```

```
if ( !calculation_success OR !download_success) ) {
    // do something
}
```



## References

[1] https://courses.umass.edu/phil110-gmh/text/c01.pdf
[2] http://discrete.openmathbooks.org/dmoi2/sec_propositional.html
[3] https://www.udiprod.com/halting-problem/