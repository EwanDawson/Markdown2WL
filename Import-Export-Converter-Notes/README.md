# **Import-Export-Converter Notes**

Import-Export registration

```Mathematica
ImportExport`RegisterImport[
	"Markdown",
	{

		(* Piecemeal Import *)
		"Table" :> Markdown`MarkdownTableImport,
		"CodeBlock" :> Markdown`MarkdownCodeBlockImport,
		"Headings" :> Markdown`MarkdownHeadingsImport,
		"h1" :> Markdown`MarkdownH1Import,
		"h2" :> Markdown`MarkdownH2Import,
		"h3" :> Markdown`MarkdownH3Import,
		"h4" :> Markdown`MarkdownH4Import,
		"h5" :> Markdown`MarkdownH5Import,
		"h6" :> Markdown`MarkdownH6Import

		(* DEFAULT IMPORTER *)
		Markdown`MarkdownImport
		},

		{
			"Dataset" :> Markdown`MarkdownDatasetImport,
			"Notebook" :> Markdown`MarkdownNotebookImport,
			"PDF" :> Markdown`MarkdownPDFImport,
		}
]
```
