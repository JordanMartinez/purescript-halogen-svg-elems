# Halogen SVG

A collection of SVG elements for Halogen.


## Design Decisions 

### Type safety vs. ergonomics

- Provide exactly one function per attribute name
  - Allows all attributes to be imported with a single import
  - Same named attributes with different type
- Importing elementes and attributes should be as simple as possible

#### Use typeclasses to solve attribute overloading problem
The `text` element has an attribute `rotate` that accepts a list of numbers





### Scope
  - [Scalable Vector Graphics (SVG) 2](https://www.w3.org/TR/SVG2/)
  - [Animation - SVG 1.1](https://www.w3.org/TR/SVG11/animate.html)
(https://www.w3.org/TR/2001/REC-smil-animation-20010904)
  - [CSS Values and Units Module Level 3](https://www.w3.org/TR/css-values-3/)
  - [CSS Masking Module Level 1](https://drafts.fxtf.org/css-masking-1)

GOAL: add all of the tests from the SVG spec

### 2. Small files


when two elements have attributes that have the same thing but do different things, create a class and define attributes via instances of that class


## Contributing

Contributions of or requests for additional elements and properties are welcome!

To test and verify that everything displays properly, do the following:

1. Run `npm install`
2. Run `npm test`
3. Open `dist/test.html`