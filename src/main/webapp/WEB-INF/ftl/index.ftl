<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>东南大学公共卫生学院</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="main">
		<div class="header">
			<div class="logo"><img src="images/logo.gif" width="270" height="100" /></div>
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
						<li><a href="#" onmouseover="showSelect(0)">首页</a></li>
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
						<dd <#if article_index == menuItem.articleList?size - 1>class="noborder"</#if>><a href="#">${article.title}</a></dd>
						</#list>
						</#if>
					</#if>
					</dl>
					</#list>
					</#if>
				</div><!--/main_nav-->
			</div><!--/nav-->
		</div><!--/header-->
		<div class="post"><img src="images/post.jpg" width="980" height="200" /></div>
		<div class="container">
			<div class="nleft">
				<div>
					<div class="update_tit"></div>
					<ul class="update">
						<#if recentlyArticleList??>
						<#list recentlyArticleList as article>
						<li>
							<div class="title"><a href="${article.id}">${article.title}</a></div>
							<div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
							<div class="new"><img src="images/news.gif" width="20" height="11" /></div>
							</#if>
						</li>
						</#list>
						</#if>
					</ul>
				</div>
				<div>
					<div class="pic_tit"></div>
					<div class="pic">
						<img src="images/pic1.jpg" width="202" height="138" />
					</div>
					<div class="friend_link">
					<form name="myForm">
						<select>
							<option selected="selected">友情文字链接站点</option>
						</select>
					</form>
					</div>
				</div>
			</div><!--/nleft-->
			<div class="nright">
				<div class="wraper">
					<div class="collage_tit"></div>
					<ul class="update higher">
					<#if collegeNotice??>
						<#list collegeNotice as article>
						<li>
							<div class="title"><a href="${article.id}">${article.title}</a></div>
							<div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
							<div class="new"><img src="images/news.gif" width="20" height="11" /></div>
							</#if>
						</li>
						</#list>
					</#if>
					</ul>
				</div><!--/wraper-->
				<div class="wraper">
					<div class="news_tit"></div>
					<ul class="update higher">
					<#if collegeNews??>
						<#list collegeNews as article>
						<li>
							<div class="title"><a href="${article.id}">${article.title}</a></div>
							<div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
							<div class="new"><img src="images/news.gif" width="20" height="11" /></div>
							</#if>
						</li>
						</#list>
					</#if>
					</ul>
				</div><!--/wraper-->
				<div class="wraper">
					<div class="deu_tit"></div>
					<ul class="update higher">
					<#if teachingAffairs??>
						<#list teachingAffairs as article>
						<li>
							<div class="title"><a href="${article.id}">${article.title}</a></div>
							<div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
							<div class="new"><img src="images/news.gif" width="20" height="11" /></div>
							</#if>
						</li>
						</#list>
					</#if>
					</ul>
				</div><!--/wraper-->
				<div class="wraper">
					<div class="student_tit"></div>
					<ul class="update higher">
					<#if studentWorkNew??>
						<#list studentWorkNew as article>
						<li>
							<div class="title"><a href="${article.id}">${article.title}</a></div>
							<div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
							<div class="new"><img src="images/news.gif" width="20" height="11" /></div>
							</#if>
						</li>
						</#list>
					</#if>
					</ul>
				</div><!--/wraper-->
			</div><!--/nright-->
		</div><!--/container-->
	</div><!--/main-->
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
