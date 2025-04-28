# HOL

This elixir package gives an implementation of higher order logic via the simply typed lambda calculus and higher order logic unification. All lambda terms are always automatically beta-reduced and eta-expanded. Bound Variables are automatically named via de bruijn indices.

Documentation can be build via command `mix docs` and opened via `mix docs --open` after downloading the repository.

## Installation

The package is currently only available via this git repository.

## Most important functions

- `HOL.Data.mk_type/2`: To create a type for the simply typed lambda calculus
- `HOL.Data.mk_free_var/2`: To create a free variable
- `HOL.Data.mk_const/2`: To create a constant
- `HOL.Terms.mk_term/1`: To create a term from a variable or constant
- `HOL.Terms.mk_appl_term/2`: To apply to terms to each other
- `HOL.Terms.mk_abstr_term/2`: To create a lambda abstraction
- `HOL.Substitution.subst/2`: To apply a list of substitutions to a term
- `HOL.Unification.unify/3`: To find substitutions to unify two terms
- Use the functions in the `PrettyPrint` Module to show data in a humanly readable format

## Example

```elixir
# Creating types
type_i = mk_type(:i) # Creates base type i
type_ii = mk_type(:i, [type_i]) # Creates type i->i
type_o = mk_type(:o) # Creates base type o

# Creating Vars
var_x = mk_free_var("x", type_i)
var_z = mk_free_var("z", type_ii)
con_c = mk_const("c", type_i)

# Using Terms
term_c = mk_term(con_c) # Makes term (c)
term_z = mk_term(var_z) # Makes term (1. z 1) because of eta-expansion
zx = mk_appl_term(term_z, mk_term(var_x)) # Makes term (z x)
zc = mk_appl_term(term_z, term_c) # Makes term (z c)

abstr_zx = mk_abstr_term(zc, var_x) # Makes term (1. z 1)
appl = mk_appl_term(abstr_zx, zc) # Makes term (z (z c))

identity = mk_term(var_x) |> mk_abstr_term(var_x) # Makes term (1. 1)

# Using substitutions
s = substitution(fvar: var_z, term: identity) # Make substitution "z <- (1. 1)"
new_appl = subst(s, appl) # Makes term (c)

# Using Unification
result = unify({mk_term(var_x), term_c}) # Gives one solution with the substitution "x <- c"
```
