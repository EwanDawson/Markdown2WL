(* ::Package:: *)

(* ::Title:: *)
(*MarkdownRender*)


(* ::Abstract:: *)
(*Render the result of MarkdownParse either as:*)
(*\[LongDash] A list of styled cells for each line / structure*)
(*\[LongDash] Preview the parse list as a notebook*)


(* ::Chapter:: *)
(*Begin Package*)


BeginPackage["MarkdownRender`"]
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["MarkdownRender`*"];
ClearAll["MarkdownRender`*"];
ClearAll["MarkdownRender`Private`*"];
Needs["MarkdownParse`"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
MarkdownRender::usage="MarkdownRender[\*StyleBox[\"parselist\",\"TI\"]] Render the result of MarkdownParse, \*StyleBox[\"parselist\",\"TI\"]"
MarkdownStyle::usage="Symbolic Head for style ready MarkdownElements"
Begin["Private`"]


(* ::Chapter:: *)
(*Support Functions*)


(* ::Section:: *)
(*DownValues*)


(* ::Subsection:: *)
(*Headings*)


MarkdownStyler[MarkdownElement["H1",data_String]]:=MarkdownStyle[data,"Title"]
MarkdownStyler[MarkdownElement["H1",data_List]]:=MarkdownStyle[(MarkdownStyler/@data),"Title"]
MarkdownStyler[MarkdownElement["H2",data_String]]:=MarkdownStyle[data,"Subtitle"]
MarkdownStyler[MarkdownElement["H2",data_List]]:=MarkdownStyle[(MarkdownStyler/@data),"Subtitle"]
MarkdownStyler[MarkdownElement["H3",data_String]]:=MarkdownStyle[data,"Chapter"]
MarkdownStyler[MarkdownElement["H3",data_List]]:=MarkdownStyle[(MarkdownStyler/@data),"Chapter"]
MarkdownStyler[MarkdownElement["H4",data_String]]:=MarkdownStyle[data,"Section"]
MarkdownStyler[MarkdownElement["H4",data_List]]:=MarkdownStyle[(MarkdownStyler/@data),"Section"]
MarkdownStyler[MarkdownElement["H5",data_String]]:=MarkdownStyle[data,"Subsection"]
MarkdownStyler[MarkdownElement["H5",data_List]]:=MarkdownStyler[(MarkdownStyler/@data),"Subsection"]
MarkdownStyler[MarkdownElement["H6",data_String]]:=MarkdownStyle[data,"Subsubsection"]
MarkdownStyler[MarkdownElement["H6",data_List]]:=MarkdownStyle[(MarkdownStyler/@data),"Subsubsection"]


(* ::Subsection:: *)
(*Strings*)


MarkdownStyler[text_String]:=text


(* ::Section:: *)
(*ToMarkdownStyle*)


ToMarkdownStyle[data_]:=MarkdownStyler[data]


(* ::Section:: *)
(*MarkdownRender*)


(* ::Abstract:: *)
(*Replace MarkdownStyle heads with Style*)


MarkdownRender[s_String]:=ToMarkdownStyle[s]
MarkdownRender[m_MarkdownElement]:=(ToMarkdownStyle[m]/.MarkdownStyle->Style)
MarkdownRender[parseList_List]:=ToMarkdownStyle/@parseList


(* ::Section:: *)
(*MarkdownPreview*)


(* ::Chapter:: *)
(*End Package*)


End[]
Protect["MarkdownRender`*"];
EndPackage[]
