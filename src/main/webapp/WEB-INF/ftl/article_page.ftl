<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>东南大学公共卫生学院 <#if currentSection ??> : ${currentSection.title}</#if></title>
<link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/main.css">
<style type="text/css">
.container {
	width: 900px;
}
#nav-left-head {
	padding-bottom: 10px;
}
.nav-left-item {
	padding-bottom: 10px;
	font-size: 15px;
}
#nav-left-head {
	font-size: 15px;
}
#article-title {
	font-size: 20px;
	padding-bottom: 15px;
}
#article-info {
	font-size: 15px;
	font-style: italic;
	padding-bottom: 15px;
}
#article-context {
	font-size: 14px;
}
#article-attachment {
	padding-top: 20px;
}

</style>
</head>
<body>
	<div class="main">
		<div class="header">
			<div class="logo"><img src="${rc.getContextPath()}/images/logo.gif" width="270" height="100" /></div>
			<div class="nav">
				<div class="litt_nav">
					<ul>
						<li><a href="#">设为首页</a></li>
						<li><a href="#">收藏本站</a></li>
						<li><a href="#">学院论坛</a></li>
						<li><a href="#">旧版登录</a></li>
					</ul>
				</div><!--/litt_nav-->
				<div class="main_nav">
					<#if menuList??>
					<ul>
						<li><a href="${rc.getContextPath()}/index">首页</a></li>
						<#list menuList as menuItemId>
						<#if menuSectionMap?has_content && menuSectionMap?keys?seq_contains(menuItemId)>
						<li><a href="#" onmouseover="showSelect(${menuItemId_index + 1})">${menuSectionMap[menuItemId].title}</a></li>
						</#if>
						</#list>
					</ul>
					<#list menuList as menuItemId>
					<#if menuSectionMap?has_content && menuSectionMap?keys?seq_contains(menuItemId)>
					<dl class="navtwo navtwo${menuItemId_index + 1}" id="nav${menuItemId_index + 1}">
					<#assign menuItem = menuSectionMap[menuItemId]>
						<#if menuItem.articleList??>
						<#list menuItem.articleList as article>
						<dd <#if article_index == menuItem.articleList?size - 1>class="noborder"</#if>>
							<a href="${rc.getContextPath()}/pages/${menuItem.id}/articles/${article.id}">${article.title}</a>
						</dd>
						</#list>
						</#if>
					</#if>
					</dl>
					</#list>
					</#if>
				</div><!--/main_nav-->
			</div><!--/nav-->
		</div><!--/header-->
		<div class="container">
			<table>
				<tr>
					<td valign="top" width="250">
						<#if currentSection??>
						<ul id="nav-left">
							<li id="nav-left-head"><img src="${rc.getContextPath()}/images/article_page_list.gif" width="10" height="10" />${currentSection.title}</li>
							<#if currentSection.articleList ??>
							<#list currentSection.articleList as sideArticle>
							<li class="nav-left-item"><a href="${rc.getContextPath()}/pages/${currentSection.id}/articles/${sideArticle.id}">${sideArticle.title}</a></li>
							</#list>
							</#if>
						</#if>
						</ul>
					</td>
					<td valign="top">
                        <#if article ??>
						<p id="article-title">${article.title}</p>
						<p id="article-info">作者：${article.author} , 修改时间：${article.createDate?string("yyyy-MM-dd")}</p>
						<div id="article-context">
						${article.context}
						</div>
						<#if article.attachmentList??>
						<div id="article-attachment">
						<p>附件列表：</p>
						<#list article.attachmentList as attachment>
						<a href ="${attachment}" target="blank">${attachment}</a>
						</#list>
						</div>
						</#if>
                        </#if>
					</td>
				</tr>
			</table><!--list-->
		</div><!--container-->
	</div><!--main-->
	<div class="footer">
		<p class="p1">中国&nbsp;&nbsp;&#8226;&nbsp;南京&nbsp;&#8226;&nbsp;东南大学公共卫生学院</p>
		<p>Copyright&nbsp;&nbsp;2013&nbsp;&nbsp;东南大学公共卫生学院&nbsp;&nbsp;版权所有&nbsp;&nbsp;All&nbsp;&nbsp;Right</p>
	</div>
<script type="text/javascript">
function showSelect(id){
	for(i=1;i<=7;i++){
		if(i==id){
			document.getElementById("nav"+i).style.display="block";
		}else{
			document.getElementById("nav"+i).style.display="none";
		}
	}
}
</script>
</body>
</html>