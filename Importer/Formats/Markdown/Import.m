(* *)

ImportExport`RegisterImport[
	"Markdown",
	{
		(*CONDITIONAL IMPORTER*)
		"Symbolic" :> Markdown`MarkdownSymbolicImport
		(*DEFAULT IMPORTER*)
		Markdown`MarkdownDefaultImport
		},

		{
			(*POST-IMPORTERS*)
			"Cells" :> Markdown`MarkdownCellImport,
			(*
			"TextGrid" :> Markdown`MarkdownTextGridImport,
			"StyledTextGrid" :> Markdown`MarkdownStyledTextGridImport
			*)
			"Embedded" :> Markdown`MarkdownCellPrintImport,
			"Notebook" :> Markdown`MarkdownNotebookImport
			(*
			"Dataset" :> Markdown`MarkdownStyledTextGridImport,
			"Association" :> Markdown`MarkdownStyledTextGridImport
			*)
		}
]
