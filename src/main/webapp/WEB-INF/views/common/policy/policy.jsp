<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>개인정보의 수집 및 이용</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
</head>
<head>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>herojd</o:Author>
  <o:LastAuthor>herojd</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>638</o:TotalTime>
  <o:Created>2016-03-23T16:17:00Z</o:Created>
  <o:LastSaved>2016-03-23T16:17:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>450</o:Words>
  <o:Characters>2568</o:Characters>
  <o:Lines>21</o:Lines>
  <o:Paragraphs>6</o:Paragraphs>
  <o:CharactersWithSpaces>3012</o:CharactersWithSpaces>
  <o:Version>15.00</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>KO</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:SpaceForUL/>
   <w:BalanceSingleByteDoubleByteWidth/>
   <w:DoNotLeaveBackslashAlone/>
   <w:ULTrailSpace/>
   <w:DoNotExpandShiftReturn/>
   <w:AdjustLineHeightInTable/>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
   <w:UseFELayout/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="371">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:돋움;
	panose-1:2 11 6 0 0 1 1 1 1 1;
	mso-font-alt:Dotum;
	mso-font-charset:129;
	mso-generic-font-family:modern;
	mso-font-pitch:variable;
	mso-font-signature:-1342176593 1775729915 48 0 524447 0;}
@font-face
	{font-family:굴림;
	panose-1:2 11 6 0 0 1 1 1 1 1;
	mso-font-alt:Gulim;
	mso-font-charset:129;
	mso-generic-font-family:roman;
	mso-font-format:other;
	mso-font-pitch:fixed;
	mso-font-signature:1 151388160 16 0 524288 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:1;
	mso-generic-font-family:roman;
	mso-font-format:other;
	mso-font-pitch:variable;
	mso-font-signature:0 0 0 0 0 0;}
@font-face
	{font-family:"\@돋움";
	panose-1:2 11 6 0 0 1 1 1 1 1;
	mso-font-charset:129;
	mso-generic-font-family:modern;
	mso-font-pitch:variable;
	mso-font-signature:-1342176593 1775729915 48 0 524447 0;}
