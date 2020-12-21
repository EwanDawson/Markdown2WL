(* ::Package:: *)

(* ::Title:: *)
(*MarkdownRender*)


(* ::Abstract:: *)
(*Render the result of MarkdownParse either as:*)
(*\[LongDash] A list of styled cells for each line / structure*)
(*\[LongDash] Preview the parse list as a notebook*)


(* ::Chapter::Closed:: *)
(*Begin Package*)


BeginPackage["MarkdownRender`"]
(* \[DownArrow] Allow Refresh of Definitions on Get call \[DownArrow] *)
Unprotect["MarkdownRender`*"];
ClearAll["MarkdownRender`*"];
ClearAll["MarkdownRender`Private`*"];
(* \[UpArrow] Can be removed in Production             \[UpArrow] *)
MarkdownRender::usage="MarkdownRender[\*StyleBox[\"parselist\",\"TI\"]] Render the result of MarkdownParse, \*StyleBox[\"parselist\",\"TI\"]"
Begin["Private`"]


(* ::Chapter:: *)
(*Support Functions*)


(* ::Section:: *)
(*Up Values*)


(* ::Subsection:: *)
(*Headings*)


MarkdownStyle[MarkdownElement["H1",data_String]]^:=MarkdownStyle[data,"Title"]
MarkdownStyle[MarkdownElement["H1",data_List]]^:=(MarkdownStyle/@data)
