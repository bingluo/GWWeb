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
<div class="post"><img src="${rc.getContextPath()}/images/post.jpg" width="980" height="200"/></div>
<div class="container">
    <div class="wraper">
        <div class="notice_tit" style="cursor: pointer;" <#if 通知公告??>onclick="navTo(${通知公告.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 通知公告??>
				<#if 通知公告.articleList??>
				<#list 通知公告.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${通知公告.id}-${article.id}.html">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraper">
        <div class="regular_tit" style="cursor: pointer;" <#if 日常管理??>onclick="navTo(${日常管理.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 日常管理??>
				<#if 日常管理.articleList??>
				<#list 日常管理.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${日常管理.id}-${article.id}.html">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraper">
        <div class="party_tit" style="cursor: pointer;" <#if 党团建设??>onclick="navTo(${党团建设.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 党团建设??>
				<#if 党团建设.articleList??>
				<#list 党团建设.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${党团建设.id}-${article.id}.html">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="student_tit" style="cursor: pointer;" <#if 学生活动??>onclick="navTo(${学生活动.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 学生活动??>
				<#if 学生活动.articleList??>
				<#list 学生活动.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${学生活动.id}-${article.id}.html">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="graduate_tit" style="cursor: pointer;" <#if 升学实习就业??>onclick="navTo(${升学实习就业.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 升学实习就业??>
				<#if 升学实习就业.articleList??>
				<#list 升学实习就业.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${升学实习就业.id}-${article.id}.html">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="master_tit" style="cursor: pointer;" <#if 研究生??>onclick="navTo(${研究生.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 研究生??>
				<#if 研究生.articleList??>
				<#list 研究生.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${研究生.id}-${article.id}.html">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
</div>
<div class="footer">
    <p class="p1">中国&nbsp;&nbsp;&#8226;&nbsp;南京&nbsp;&#8226;&nbsp;东南大学公共卫生学院</p>
    <p>Copyright&nbsp;&nbsp;2013&nbsp;&nbsp;东南大学公共卫生学院&nbsp;&nbsp;版权所有&nbsp;&nbsp;All&nbsp;&nbsp;Right</p>
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
    function navTo(sectionId) {
        window.location.href = "${rc.getContextPath()}/cat/8/section/" + sectionId+"/";
    }
</script>
</body>
</html>