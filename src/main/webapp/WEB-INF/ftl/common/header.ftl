<div class="header">
    <div class="logo"><img src="${rc.getContextPath()}/images/logo.gif" width="270" height="100"/></div>
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
</div><!--/header-->