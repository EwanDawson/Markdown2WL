# **Import-Export-Converter Notes**

**This document is a work-in-progress**

### Import-Export registration

Two desired import behaviors:
- A representation suitable for computation
- A representation suitable for display

In either case, should styles / hyperlinks parse before the final computational/display forms

Possible computational representations:
- Association
- Dataset
- List


```Mathematica
ImportExport`RegisterImport[
	"Markdown",
	{
		(*DEFAULT IMPORTER*)
		Markdown`MarkdownDefaultImport
		},

		{
			(*POST-IMPORTERS*)
			"XML" :> Markdown`ImportMarkdownToXML,
			"Association" :> Markdown`ImportMarkdownToAssociation,
			"Dataset" :> Markdown`ImportMarkdownToDataset,
			"Notebook" :> Markdown`ImportMarkdownToNotebook,
			"Table" :> Markdown`MarkdownTableImport,
			"CodeBlock" :> Markdown`MarkdownCodeBlockImport,
			{"Headings", headingLevel_Integer} :> (Markdown`MarkdownSpecificLevelHeadingImport[headingLevel][##]&),
			"Headings" :> Markdown`MarkdownImportAllHeadings,
		}
]
```


### Importer Definitions

#### Conditional Import
Markdown`MarkdownAssociationImport
Potential Structure:

```Mathematica
<|lineNumber -> <|elementType -> elementData, ...|>|>
```

```Mathematica
<|10 ->
	<|
		"Text" -> "This is an example line, here is an ",
		"Hyperlink" ->
			<|
				"Text" -> "example link",
				"URL" -> "https://example.com"
			|>
	|>
|>
```


#### Default Import
Markdown`MarkdownDefaultImport

Returns the result of ReadList on the markdown file. With the "Render" option: styles and links render to a 'display' form

#### Post Import
"Dataset" :> Markdown`MarkdownImportToDataset,

"Notebook" :> Markdown`MarkdownImportToNotebook,

"Table" :> Markdown`MarkdownTableImport,

"CodeBlock" :> Markdown`MarkdownCodeBlockImport,

{"Headings", headingLevel_Integer} :> (Markdown`MarkdownImportHeadingAtLevel[headingLevel][##]&),

"Headings" :> Markdown`MarkdownImportAllHeadings,
