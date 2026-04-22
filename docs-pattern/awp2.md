[concept-murphys-law]: https://en.wikipedia.org/wiki/Murphy%27s_law
[concept-kiss]:  https://en.wikipedia.org/wiki/KISS_principle
[concept-yagni]: https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it

# Abstract Writing Pattern To

* [Concepts](#concepts)
* [Programming languages](#programming-languages)
  * [Naming things](#naming-things)
    * [Case styles](#case-styles)
    * [Identifiers semantic](#identifiers-semantic)

## Concepts

* [Murphy's Law: *"Anything that can go wrong will go wrong."*][concept-murphys-law]: if something
  can failure, a *Plan B* always must be created — even if the plan is return an error value,
  throw/raise an exception, send an HTML error page, or similar.

* [KISS: Keep It Simple, Stupid.][concept-kiss]: all it always must be the more simple possible —
  sometimes, abstraction layers are necessary, but it must not be used of a exaggerated way.

* [YAGNI: You Aren't Gonna Need It.][concept-yagni]: all it that is not used have to be deleted, except
  parts of content from libraries, frameworks, assets collections, and similary that are not used.

## Programming languages

### Naming things

#### Case styles

* `camelCase`
  * (Static) global/local mutable/immutable variables;
  * Public/protected/(package-)private (static) properties;
  * Mutable/immutable parameters;

  * (Static) global/local (im)mutable reference variables to (shallow/deep im)mutable objects.
  * Public/protected/(package-)private (im)mutable reference (static) properties to (shallow/deep
    im)mutable objects.
  * (Im)mutable reference parameters to (shallow/deep im)mutable objects.

  * (Im)mutable reference variables, (static) properties, and parameters to (anonymous)
    non-constructor functions;

  * (Static) global/local functions; and
  * (Abstract/overrided) public/protected/(package-)private (static) methods.

* `PascalCase`
  * Instantiable and extendable classes;
  * Uninstantiable classes;
  * Unextendable classes;
  * Decorations/annotation classes/functions;
  * Exception classes;
  * Classes-like (like Java Records, Python Data Classes, ...).

  * Interfaces;
  * Enumerators names;
  * Structures;
  * Unions;
  * Constructor global/local functions;
  * Generic types;
  * Name spaces;
  * Classes files names;

  * (Static) global/local (im)mutable reference variables to anonymous constructor functions;
  * Public/protected/(package-)private reference (static) properties to anonymous constructor
    functions; and
  * (Im)muttable reference parameters to anonymous constructor functions.

* `kebab-case`
  * **All** no-private files names;
  * Directory names;
  * String values to enumerators;
  * Git branch names; and
  * API routes.

* `snake\_case`
  * Data cluster names;
  * Table names from data clusters; and
  * Table fields names data clusters.

* `SCREAMING\_SNAKE\_CASE`
  * Compile-time immutable variables, immutable (static) properties, macros;
  * Environment variables/secrets; and
  * Enumerators keys names.

* `lowercase`
  * Private directories/files names (prefixed with a dot);
  * Package names; and
  * Customized types (unions).

* `Train-Case`
  * Customized HTTP header fields.

#### Identifiers semantic

* **All** indentifiers always **must be** descriptive — in other words, they **must describe** the
  intention behind their declaration, no requiring external explanations (documentation exists to
  explain what the code does, and not how it does);

* **Any** identifiers, except **any** protected/private property/method, can start with one or
  more underscores;
* **Any** protected property/method always must be prefixed with `_`;
* **Any** private property/method always must be prefixed with `__`;
* Generic types always must be prefixed with `G`;
* **Any** variable, property, and parameter of the boolean type, **any** functions and methods that
  return a boolean value, and **any** macro that will expand to a boolean expression or value
  always must be prefixed with one of the prefixes below — following the respective style case:
  * `is` (*it.isEmpty*),
  * `has` (*it.hasChildren*),
  * `can` (*it.canDeleteFiles*), and
  * `should` (*it.shouldUpdateScreen*);

* **Any** customized types always must be suffixed with `_t`;
* **Any** exception classes always must be suffixed with `Exception`;

* In identifiers, acronyms are treated as words, so:
  * if it is the first *words* of a `camelCase` identifier, all its letters always must be lower,
  * if it is not the first *words* of a `camelCase` identifier — all its letters always must be
    upper —,
  * if it is present in a `PascalCase` identifier — all its letters always must be upper —, and
  * if it is present in a `kebab-case` or other case that has a *separator character* — it always
    must be separated of the other words;

* **All** classes, structures, interfaces, and enumerators names always must be substantive in
  singular form;

* Uninstantiable classes names always must representate a group of *objects* (like "Person",
  "Vehicle", and "Reptiles");
* Instantiable classes, classes-like, and structures names always must representate a specific
  *object* (like "User", "Car", and "Snake");
* Enumerators names always must representate a group of things — like `TokenType` and `UserState`;
* Interfaces names always must define:
  * behavior (like "Validator", "EventHandler", and "Calculator"),
  * capacity (like "Cloeable", "Storable", and "Renderable"),
  * abstraction (like "Shape", "DataSource", and "Account"), and
  * architecture layer (like "Client", "Service", and "Controller");

* The "*Getters* and *Setters* Pattern" — mainly *Setter* — have to be avoided, because it is too
  generic, low expressive and low clean;

* **Any** asynchronous function or method always must be suffixed with `Async`;

