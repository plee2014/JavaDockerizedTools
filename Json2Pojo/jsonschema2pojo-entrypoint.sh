#! /bin/bash -eu
# Docker ENTRYPOINT script when running the container without explictly setting the command
# I will generate POJOs from the json file that are in $BUILD_DIRECTORY


#Usage: jsonschema2pojo [options]
  #Options:
    #-a, --annotation-style
       #Options: [JACKSON, JACKSON1, JACKSON2, GSON, MOSHI1, NONE]
       #Default: JACKSON
    #-i, --big-decimals
       #Use BigDecimal instead of double (or Double) when the JSON Schema type
       #'number' is encountered. Note that this overrides -f/--float-numbers
       #Default: false
    #-bi, --big-integers
       #Use BigInteger instead of int (or Integer) when the JSON Schema type
       #'integer' is encountered. Note that this overrides -l/--long-integers
       #Default: false
    #-y, --class-prefix
       #Prefix for generated class.
       #Default: <empty string>
    #-x, --class-suffix
       #Suffix for generated class.
       #Default: <empty string>
    #-c3, --commons-lang3
       #Whether to use commons-lang 3.x imports instead of commons-lang 2.x
       #imports when adding equals, hashCode and toString methods.
       #Default: false
    #-r, --constructors-required-only
       #Generate constructors with only required fields
       #Default: false
    #-A, --custom-annotator
       #The fully qualified class name of referring to a custom annotator class
       #that implements org.jsonschema2pojo.Annotator and will be used in addition to
       #the --annotation-style. If you want to use a custom annotator alone, set
       #--annotation-style to none
       #Default: class org.jsonschema2pojo.NoopAnnotator
    #-F, --custom-rule-factory
       #The fully qualified class name of referring to a custom rule factory
       #class that extends org.jsonschema2pojo.rules.RuleFactory to create custom rules
       #for code generation.
       #Default: class org.jsonschema2pojo.rules.RuleFactory
    #-dt, --date-class
       #Specify date class
    #-dtt, --datetime-class
       #Specify datetime class
    #-da, --disable-accessors
       #Whether to omit getter/setter methods and create public fields instead.
       #Default: false
    #-D, --enable-additional-properties
       #Enable additional properties support on generated types, regardless of
       #the input schema(s)
       #Default: false
    #-fe, --file-extensions
       #The extensions that should be considered as standard filename extensions
       #when creating java class names.
       #Default: <empty string>
    #-f, --float-numbers
       #Use float (or Float) instead of double (or Double) when the JSON Schema
       #type 'number' is encountered
       #Default: false
    #-fdt, --format-date-times
       #Whether the fields of type `date-time` have the `@JsonFormat` annotation
       #with pattern set to the default value of `yyyy-MM-dd'T'HH:mm:ss.SSS` and
       #timezone set to default value of `UTC`
       #Default: false
    #-b, --generate-builders
       #Generate builder-style methods as well as setters
       #Default: false
    #-c, --generate-constructors
       #Generate constructors
       #Default: false
    #-h, --help
       #Print help information and exit
       #Default: false
    #-ida, --include-dynamic-accessors
       #Include dynamic getter, setter, and builder support on generated types.
       #Default: false
    #-il, --inclusion-level
       #Options: [ALWAYS, NON_ABSENT, NON_DEFAULT, NON_EMPTY, NON_NULL,
       #USE_DEFAULTS]
       #Default: NON_NULL
    #-j, --joda-dates
       #Whether to use org.joda.time.DateTime instead of java.util.Date when
       #adding date-time type fields to generated Java types.
       #Default: false
    #-jd, --joda-local-dates
       #Whether to use org.joda.time.LocalDate insteadof String when adding date
       #type fields to generated Java types.
       #Default: false
    #-jt, --joda-local-times
       #Whether to use org.joda.time.LocalTime insteadof String when adding time
       #type fields to generated Java types.
       #Default: false
    #-303, --jsr303-annotations
       #Add JSR-303/349 annotations to generated Java types.
       #Default: false
    #-305, --jsr305-annotations
       #Add JSR-305 annotations to generated Java types.
       #Default: false
    #-l, --long-integers
       #Use long (or Long) instead of int (or Integer) when the JSON Schema type
       #'integer' is encountered
       #Default: false
    #-N, --null-collections
       #Initialize Set and List fields to null instead of an empty collection.
       #Default: false
    #-E, --omit-hashcode-and-equals
       #Omit hashCode and equals methods in the generated Java types
       #Default: false
    #-S, --omit-tostring
       #Omit the toString method in the generated Java types
       #Default: false
    #-e, --output-encoding
       #The character encoding that should be used when writing the generated
       #Java source files.
       #Default: UTF-8
    #-p, --package
       #A java package used for generated types
    #-pl, --parcelable
       #**EXPERIMENTAL** Whether to make the generated types 'parcelable' (for
       #Android development).
       #Default: false
    #-R, --remove-old-output
       #Whether to empty the target directory before generation occurs, to clear
       #out all source files that have been generated previously (indiscriminately
       #deletes all files and folders).
       #Default: false
    #-sl, --serializable
       #Whether to make the generated types 'serializable'.
       #Default: false
  #* -s, --source
       #The source file(s) or directory(ies) from which JSON Schema will be read
    #-T, --source-type
       #Options: [JSONSCHEMA, JSON]
       #Default: JSONSCHEMA
  #* -t, --target
       #The target directory into which generated types will be written
    #-tv, --target-version
       #The target version for generated source files.
       #Default: 1.6
    #-tt, --time-class
       #Specify time class
    #-P, --use-primitives
       #Use primitives instead of wrapper types for bean properties
       #Default: false
    #-d, --word-delimiters
       #The characters that should be considered as word delimiters when creating
       #Java Bean property names from JSON property names
       #Default: - _



set -euxo pipefail

BUILD_DIRECTORY=/build

if [ -d "$BUILD_DIRECTORY" ]; then
rm -rf $BUILD_DIRECTORY/generated
jsonschema2pojo \
    --source-type json \
    --annotation-style JACKSON2 \
    --generate-builders \
    --use-primitives \
    --long-integers \
    --generate-constructors \
    --enable-additional-properties \
    --serializable \
    --word-delimiters "- _" \
    --package com.example \
    --source $BUILD_DIRECTORY \
    --target $BUILD_DIRECTORY/generated
   # --classname:PackagesDtoContainer \
    #--float-numbers \
    #--omit-hashcode-and-equals \
    #--omit-tostring \
    #--include-dynamic-accessors \
fi

