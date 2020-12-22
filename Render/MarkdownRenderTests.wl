(* ::Package:: *)

(* ::Title:: *)
(*Markdown Render Tests*)


(* ::Chapter:: *)
(*Begin Package*)


BeginPackage["MarkdownRenderTests`"]
Unprotect["MarkdownRenderTests`*"];
ClearAll["MarkdownRenderTests`*"];
ClearAll["MarkdownRenderTests`Private`*"];
Needs["MarkdownParse`"];
Needs["MarkdownRender`"];
MarkdownStylerTestReport::usage="Runs a suite of verification tests"
$MarkdownStylerVerificationTests::usage="A list of Verifcation Tests"

MarkdownRenderTestReport::usage="Runs a suite of verification tests"
$MarkdownRenderVerificationTests::usage="A list of Verifcation Tests"
Begin["Private`"]


(* ::Section:: *)
(*VerificationTests*)


(* ::Subsection::Closed:: *)
(*Styler Tests*)


$MarkdownStylerVerificationTests=(
{
	(* HEADINGS *)
	VerificationTest[ToMarkdownStyle[MarkdownElement["H1","A Title"]],MarkdownStyle["A Title","Title"],TestID->"H1StyleTest"],
	VerificationTest[ToMarkdownStyle[MarkdownElement["H2","A Subtitle"]],MarkdownStyle["A Subtitle","Subtitle"],TestID->"H2StyleTest"],
	VerificationTest[ToMarkdownStyle[MarkdownElement["H3","A Chapter"]],MarkdownStyle["A Chapter","Chapter"],TestID->"H3StyleTest"],
	VerificationTest[ToMarkdownStyle[MarkdownElement["H4","A Section"]],MarkdownStyle["A Section","Section"],TestID->"H4StyleTest"],
	VerificationTest[ToMarkdownStyle[MarkdownElement["H5","A Subsection"]],MarkdownStyle["A Subsection","Subsection"],TestID->"H5StyleTest"],
	VerificationTest[ToMarkdownStyle[MarkdownElement["H6","A Subsubsection"]],MarkdownStyle["A Subsubsection","Subsubsection"],TestID->"H6StyleTest"],
	VerificationTest[ToMarkdownStyle["####### A Paragraph"],"####### A Paragraph",TestID->"HNStyleTest"](*,*)
	
	(* EMPHASIS *)
(*	VerificationTest[FixedPoint[MarkdownParser,"_test_"],MarkdownElement[Italic,"test"],TestID->"ItalicTest1"],
	VerificationTest[FixedPoint[MarkdownParser,"this is a _test_"],{"this is a ",MarkdownElement[Italic,"test"]},TestID->"ItalicTest2"],
	VerificationTest[FixedPoint[MarkdownParser,"a _different kind_ of test"],{"a ",MarkdownElement[Italic,"different kind"]," of test"},TestID->"ItalicTest3"],
	VerificationTest[FixedPoint[MarkdownParser,"a _slightly_ **different** _kind_ of test"],{"a ",MarkdownElement[Italic,"slightly"]," ",MarkdownElement[Bold,"different"]," ",MarkdownElement[Italic,"kind"]," of test"},TestID->"ItalicTest4"],
	VerificationTest[FixedPoint[MarkdownParser,"a _**mixed bag**_ test"],{"a ",MarkdownElement[Italic,MarkdownElement[Bold,"mixed bag"]]," test"},TestID->"ItalicTest5"],
	VerificationTest[FixedPoint[MarkdownParser,"> a _block quote_ test"],MarkdownElement["BlockQuote",{"a ",MarkdownElement[Italic,"block quote"], " test"}],TestID->"BlockQuoteTest1"],*)
	
	(* TABLE *)
(*	VerificationTest[MarkdownTableParse["Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3"],{MarkdownElement["Table",{MarkdownElement["TableHeader",{"Markdown "," Less "," Pretty"}],MarkdownElement["TableAlignment",{{Center},{Center},{Center}}],{MarkdownElement["TableRow",{{MarkdownElement[Italic,"Still"]," "},{" ",MarkdownElement["InlineCode","renders"]," "},{" ",MarkdownElement[Bold,"nicely"]}}],MarkdownElement["TableRow",{"1 "," 2 "," 3"}]}}]},TestID->"TableTest1"],
	*)
	(* CODEBLOCK *)
(*	VerificationTest[FixedPoint[MarkdownParser,"
```Mathematica
f[x]:=2;
f[y]:=3
```
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "Mathematica","Body" -> "f[x]:=2;
f[y]:=3"|>],"\n"},TestID->"CodeBlockTest1"],
	VerificationTest[FixedPoint[MarkdownParser,"
```
f[x]:=2;
f[y]:=3
```
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "None","Body" -> "f[x]:=2;
f[y]:=3"|>],"\n"},TestID->"CodeBlockTest2"],
	VerificationTest[FixedPoint[MarkdownParser,"
    A generic code block
    With some text
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "None","Body" -> "A generic code block
    With some text
"|>]},TestID->"CodeBlockTest3"],*)

	(* INLINE CODE *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"`inline code`"],
		MarkdownElement["InlineCode","inline code"],
		TestID->"InlineCodeTest1"
	],
	VerificationTest[
		FixedPoint[MarkdownParser,"insert inline `code block` formatting anywhere"],
		{"insert inline ",MarkdownElement["InlineCode","code block"], " formatting anywhere"},
		TestID->"InlineCodeTest2"
	],
	VerificationTest[
		FixedPoint[MarkdownParser,"### A Chapter heading with `inline code` inserted"],
		MarkdownElement["H3",{"A Chapter heading with ",MarkdownElement["InlineCode","inline code"]," inserted"}],
		TestID->"InlineCodeTest3"
	],*)
	(* LaTeX *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"\(a^2 + b^2 = c^2\)"],
		MarkdownElement["LaTex",<|"Type"->"Inline","Body"->"a^2 + b^2 = c^2"|>],
		TestID -> "InlineLaTeXTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"$ a^2 + b^2 = c^2 $"],
		MarkdownElement["LaTex",<|"Type"->"Inline","Body"->" a^2 + b^2 = c^2 "|>],
		TestID -> "InlineLaTeXTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"\[ a^n + b^n = c^n \]"],
		MarkdownElement["LaTex",<|"Type"->"Display","Body"->"a^n + b^n = c^n"|>],
		TestID -> "DisplayLaTeXTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"$$ a^2 + b^2 = c^2 $$"],
		MarkdownElement["LaTex",<|"Type"->"Display","Body"->" a^2 + b^2 = c^2 "|>],
		TestID -> "DisplayLaTeXTest2"
		],*)
	(* LINKS *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"[click here](www.google.com)"],
		MarkdownElement[Hyperlink,<|"Label"-> "click here","Link"-> "www.google.com"|>],
		TestID -> "LinkTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"<www.google.com>"],
		MarkdownElement[Hyperlink,<|"Link"-> "www.google.com"|>],
		TestID -> "LinkTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"![Streetview of Palm Trees by Brandon Erlinger-Ford](https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80)"],
		MarkdownElement[Hyperlink,<|"AltText"->"Streetview of Palm Trees by Brandon Erlinger-Ford","Link"->"https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80"|>],
		TestID -> "ImageLinkTest1"
		],*)
	(* FOOTNOTES *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"[The first footnote][1] was there and here's [the second footnote][2]"],
		{MarkdownElement[Hyperlink,"The first footnote",MarkdownElement["FootnoteReference",{1}]]," was there and here's",MarkdownElement[Hyperlink,"the second footnote",MarkdownElement["FootnoteReference",{2}]]},
		TestID -> "FoonoteTest1"
		]*)
}
)


