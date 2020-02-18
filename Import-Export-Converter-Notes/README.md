# **Import-Export-Converter Notes**

**This document is a work-in-progress**

### Import-Export registration

Two desired import behaviors:
- A representation suitable for computation
- A representation suitable for display

Potential Importers and Output Types:
- Conditional
	- MarkdownObject
		- Symbolic representation of a markdown file
	- MarkdownElement
		- Symbolic representation of a markdown tag
- Default
	- String
		- Plaintext version of the markdown file
- Post
	- XML
		- Markdown file in Symbolic XML
	- Association
		- Symbolic Markdown converted to Association form
	- Dataset
		- Symbolic / Association form Markdown converted to Dataset
	- Notebook
		- Markdown file as NotebookObject
	- Styled Text
		- Markdown file as TextGrid of appropriately Styled Cells
	- Markdown Table
		- List of all Markdown tables from the file
	- Markdown CodeBlock
		- List of all Markdown CodeBlocks from the file
	- Markdown BlockQuote
		- List of all Markdown BlockQuotes from the file
	- Markdown Headings
		- All
			- List of All heading texts
		- Specific Level (1-6)
			- List of heading `n` texts

Refer to `$InstallationDirectory/SystemFiles/Formats/HTML` for guidance.

```Mathematica
ImportExport`RegisterImport[
	"Markdown",
	{
		(*CONDITIONAL IMPORTER*)
		(*DEFAULT IMPORTER*)
		Markdown`MarkdownDefaultImport
		},

		{
			(*POST-IMPORTERS*)
			"Parsed" :> Markdown`MarkdownParse,
			"Cells" :> Markdown`MarkdownCellImport,
			"Embedded" :> Markdown`MarkdownCellPrintImport,
			"Notebook" :> Markdown`MarkdownNotebookImport
		}
]
```
