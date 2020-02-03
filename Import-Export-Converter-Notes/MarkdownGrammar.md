# Grammar for parsing Markdown files

1. line => plaintext : styledtext : data
1. plaintext => any valid character
1. styledtext => italictext : boldtext : heading : code
1. italictext => iOpen plaintext iClose
1. iOpen => "\*"|"\_"
1. iClose => "\*"|"\_"
1. boldtext => bOpen plaintext bClose
1. bOpen => "\*\*"
1. bClose => "\*\*"
1. heading => h1|h2|h3|h4|h5|h6
1. h1 => "\#" plaintext
1. h2 => "\#\#" plaintext
1. h3 => "\#\#\#" plaintext
1. h4 => "\#\#\#\#" plaintext
1. h5 => "\#\#\#\#\#" plaintext
1. h6 => "\#\#\#\#\#\#" plaintext
1. data => table | blockquote | codeblock
