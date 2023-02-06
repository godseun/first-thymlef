<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
out.print(org.json.simple.JSONValue.toJSONString( "{  'ibupload':  { 'file1_0':'20160330_103204' },  'etcdata':  {  'name' : '실험 데이타' ,        'content' : '실험 데이타입니다.' ,        'content2' : '실험 데이타2입니다.'  } }" ));
%>