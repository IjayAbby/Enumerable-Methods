# Enumerable-Methods
The Enumerable module that gets mixed into the Array and Hash classes (among others) and provides lots of handy iterator methods. To prove that there's no magic to it, we are going to rebuild those methods.

## Enumerable Methods List:
-Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.

-Create #my_each_with_index in the same way.

-Create #my_select in the same way, though you may use #my_each in your definition (but not #each).

-Create #my_all? (continue as above)

-Create #my_any?

-Create #my_none?

-Create #my_count

-Create #my_map

-Create #my_inject

-Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

-Modify your #my_map method to take a proc instead.

-Modify your #my_map method to take either a proc or a block. It won't be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn't have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

## Live Code
[![Run on Repl.it](https://repl.it/badge/github/acushlakoncept/Enumerable)](https://repl.it/@IjayAbby/Enumerable-Methods)

## Built With

- Ruby
- VS Code


## Author Details

👤 **Ijay Abby**

- Github: [@IjayAbby](https://github.com/IjayAbby)
- Twitter: [@Ijay_js](https://twitter.com/Ijay_js)
- LinkedIn: [Abigael Nyangasi](https://www.linkedin.com/in/ijayabby4/)


## 🤝 Contributing

Contributions, issues and feature requests are always welcome!

I love meeting other developers, especially ones that give me advice on how to improve my work.

Feel free to check the [issues page](https://github.com/IjayAbby/Enumerable-Methods/issues).

## Show your support

Finally, if you've read this far, don't forget to give this repo a ⭐️. They're free . . . I think.

## Acknowledgments

* This Project is available on The Odin Project.
* Thanks to Microverse and all our peers and colleagues there.



## 📝 License

This project is [MIT](https://github.com/IjayAbby/Enumerable-Methods/blob/development/LICENSE) licensed.