(* ::Subsection:: *)
(*Render Tests*)


$MarkdownRenderVerificationTests=(
{
	(* HEADINGS *)
	VerificationTest[MarkdownRender[MarkdownElement["H1","A Title"]],Style["A Title","Title"],TestID->"H1RenderTest"],
	VerificationTest[MarkdownRender[MarkdownElement["H2","A Subtitle"]],Style["A Subtitle","Subtitle"],TestID->"H2RenderTest"],
	VerificationTest[MarkdownRender[MarkdownElement["H3","A Chapter"]],Style["A Chapter","Chapter"],TestID->"H3RenderTest"],
	VerificationTest[MarkdownRender[MarkdownElement["H4","A Section"]],Style["A Section","Section"],TestID->"H4RenderTest"],
	VerificationTest[MarkdownRender[MarkdownElement["H5","A Subsection"]],Style["A Subsection","Subsection"],TestID->"H5RenderTest"],
	VerificationTest[MarkdownRender[MarkdownElement["H6","A Subsubsection"]],Style["A Subsubsection","Subsubsection"],TestID->"H6RenderTest"],
	VerificationTest[MarkdownRender["####### A Paragraph"],"####### A Paragraph",TestID->"HNStyleTest"](*,*)
	
	(* EMPHASIS *)
(*	VerificationTest[FixedPoint[MarkdownParser,"_test_"],MarkdownElement[Italic,"test"],TestID->"ItalicTest1"],
	VerificationTest[FixedPoint[MarkdownParser,"this is a _test_"],{"this is a ",MarkdownElement[Italic,"test"]},TestID->"ItalicTest2"],
	VerificationTest[FixedPoint[MarkdownParser,"a _different kind_ of test"],{"a ",MarkdownElement[Italic,"different kind"]," of test"},TestID->"ItalicTest3"],
	VerificationTest[FixedPoint[MarkdownParser,"a _slightly_ **different** _kind_ of test"],{"a ",MarkdownElement[Italic,"slightly"]," ",MarkdownElement[Bold,"different"]," ",MarkdownElement[Italic,"kind"]," of test"},TestID->"ItalicTest4"],
	VerificationTest[FixedPoint[MarkdownParser,"a _**mixed bag**_ test"],{"a ",MarkdownElement[Italic,MarkdownElement[Bold,"mixed bag"]]," test"},TestID->"ItalicTest5"],
	VerificationTest[FixedPoint[MarkdownParser,"> a _block quote_ test"],MarkdownElement["BlockQuote",{"a ",MarkdownElement[Italic,"block quote"], " test"}],TestID->"BlockQuoteTest1"],*)
	
	(* TABLE *)
(*	VerificationTest[MarkdownTableParse["Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3"],{MarkdownElement["Table",{MarkdownElement["TableHeader",{"Markdown "," Less "," Pretty"}],MarkdownElement["TableAlignment",{{Center},{Center},{Center}}],{MarkdownElement["TableRow",{{MarkdownElement[Italic,"Still"]," "},{" ",MarkdownElement["InlineCode","renders"]," "},{" ",MarkdownElement[Bold,"nicely"]}}],MarkdownElement["TableRow",{"1 "," 2 "," 3"}]}}]},TestID->"TableTest1"],
	*)
	(* CODEBLOCK *)
(*	VerificationTest[FixedPoint[MarkdownParser,"
```Mathematica
f[x]:=2;
f[y]:=3
```
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "Mathematica","Body" -> "f[x]:=2;
f[y]:=3"|>],"\n"},TestID->"CodeBlockTest1"],
	VerificationTest[FixedPoint[MarkdownParser,"
```
f[x]:=2;
f[y]:=3
```
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "None","Body" -> "f[x]:=2;
f[y]:=3"|>],"\n"},TestID->"CodeBlockTest2"],
	VerificationTest[FixedPoint[MarkdownParser,"
    A generic code block
    With some text
"],{"\n",MarkdownElement["CodeBlock", <|"Language" -> "None","Body" -> "A generic code block
    With some text
"|>]},TestID->"CodeBlockTest3"],*)

	(* INLINE CODE *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"`inline code`"],
		MarkdownElement["InlineCode","inline code"],
		TestID->"InlineCodeTest1"
	],
	VerificationTest[
		FixedPoint[MarkdownParser,"insert inline `code block` formatting anywhere"],
		{"insert inline ",MarkdownElement["InlineCode","code block"], " formatting anywhere"},
		TestID->"InlineCodeTest2"
	],
	VerificationTest[
		FixedPoint[MarkdownParser,"### A Chapter heading with `inline code` inserted"],
		MarkdownElement["H3",{"A Chapter heading with ",MarkdownElement["InlineCode","inline code"]," inserted"}],
		TestID->"InlineCodeTest3"
	],*)
	(* LaTeX *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"\(a^2 + b^2 = c^2\)"],
		MarkdownElement["LaTex",<|"Type"->"Inline","Body"->"a^2 + b^2 = c^2"|>],
		TestID -> "InlineLaTeXTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"$ a^2 + b^2 = c^2 $"],
		MarkdownElement["LaTex",<|"Type"->"Inline","Body"->" a^2 + b^2 = c^2 "|>],
		TestID -> "InlineLaTeXTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"\[ a^n + b^n = c^n \]"],
		MarkdownElement["LaTex",<|"Type"->"Display","Body"->"a^n + b^n = c^n"|>],
		TestID -> "DisplayLaTeXTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"$$ a^2 + b^2 = c^2 $$"],
		MarkdownElement["LaTex",<|"Type"->"Display","Body"->" a^2 + b^2 = c^2 "|>],
		TestID -> "DisplayLaTeXTest2"
		],*)
	(* LINKS *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"[click here](www.google.com)"],
		MarkdownElement[Hyperlink,<|"Label"-> "click here","Link"-> "www.google.com"|>],
		TestID -> "LinkTest1"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"<www.google.com>"],
		MarkdownElement[Hyperlink,<|"Link"-> "www.google.com"|>],
		TestID -> "LinkTest2"
		],
	VerificationTest[
		FixedPoint[MarkdownParser,"![Streetview of Palm Trees by Brandon Erlinger-Ford](https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80)"],
		MarkdownElement[Hyperlink,<|"AltText"->"Streetview of Palm Trees by Brandon Erlinger-Ford","Link"->"https://images.unsplash.com/photo-1564889998041-0dacc0706a0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80"|>],
		TestID -> "ImageLinkTest1"
		],*)
	(* FOOTNOTES *)
(*	VerificationTest[
		FixedPoint[MarkdownParser,"[The first footnote][1] was there and here's [the second footnote][2]"],
		{MarkdownElement[Hyperlink,"The first footnote",MarkdownElement["FootnoteReference",{1}]]," was there and here's",MarkdownElement[Hyperlink,"the second footnote",MarkdownElement["FootnoteReference",{2}]]},
		TestID -> "FoonoteTest1"
		]*)
}
)


(* ::Section:: *)
(*Report*)


MarkdownStylerTestReport:=TestReport[$MarkdownStylerVerificationTests]
MarkdownRenderTestReport:=TestReport[$MarkdownRenderVerificationTests]


(* ::Chapter:: *)
(*End Package*)


End[]
Protect["MarkdownRenderTests`*"];
EndPackage[]
