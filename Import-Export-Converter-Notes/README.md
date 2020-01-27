# **Import-Export-Converter Notes**

**This document is a work-in-progress**

### Import-Export registration

Two desired import behaviors:
- A representation suitable for computation
- A representation suitable for display

Potential Importers and Output Types:
- Conditional
	- MarkdownObject
	- MarkdownElement
- Default
	- String
- Post
	- XML
	- Association
	- Dataset
	- Notebook
	- Table
	- CodeBlock
	- BlockQuote
	- Headings
		- All
		- Specific Level (1-6)

Refer to `$InstallationDirectory/SystemFiles/Formats/HTML` for guidance.

```Mathematica
ImportExport`RegisterImport[
	"Markdown",
	{
		(*CONDITIONAL IMPORTER*)
		(*DEFAULT IMPORTER*)
		},

		{
			(*POST-IMPORTERS*)
		}
]
```
