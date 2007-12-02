USING: xmode.tokens xmode.catalog
xmode.marker tools.test kernel ;
IN: temporary

[
    {
        T{ token f "int" KEYWORD3 }
        T{ token f " " f }
        T{ token f "x" f }
    }
] [ f "int x" "c" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "\"" LITERAL1 }
        T{ token f "hello\\\"" LITERAL1 }
        T{ token f " " LITERAL1 }
        T{ token f "world" LITERAL1 }
        T{ token f "\"" LITERAL1 }
    }
] [ f "\"hello\\\" world\"" "c" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "\"" LITERAL1 }
        T{ token f "hello\\\ world" LITERAL1 }
        T{ token f "\"" LITERAL1 }
    }
] [ f "\"hello\\\ world\"" "c" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "int" KEYWORD3 }
        T{ token f " " f }
        T{ token f "x" f }
    }
] [ f "int x" "java" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "//" COMMENT2 }
        T{ token f " " COMMENT2 }
        T{ token f "hello" COMMENT2 }
        T{ token f " " COMMENT2 }
        T{ token f "world" COMMENT2 }
    }
] [ f "// hello world" "java" load-mode tokenize-line nip ] unit-test


[
    {
        T{ token f "hello" f }
        T{ token f " " f }
        T{ token f "world" f }
        T{ token f ":" f }
    }
] [ f "hello world:" "java" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "hello_world" LABEL }
        T{ token f ":" OPERATOR }
    }
] [ f "hello_world:" "java" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "\t" f }
        T{ token f "hello_world" LABEL }
        T{ token f ":" OPERATOR }
    }
] [ f "\thello_world:" "java" load-mode tokenize-line nip ] unit-test

[
    {
        T{ token f "<!" KEYWORD2 }
        T{ token f "ELEMENT" KEYWORD2 }
        T{ token f " " KEYWORD2 }
        T{ token f "%" LITERAL2 }
        T{ token f "hello" LITERAL2 }
        T{ token f ";" LITERAL2 }
        T{ token f " " KEYWORD2 }
        T{ token f ">" KEYWORD2 }
    }
] [
     f "<!ELEMENT %hello; >" "xml" load-mode tokenize-line nip
] unit-test

[
    {
        T{ token f "<!" KEYWORD2 }
        T{ token f "ELEMENT" KEYWORD2 }
        T{ token f " " KEYWORD2 }
        T{ token f "%" LITERAL2 }
        T{ token f "hello-world" LITERAL2 }
        T{ token f ";" LITERAL2 }
        T{ token f " " KEYWORD2 }
        T{ token f ">" KEYWORD2 }
    }
] [
     f "<!ELEMENT %hello-world; >" "xml" load-mode tokenize-line nip
] unit-test

[
    {
        T{ token f "$" KEYWORD2 }
        T{ token f "FOO" KEYWORD2 }
    }
] [
    f "$FOO" "shellscript" load-mode tokenize-line nip
] unit-test
