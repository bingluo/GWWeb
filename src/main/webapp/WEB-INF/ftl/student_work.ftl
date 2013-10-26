<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>东南大学公共卫生学院 : 学生工作</title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/student_work.css">
    <script type="text/javascript" src="${rc.getContextPath()}/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<div class="main">
<div class="header">
    <div class="logo"><img src="${rc.getContextPath()}/images/sw_seu_logo.gif" width="270" height="100"/></div>
    <div class="nav">
        <div class="litt_nav">
            <ul>
                <li><a href="#">设为首页</a></li>
                <li><a href="#">收藏本站</a></li>
                <li><a href="#">学院论坛</a></li>
                <li><a href="#">旧版登录</a></li>
            </ul>
        </div>
        <!--/litt_nav-->
        <div class="main_nav">
		<#if categories??>
            <ul class="rootNav">
                <li><a href="${rc.getContextPath()}/index">首页</a></li>
                <li class="shows"><a href="${rc.getContextPath()}/courseIntro/"
                                     onmouseover="showSelect(1)">${courseIntro.title}</a></li>
				<#assign catIndex=2 />
				<#list categories as category>
					<#if category_index+1 < categories?size >
                        <li class="shows">
                            <a href="${rc.getContextPath()}/cat/${category.id}/"
                               onmouseover="showSelect(${catIndex})">${category.title}</a>
                        </li>
						<#assign catIndex=catIndex+1 />
					<#else >
                        <li class="shows">
                            <a href="#" onmouseover="showSelect(${catIndex})">人才培养</a>
                        </li>
						<#assign catIndex=catIndex+1 />
                        <li class="shows">
                            <a href="#" onmouseover="showSelect(${catIndex})">党建工作</a>
                        </li>
						<#assign catIndex=catIndex+1 />
					</#if>
				</#list>
                <li class="shows">
					<#assign catLen=categories?size-1 />
                    <a href="${rc.getContextPath()}/cat/${categories[catLen].id}/"
                       onmouseover="showSelect(${catIndex})">${categories[catLen].title}</a>
                </li>
            </ul>
            <dl class="navtwo navtwo1 shows" id="nav1">
				<#if courseIntro.articleList??>
					<#assign articleCount = 0 />
					<#list courseIntro.articleList as article>
						<#assign articleCount = articleCount+1 />
                        <dd <#if articleCount==courseIntro.articleList?size>class="noborder"</#if>><a
                                href="${rc.getContextPath()}/courseIntro/${article.id}">${article.title}</a></dd>
					</#list>
				</#if>
            </dl>
			<#assign value=1>
			<#list idList as key>
				<#assign value=value+1>
                <dl class="navtwo navtwo${value} shows" id="nav${value}">
					<#assign listCount=0>
					<#if categorySections[key]??>
						<#assign sections=categorySections[key] />
						<#list sections as section>
							<#assign listCount=listCount+1>
                            <dd <#if listCount==sections?size>class="noborder"</#if>>
                                <a href="${rc.getContextPath()}/cat/${key}/section/${section.id}/">${section.title}</a>
                            </dd>
						</#list>
					</#if>
                </dl>
				<#if idList?size == key_index+2>
					<#assign value=value+1>
                    <dl class="navtwo navtwo${value} shows" id="nav${value}">
                        <dd>
                            <a href="${rc.getContextPath()}/cat/10/">本科生培养</a>
                        </dd>
                        <dd class="noborder">
                            <a href="${rc.getContextPath()}/cat/11/">研究生培养</a>
                        </dd>
                    </dl>
					<#assign value=value+1>
                    <dl class="navtwo navtwo${value} shows" id="nav${value}">
                        <dd>
                            <a href="${rc.getContextPath()}/cat/12/">党建工作</a>
                        </dd>
                        <dd class="noborder">
                            <a href="${rc.getContextPath()}/cat/13/">工会工作</a>
                        </dd>
                    </dl>
				</#if>
			</#list>
		</#if>
        </div>
        <!--/main_nav-->
    </div>
    <!--/nav-->
</div>
<div class="post"><img src="${rc.getContextPath()}/images/post.jpg" width="794" height="150"/></div>
<div class="container">
    <div class="wraper">
        <div class="notice_tit"></div>
        <div>
            <ul class="update">
			<#if 学术报告??>
				<#list 学术报告.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${article.id}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraper">
        <div class="regular_tit"></div>
        <div>
            <ul class="update">
			<#if 日常管理??>
				<#list 日常管理.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${article.id}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraper">
        <div class="party_tit"></div>
        <div>
            <ul class="update">
			<#if 党团建设??>
				<#list 党团建设.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${article.id}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="student_tit"></div>
        <div>
            <ul class="update">
			<#if 学生活动??>
				<#list 学生活动.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${article.id}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="graduate_tit"></div>
        <div>
            <ul class="update">
			<#if 升学实习就业??>
				<#list 升学实习就业.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${article.id}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="master_tit"></div>
        <div>
            <ul class="update">
			<#if 研究生??>
				<#list 研究生.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${article.id}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="friend_link">
        <form name="myForm">
            <select>
                <option selected="selected">友情文字链接站点</option>
            </select>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("div").not($(".main_nav")).hover(function(){
            $("dl").css("display","none");
        });

        $(".rootNav li").first().hover(function(){
            $("dl").css("display","none");
        });

    });
    function showSelect(id) {
        for (i = 1; i <= 7; i++) {
            if (i == id) {
                document.getElementById("nav" + i).style.display = "block";
            } else {
                document.getElementById("nav" + i).style.display = "none";
            }
        }
    }
</script>
</body>
</html>