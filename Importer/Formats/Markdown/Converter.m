Needs["MarkdownParse`"]
Needs["MarkdownRender`"]

(* Plaintext Source *)
Markdown`MarkdownDefaultImport[file_String] := {"Source" -> ReadString[file]}

Markdown`MarkdownSymbolicImport[file_String] := {"Symbolic" -> MarkdownParse[file]}

(* TextGrid version of plaintext source *)

MarkdownTextGridImport[file_String] := Module[
  {
   lines =
    markdownDefaultImport /* (StringSplit[#, "\n"] &)@file,
		textGrid
   },
  textGrid = (Transpose /* TextGrid@{lines});
	{"TextGrid" -> textGrid}
  ]


(* TextGrid of Styled Cells*)

Markdown`MarkdownStyledTextGridImport[file_String] := Module[
  {
   parsed2MD = MarkdownParse[file],
   mdRender, lines2TextGrid, styledTextGrid
   },
  mdRender = MarkdownRender[parsed2MD];
  lines2TextGrid =
   TextGrid[{If[ListQ[#], #, {#}]}, Spacings -> 0.25] & /@ mdRender;
  styledTextGrid = (Transpose /* TextGrid@{lines2TextGrid});
	{"StyledTextGrid" -> styledTextGrid}
  ]
	
(* List of styled Cells *)

Markdown`MarkdownCellImport[file_String] := Module[
  {
   parsed2MD = MarkdownParse[file],
   mdRender, unlist, cells
   },
  mdRender = MarkdownRender[parsed2MD];
  unlist = mdRender /. {x_} :> x;
  cells = (
     Which[
       StringQ[#], TextCell[#, "Text"],
       ListQ[#],
       TextCell[
        Row[Replace[#,
          x_String /; StringEndsQ[Except[" "]][x] :> x <> " ", 1]],
        "Text"],
       True, #
       ] &
     ) /@ unlist;
		{"Cells" -> cells}
  ]

(* CellPrint a list of styled Cells *)
Markdown`MarkdownCellPrintImport[file_String] := Module[
  {
   parsed2MD = MarkdownParse[file],
   mdRender, unlist, cells
   },
  mdRender = MarkdownRender[parsed2MD];
  unlist = mdRender /. {x_} :> x;
  cells = (
     Which[
       StringQ[#] \[And] StringMatchQ[""][#], Nothing,
       StringQ[#], TextCell[#, "Text"],
       ListQ[#],
       TextCell[
        Row[Replace[#,
          x_String /; StringEndsQ[Except[" "]][x] :> x <> " ", 1]],
        "Text"],
       MatchQ[TextCell][Head[#]] \[And]
        MatchQ[Italic | Bold][Last[#]], TextCell[#, Last[#], "Text"],
       (*True,TextCell[#,"Text"]*)
       (*True,remains[#,
       FullForm[#]]*)
       True, #
       ] &
     ) /@ unlist;
  {"Embedded" :> CellPrint[cells]}
  ]

(* Create a Notebook from a list of styled cells*)
Markdown`MarkdownNotebookImport[file_String] := Module[
  {
   parsed2MD = MarkdownParse[file],
   mdRender, unlist, cells
   },
  mdRender = MarkdownRender[parsed2MD];
  unlist = mdRender /. {x_} :> x;
  cells = (
     Which[
       StringQ[#] \[And] StringMatchQ[""][#], Nothing,
       StringQ[#], TextCell[#, "Text"],
       ListQ[#],
       TextCell[
        Row[Replace[#,
          x_String /; StringEndsQ[Except[" "]][x] :> x <> " ", 1]],
        "Text"],
       MatchQ[TextCell][Head[#]] \[And]
        MatchQ[Italic | Bold][Last[#]], TextCell[#, Last[#], "Text"],
       (*True,TextCell[#,"Text"]*)
       (*True,remains[#,
       FullForm[#]]*)
       True, #
       ] &
     ) /@ unlist;
  {"Notebook" :> CreateDocument[cells]}
  ]