@font-face
	{font-family:"\@굴림";
	panose-1:2 11 6 0 0 1 1 1 1 1;
	mso-font-charset:129;
	mso-generic-font-family:modern;
	mso-font-pitch:variable;
	mso-font-signature:-1342176593 1775729915 48 0 524447 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:107%;
	mso-pagination:none;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"맑은 고딕";
	mso-ascii-font-family:"맑은 고딕";
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"맑은 고딕";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:"맑은 고딕";
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"굴림",serif;
	mso-hansi-font-family:굴림;
	mso-bidi-font-family:굴림;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:40.0pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:8.0pt;
	mso-para-margin-left:4.0gd;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:107%;
	mso-pagination:none;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"맑은 고딕";
	mso-ascii-font-family:"맑은 고딕";
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"맑은 고딕";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:"맑은 고딕";
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;
	mso-style-unhide:no;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"맑은 고딕";
	mso-ascii-font-family:"맑은 고딕";
	mso-ascii-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:107%;}
 /* Page Definitions */
 @page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;
	mso-header-margin:42.55pt;
	mso-footer-margin:49.6pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 @list l0
	{mso-list-id:669256759;
	mso-list-template-ids:2040178784;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1
	{mso-list-id:1560364779;
	mso-list-template-ids:-355180580;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2
	{mso-list-id:1772433707;
	mso-list-template-ids:-279947006;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";}
@list l3
	{mso-list-id:2127917957;
	mso-list-template-ids:4099684;}
@list l1:level1 lfo1
	{mso-level-start-at:0;
	mso-level-numbering:continue;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level1 lfo2
	{mso-level-start-at:0;
	mso-level-numbering:continue;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"표준 표";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:8.0pt;
	mso-para-margin-left:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"맑은 고딕";
	mso-ascii-font-family:"맑은 고딕";
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"맑은 고딕";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:"맑은 고딕";
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=KO style='tab-interval:40.0pt'>

<div class=WordSection1>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black'>&lt;</span></b><b><span
style='font-size:9.0pt;font-family:돋움;color:black'>개인정보의 수집 및 이용<span
lang=EN-US>&gt;</span></span></b><span lang=EN-US style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt'><o:p></o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:10.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='mso-bidi-font-size:10.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>더부로<span
lang=EN-US>(The Bro) (</span>이하<span lang=EN-US> &quot;</span>회사<span
lang=EN-US>&quot;)</span>가 제공하는 네일덕<span lang=EN-US>(nailduck)</span>서비스<span
lang=EN-US>(</span>이하<span lang=EN-US> &quot;</span>서비스<span lang=EN-US>&quot;)</span>는
이용자의 개인정보를 중요시하며<span lang=EN-US>, &quot;</span>정보통신망 이용촉진 및 정보보호 등에 관한 법률<span
lang=EN-US>&quot;</span>등 개인정보와 관련된 법령상의 개인정보보호규정 및 방송통신위원회가 제정한<span
lang=EN-US> &quot;</span>개인정보보호지침<span lang=EN-US>&quot;</span>을 준수 합니다<span
lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt'>개인정보 취급방침은 법령 또는 지침의 변경이나<span lang=EN-US>, </span>더욱 나은 서비스의
제공을 위하여 그 내용이 변경될 수 있습니다<span lang=EN-US>. </span>이 경우 회사는 웹사이트 및 어플리케이션에서 공지사항에
이를 올리거나 이메일을 통해 공지 합니다<span lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>1. </span></b><b><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>개인정보의 수집
및 이용 목적<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1;
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;color:black;
mso-themecolor:text1;background:white'>회사는 회원가입<span lang=EN-US>, </span>원활한 고객상담<span
lang=EN-US>, </span>각종 서비스의 제공을 위해 회원가입 당시<span lang=EN-US>, </span>서비스 이용 중 아래와
같은 최소한의 개인정보를 수집하고 있습니다<span lang=EN-US>.&nbsp;<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1;
background:white'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;color:black;
mso-themecolor:text1;background:white'>회원가입 필수 항목 <span lang=EN-US>: </span>이름<span
lang=EN-US>, </span>생년월일<span lang=EN-US>, </span>이메일<span lang=EN-US>, </span>아이디<span
lang=EN-US>, </span>패스워드<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;color:black;
mso-themecolor:text1;background:white'>회원가입 선택 항목 <span lang=EN-US>: </span>페이스북
계정<span lang=EN-US>, </span>전화번호<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:17.65pt;
mso-pagination:widow-orphan;background:white;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>서비스 이용과정이나 사업처리 과정에서 아래와
같은 정보들이 자동으로 생성되어 수집될 수 있습니다<span lang=EN-US>.&nbsp;<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:18.0pt;mso-char-indent-count:2.0;line-height:normal;
mso-pagination:widow-orphan;background:white;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US style='font-size:9.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>IP
Address, </span><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>쿠키<span lang=EN-US>, </span>방문
일시<span lang=EN-US>, </span>서비스 이용기록<span lang=EN-US>, </span>기기정보<span
lang=EN-US>, </span>위치정보<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:17.65pt;
mso-pagination:widow-orphan;background:white;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>유료 서비스 이용 과정에서 아래와 같은
결제 정보들이 수집될 수 있습니다<span lang=EN-US>.&nbsp;<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:18.0pt;mso-char-indent-count:2.0;line-height:normal;
mso-pagination:widow-orphan;background:white;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>신용카드 결제시<span
lang=EN-US> : </span>카드사명<span lang=EN-US>, </span>카드번호 등<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>2. </span></b><b><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>개인정보의 수집
방법<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US style='font-size:9.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>회원가입<span lang=EN-US>,
</span>이벤트 응모<span lang=EN-US>, </span>생성정보 수집 등을 통한 수집<span lang=EN-US>, </span>회원정보
수정<span lang=EN-US>, </span>팩스<span lang=EN-US>, </span>전화<span lang=EN-US>, </span>고객센터
문의하기<span lang=EN-US>, </span>애플리케이션을 실행 또는 사용함으로써 자동으로 수집<span lang=EN-US>, </span>서비스
가입이나 사용 중 이용자의 자발적 제공을 통한 수집될 수 있습니다<span lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>3. </span></b><b><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>개인정보의 제<span
lang=EN-US>3</span>자 제공<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>&quot;</span><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>회사<span lang=EN-US>&quot;</span>는 원칙적으로
수집 및 이용목적 범위를 넘어 회원님의 개인정보를 제<span lang=EN-US> 3</span>자에게 제공하지 않습니다<span
lang=EN-US>.&nbsp;<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;background:white;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>다만 원활한 </span><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1;
background:white'>샵 예약 서비스 제공을 위해 회사는 회원의 개인정보를 제<span lang=EN-US>3</span>자에게 제공합니다<span
lang=EN-US>. </span>서비스를 위한 최소한의 정보만을 제공하여야 하며<span lang=EN-US>, </span>서비스와 관계없는
자에게 어떤 정보도 제공할 수 없습니다<span lang=EN-US>. </span>제공하는 정보는 아래와 같습니다<span
lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:
text1;background:white'><o:p>&nbsp;</o:p></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>정보를 제공받는
자<span lang=EN-US><o:p></o:p></span></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>회원이 예약한
샵의 예약 담당자<span lang=EN-US><o:p></o:p></span></span></p>

<p style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:11.35pt;
margin-bottom:.0001pt;line-height:13.5pt;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>&nbsp;<o:p></o:p></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>정보를 목적<span
lang=EN-US><o:p></o:p></span></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>예약 중계 및
본인 확인<span lang=EN-US>.<o:p></o:p></span></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:
text1'><o:p>&nbsp;</o:p></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>제공하는 정보<span
lang=EN-US><o:p></o:p></span></span></p>

<p style='margin:0cm;margin-bottom:.0001pt;line-height:13.5pt;background:white'><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1'>이름<span
lang=EN-US>, </span>아이디<span lang=EN-US>, </span>전화번호<span lang=EN-US>, </span>예약정보<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><br style='mso-special-character:
line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]></span><span lang=EN-US style='mso-bidi-font-size:10.0pt;font-family:
돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:
0pt;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><b><span
lang=EN-US style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>4. </span></b><b><span
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>개인정보의 보유 및 이용기간</span></b><b
style='mso-bidi-font-weight:normal'><span lang=EN-US style='font-size:9.0pt;
font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:9.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;background:white;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:
굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>이용자의 개인정보는 원칙적으로 개인정보의
수집 및 이용목적이 달성되면 지체 없이 파기합니다<span lang=EN-US>. </span>단<span lang=EN-US>, </span>다음의
정보에 대해서는 아래의 보존 이유를 위해 명시한 기간 동안 보존합니다<span lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>관계 법령에 의한 정보보유 사유<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>상법<span lang=EN-US>, </span>전자상거래 등에서의
소비자보호에 관한 법률 등 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계 법령에서 정한 일정한 기간 동안 회원정보를 보관합니다<span
lang=EN-US>. </span>이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다<span
lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>계약 또는 청약철회 등에 관한 기록<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 근거<span lang=EN-US> : </span>전자상거래
등에서의 소비자보호에 관한 법률<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 기간<span lang=EN-US> : 5</span>년<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>대금결제 및 재화 등의 공급에 관한 기록<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 근거<span lang=EN-US> : </span>전자상거래
등에서의 소비자보호에 관한 법률<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 기간<span lang=EN-US> : 5</span>년<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>전자금융 거래에 관한 기록<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 근거<span lang=EN-US> : </span>전자금융거래법<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 기간<span lang=EN-US> : 5</span>년<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>소비자의 불만 또는 분쟁처리에 관한 기록<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 근거<span lang=EN-US> : </span>전자상거래
등에서의 소비자보호에 관한 법률<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 기간<span lang=EN-US> : 3</span>년<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>본인 확인에 관한 기록<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 근거<span lang=EN-US> : </span>정보통신망
이용촉진 및 정보보호 등에 관한 법률<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;
mso-themecolor:text1;mso-font-kerning:0pt'>보존 기간<span lang=EN-US>: 3</span>개월<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;background:white;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'><span
lang=EN-US style='font-size:9.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>5. </span></b><b><span
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>개인정보의 파기절차 및 방법</span></b><b
style='mso-bidi-font-weight:normal'><span lang=EN-US style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt'><br style='mso-special-character:line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]><o:p></o:p></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:10.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='mso-bidi-font-size:10.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>회사는
이용자의 개인정보를 원칙적으로 보유·이용기간의 경과<span lang=EN-US>, </span>처리목적 달성 등 개인정보가 불필요하게 되었을
때에는 지체 없이 해당 개인정보를 파기합니다<span lang=EN-US>.<br style='mso-special-character:
line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:10.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='mso-bidi-font-size:10.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt'>이용자로부터
동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는 해당 개인정보를
별도의 데이터베이스<span lang=EN-US>(DB)</span>로 옮기거나 보관장소를 달리하여 보존합니다<span lang=EN-US>.<br
style='mso-special-character:line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt'>개인정보 파기의 절차 및 방법은 다음과 같습니다<span lang=EN-US>.<br>
</span>① 파기절차<span lang=EN-US><br>
</span>회사는 파기 사유가 발생한 개인정보를 개인정보 보호책임자의 승인 절차를 거쳐 파기합니다<span lang=EN-US>.<br
style='mso-special-character:line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt'>② 파기방법<span lang=EN-US><br>
</span>회사는 전자적 파일형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 기술적인 방법 또는 물리적인 방법을 이용하여 파기하며<span
lang=EN-US>, </span>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각 등을 통하여 파기합니다<span lang=EN-US>.<br
style='mso-special-character:line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]><span style='mso-bidi-font-weight:bold'><o:p></o:p></span></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>6. </span></b><b><span
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>개인정보 제공<span lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>회사는 이용자들의 개인정보를<span
lang=EN-US> &quot;</span></span><span lang=EN-US style='font-size:9.0pt;
font-family:돋움;color:black;mso-themecolor:text1;mso-bidi-font-weight:bold'>1. </span><span
style='font-size:9.0pt;font-family:돋움;color:black;mso-themecolor:text1;
mso-bidi-font-weight:bold'>개인정보의 수집 및 이용 목적</span><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'>&quot;</span><span style='mso-bidi-font-size:10.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt;
mso-bidi-font-weight:bold'>에서 고지한 범위 내에서 사용하며<span lang=EN-US>, </span>이용자의 사전 동의
없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다<span lang=EN-US>. </span>단<span
lang=EN-US>, </span>다음의 경우에는 주의를 기울여 개인정보를 이용 및 제공할 수 있습니다<span lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>이용자들이 사전에 공개에 동의한 경우<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>예약<span lang=EN-US>, </span>결제 등의
목적으로 인하여 서비스와 관련된 타 업체에 개인 정보의 전달이 필요한 경우<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>법령 및 규정에 의거하거나<span lang=EN-US>,
</span>수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<span lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>7. </span></b><b><span
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>개인정보에 관한 민원서비스<span
lang=EN-US><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;text-indent:10.0pt;mso-char-indent-count:1.0;line-height:normal;
mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span style='mso-bidi-font-size:10.0pt;font-family:돋움;
mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;mso-font-kerning:0pt;
mso-bidi-font-weight:bold'>회사는 이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자를
지정하고 있습니다<span lang=EN-US>. </span>이용자는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자에게
신고할 수 있습니다<span lang=EN-US>. </span>회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다<span
lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>개인정보관리책임자 성명<span lang=EN-US>: </span>장제동<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>고객서비스담당부서<span lang=EN-US>: CS</span>팀<span
lang=EN-US><o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>전화번호<span lang=EN-US>: 1522 -
4159<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>이메일<span lang=EN-US> : helpdesk@nailduck.com<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는
아래 기관에 문의하시기 바랍니다<span lang=EN-US>.<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>개인정보침해신고센터<span lang=EN-US>
(privacy.kisa.or.kr / </span>국번없이<span lang=EN-US> 118)<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>대검찰청 사이버범죄수사단<span lang=EN-US>
(www.spo.go.kr / 02-3480-3571)<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span style='mso-bidi-font-size:
10.0pt;font-family:돋움;mso-bidi-font-family:굴림;color:black;mso-themecolor:text1;
mso-font-kerning:0pt;mso-bidi-font-weight:bold'>경찰청 사이버안전국<span lang=EN-US>
(www.ctrc.go.kr / </span>국번없이<span lang=EN-US> 182)<o:p></o:p></span></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:left;line-height:normal;mso-pagination:widow-orphan;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><b><span lang=EN-US
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>8.</span></b><b><span
style='mso-bidi-font-size:10.0pt;font-family:돋움;mso-bidi-font-family:굴림;
color:black;mso-themecolor:text1;mso-font-kerning:0pt'>고지의 의무<span lang=EN-US><o:p></o:p></span></span></b></p>

<p style='margin:0cm;margin-bottom:.0001pt;text-indent:9.0pt;mso-char-indent-count:
1.0;background:white'><span style='font-size:9.0pt;font-family:돋움;color:black'>이
개인정보취급방침은<span lang=EN-US> 2016</span>년 <span lang=EN-US>1</span>월 <span
lang=EN-US>1</span>일부터 적용되며<span lang=EN-US>, </span>법령<span lang=EN-US>. </span>정책
또는 보안기술의 변경에 따라 내용의 추가<span lang=EN-US>. </span>삭제 및 수정이 있을 시에는 변경사항의 시행일의<span
lang=EN-US> 7</span>일 전부터 회사 사이트의 공지사항을 통하여 고지할 것 입니다<span lang=EN-US>.<o:p></o:p></span></span></p>

</div>

</body>
</html>