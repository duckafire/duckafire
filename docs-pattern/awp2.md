# Abstract Writing Pattern To

## Programming languages

### Naming things

* Case style
  * camelCase
    * Global/local mutable/immutable variables;
    * Public/protected/(package-)private (static) properties;
    * Mutable/immutable parameters;

    * Global/local (im)mutable reference variables to (shallow/deep im)mutable objects.
    * Public/protected/(package-)private (im)mutable reference (static) properties to (shallow/deep im)mutable objects.
    * (Im)mutable reference parameters to (shallow/deep im)mutable objects.

    * (Im)mutable reference variables, (static) properties, and parameters to (anonymous) non-constructor functions;

    * Global/local functions; and
    * (Abstract/overrided) public/protected/(package-)private (static) methods.

  * PascalCase
    * Classes;
    * Uninstantiable classes;
    * Unextendable classes;
    * Decorations/annotation classes/functions;
    * Exception classes;
    * Classes-like (like Java Records, Python Data Classes, ...).

    * Interfaces;
    * Enumerators names;
    * Structures;
    * Structure unions;
    * Constructor global/local functions;
    * Generic types;
    * Name spaces;
    * Classes files names;

    * Global/local (im)mutable reference variables to anonymous constructor functions;
    * Public/protected/(package-)private reference (static) properties to anonymous constructor functions; and
    * (Im)muttable reference parameters to anonymous constructor functions.

  * kebab-case
    * No-private files names (it includes components and templates);
    * Directory names;
    * String values to enumerators;
    * Git branch names; and
    * API routes.

  * snake\_case
    * Data cluster names;
    * Table names from data clusters; and
    * Table fields names data clusters.

  * SCREAMING\_SNAKE\_CASE
    * Compile-time immutable variables, immutable (static) properties, macros;
    * Environment variables/secrets; and
    * Enumerators keys names.

  * lowercase
    * Private file names (prefixed with a dot);
    * Package names; and
    * Customized (union) types.

  * Train-Case
    * Customized HTTP header fields.

