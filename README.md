# HOL

This elixir package gives an implementation of higher order logic via the [simply typed lambda calculus](https://en.wikipedia.org/wiki/Simply_typed_lambda_calculus) and higher order pre-[unification](https://en.wikipedia.org/wiki/Unification_%28computer_science%29#Higher-order_unification). All lambda terms are always automatically beta-reduced and eta-expanded. Bound Variables are automatically named via [de bruijn indices](https://en.wikipedia.org/wiki/De_Bruijn_index).

Documentation can be build via command `mix docs` and opened via `mix docs --open` after downloading the repository.

## Installation

The package is currently only available via this git repository. It can be installed
by adding `hol` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hol, git: "https://github.com/Jonaloew/HOL.git"}
  ]
end
```

## Example: x(fa) = f(xa)

```elixir
type_i = mk_type(:i)
type_ii = mk_type(type_i, [type_i])

t_x = mk_free_var_term("x", type_ii)
t_f = mk_const_term("f", type_ii)
t_a = mk_const_term("a", type_i)

xfa = mk_appl_term(t_x, mk_appl_term(t_f, t_a))
fxa = mk_appl_term(t_f, mk_appl_term(t_x, t_a))

depth = 5
input = {xfa, fxa}

result = unify(input, true, depth)
pp_res(result)
```

This finds four solutions:

`x <- λ 1. 1 `

`x <- λ 1. f 1`

`x <- λ 1. f (f 1)`

`x <- λ 1. f (f (f 1))`

However the maximum search depth was also reached twice. This means that it might not have found all solutions. A larger depth value can find more solutions

## Most important functions

- `HOL.Data.mk_type/2`: To create a type for the simply typed lambda calculus
- `HOL.Data.mk_free_var/2`: To create a free variable
- `HOL.Data.mk_const/2`: To create a constant
- `HOL.Terms.mk_term/1`: To create a term from a variable or constant
- `HOL.Terms.mk_appl_term/2`: To apply to terms to each other
- `HOL.Terms.mk_abstr_term/2`: To create a lambda abstraction
- `HOL.Data.mk_substitution/2`: To create a substitution
- `HOL.Substitution.subst/2`: To apply a list of substitutions to a term
- `HOL.Unification.unify/3`: To find substitutions to unify two terms
- Use the functions in the `PrettyPrint` Module to show data in a humanly readable format
