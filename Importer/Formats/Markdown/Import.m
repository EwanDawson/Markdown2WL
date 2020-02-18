(* *)

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
