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
        <#if categories??>
            <ul class="rootNav">
                <li><a href="${rc.getContextPath()}/index">首页</a></li>
                <li class="shows"><a href="${rc.getContextPath()}/courseIntro/" onmouseover="showSelect(1)">${courseIntro.title}</a></li>
                <#assign catIndex=2 />
                <#list categories as category>
                    <li class="shows">
                        <a href="${rc.getContextPath()}/cat/${category.id}/" onmouseover="showSelect(${catIndex})">${category.title}</a>
                    </li>
                    <#assign catIndex=catIndex+1 />
                </#list>
            </ul>
            <dl class="navtwo navtwo1 shows" id="nav1">
                <#if courseIntro.articleList??>
                    <#assign articleCount = 0 />
                    <#list courseIntro.articleList as article>
                        <#assign articleCount = articleCount+1 />
                        <dd <#if articleCount==courseIntro.articleList?size>class="noborder"</#if>><a href="${rc.getContextPath()}/courseIntro/${article.id}">${article.title}</a></dd>
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
                            <dd <#if listCount==sections?size>class="noborder"</#if>><a href="${rc.getContextPath()}/cat/${key}/section/${section.id}/">${section.title}</a></dd>
                        </#list>
                    </#if>
                </dl>
            </#list>
        </#if>
        </div><!--/main_nav-->
    </div><!--/nav-->
</div><!--/header-->