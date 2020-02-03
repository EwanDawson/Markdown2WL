# Grammar for parsing Markdown files

1. line => plaintext : styledtext : data
1. plaintext => any valid character
1. styledtext => italictext : boldtext : header : code
1. italictext => "\*"|"\_" plaintext "\*"|"\_"
1. boldtext => Except["\*\*"] "\*\*" plaintext "\*\*" Except["\*\*"]
1. data => table | blockquote | codeblock
