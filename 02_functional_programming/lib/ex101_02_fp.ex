defmodule Ex10102Fp do
  @moduledoc """
  In this module, we are going to cover a few topics of interest to Funnctional Programming.

  - Immutability (no side effects)
  - Recursion (very fast in Elixir)
  - Functions as 1st class citizens
  - Map/Filter/Reduce
  """

  @doc """
  Task 1 - Immutability Demonstration

  In Elixir variables are never assigned by reference.

  You must pass variables through a function to manipulate their value.

  This example is very contrived, but you can see that you do have to
  jump through a few hoops to do what would be trivial in other languages.

  What you get for this is a promise of no side effects.
  You can not accidentally affect the value of data somewhere else.
  And because of this, Elixir can run very fast in parallel "thread safe".

  For this task, you can see that `myleaf` is not affecting

  ## Examples

      # did you know that you can prepend an item to a list super-fast?
      iex> example_list = [:one, :two]
      iex> [:new_value | example_list]
      [:new_value, :one, :two]

      iex> Ex10102Fp.task_1(:new_leaf)
      [[:new_leaf], [:extra, :leaves]]

  """
  def task_1(new_leaf_value) do
    myleaf = :bogus_leaf_value # DO NOT CHANGE
    mytree = task_1_grow_tree(myleaf)
    myleaf = new_leaf_value # RE-ASSIGNING THIS DOES NOTHING
    # HINT: Using List, pop off the first item from the tree (mybranch), and keep the "restoftree"
    # HINT: Using List, replace the first item on mybranch and reassign mybranch
    # HINT: return a new list by prepending the new "mybranch" to the "restoftree"
    # SOLUTION START
    {mybranch, restoftree} = List.pop_at(mytree, 0)
    mybranch = List.replace_at(mybranch, 0, myleaf)
    [mybranch | restoftree]
    # return the whole tree, after you have changed the "leaf" value
    # mytree
  end
  # Private helper function,
  # imagine this is a tree you are trying to manipulate in task_1
  # DO NOT CHANGE task_1_grow_tree
  defp task_1_grow_tree(:new_leaf), do: :not_allowed
  defp task_1_grow_tree(myleaf) do
    mybranch = [myleaf]
    extrabranch = [:extra, :leaves]
    mytree = [mybranch, extrabranch]
    # return the tree (assigned to variable for learning purposes)
    mytree
  end

  @doc """
  Task 2 - Recursion Demonstration

  Function recursion (or "tail recursion optimization") is super-fast in Elixir
  thanks to the aforementioned immutability, and compiler optimizations.

  For this task, we want to accept a source list and items to be concatenated on to the source list.

  But as a caveat, we want to ensure the list is flat (1 dimension)
  but we will be passing in nested lists which will need to be unrolled, while appending.

  HINT: there is a List.flatten, but do not use it, use a recursive tail|head approach instead

  ## Examples

      # The `++` operator is slower than prepending a list, but it is convenient
      iex> [1, 2, 3] ++ [4, 5, 6]
      [1, 2, 3, 4, 5, 6]

      iex> Ex10102Fp.task_2([:one, :two], [:three, [:four]])
      [:one, :two, :three, :four]

      iex> Ex10102Fp.task_2([:one, :two], [:three, [:four, :five], :six])
      [:one, :two, :three, :four, :five, :six]

      iex> Ex10102Fp.task_2([:one, :two], [:three, [[[:four, [:five], :six]], :seven], :eight])
      [:one, :two, :three, :four, :five, :six, :seven, :eight]

  """
  def task_2(source, [] = _append) when is_list(source) do
    # this version of the function is called last
    # inside this function, there are no more values (we are at the end of our tail)
    source
  end
  def task_2(source, [head | tail] = _append) when is_list(source) and is_list(head) and is_list(tail) do
    # this version of the function is called whenever the `head` is a list
    #   (nested inside of the whole append)
    # HINT: recurse into task_2, twice, for the head and the tail
    #SOLUTION START
    source |> task_2(head) |> task_2(tail)
  end
  def task_2(source, [head | tail] = _append) when is_list(source) and is_list(tail) do
    # this version of the function is called whenever the `head` is not a list
    #   (nested inside of the whole append)
    #   the "rest of the list" after the `head` is called a `tail`
    # HINT: recurse into task_2 after you use `++` to append the head onto the source
    # HINT: you can only use `++` on two lists, but `head` is not a list... what to do?
    #SOLUTION START
    source ++ [head] |> task_2(tail)
  end

  @doc """
  Task 3 - Functions as 1st class citizens

  What that means is that functions can be the "values" of arguments, and passed into other functions.

  Put another way, functions can be passed around as easily as data.
  You can refer to them from variables, pass them as parameters to other functions,
  and return them as results from other functions.

  You have alredy done this, but it's worth highlighting

  Goal: Take in a string of CSV numbers, and sum them.

  HINT: You can use `&<function>/#` to reference a function
    where <function> is your function and # is the airity (number of arguments)
    eg: &is_number/1
    eg: &Ex10102Fp.task_3/1

  ## Examples

      iex> Ex10102Fp.task_3("1.1,1.2")
      2.3

      iex> Ex10102Fp.task_3("1,2,3")
      6.0

      iex> Ex10102Fp.task_3("a ,1,2,3,0,v,5,1,*,2")
      14.0
  """
  def task_3(input_string) when is_bitstring(input_string) do
    input_string
    # this will split the command string into a list of elements
    |> String.split(",")
    # Clean each element of the list, to make floats
    #   see Enum.map, Enum.filter, String.trim, Ex10102Fp.task_3_prep_floatify, is_number
    # Here we are passing `&String.trim/1` as an argument
    #   and Enum.map will apply that function against every item in the list
    |> Enum.map(&String.trim/1)
    # Here we are passing our own function into Enum.map
    |> Enum.map(&Ex10102Fp.task_3_prep_floatify/1)
    # Here we are passing the is_number function to filter for only numbers
    |> Enum.filter(&is_number/1)
    # this will take a list of numbers and sum them
    |> Enum.sum()
  end
  def task_3(_), do: raise "I only accept strings"

  @doc """
  Each (string) item in the list may be a number or not.
  This will convert them to a Float if possible, otherwise it just returns what was there

  ## Examples

      iex> Ex10102Fp.task_3_prep_floatify("junk")
      "junk"

      iex> Ex10102Fp.task_3_prep_floatify("+")
      "+"

      iex> Ex10102Fp.task_3_prep_floatify("3")
      3.0

      iex> Ex10102Fp.task_3_prep_floatify("-3.3")
      -3.3
  """
  def task_3_prep_floatify("+"), do: "+" # micro-optimization, but neat!
  def task_3_prep_floatify(node) do
    case Float.parse(node) do
      :error -> node
      {number, _junk} -> number
    end
  end

end
