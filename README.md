# EMD.jl
An Empirical Mode Decomposition Package for Julia

## Getting Started
The EMD module requires [Splines.jl](https://github.com/bnels/Splines.jl) to work.  Install this first.

You can install the EMD module in Julia
~~~julia
Pkg.checkout("git@github.com:bnels/EMD.jl.git")
Pkg.build("EMD")
~~~
You can update the package using the usual
~~~julia
Pkg.update()
~~~
Now you're ready to start using EMD!

## Examples