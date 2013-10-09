<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>东南大学公共卫生学院 : 学生工作</title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/student_work.css">
</head>
<body>
<div class="main">
    <div class="header">
        <div class="logo"><img src="${rc.getContextPath()}/images/sw_seu_logo.gif" width="270" height="100" /></div>
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
    </div>
    <div class="post"><img src="${rc.getContextPath()}/images/post.jpg" width="794" height="150"/></div>
    <div class="container">
        <div class="wraper">
            <div class="notice_tit"></div>
            <div>
                <ul class="update">
                <#if studentWorkNews??>
                    <#list studentWorkNews.articleList as article>
                    <li>
                        <div class="title"><a href="${article.id}">${article.title}</a></div>
                        <div class="pdate">${article.createDate?string("MM-dd")}</div>
                        <#if article_index <= 1>
                            <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20" height="11" /></div>
                        </#if>
                    </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div><!--wraper-->
        <div class="wraper">
            <div class="regular_tit"></div>
            <div>
                <ul class="update">
                <#if studentManagement??>
                    <#list studentManagement.articleList as article>
                    <li>
                        <div class="title"><a href="${article.id}">${article.title}</a></div>
                        <div class="pdate">${article.createDate?string("MM-dd")}</div>
                        <#if article_index <= 1>
                            <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20" height="11" /></div>
                        </#if>
                    </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div><!--wraper-->
        <div class="wraper">
            <div class="party_tit"></div>
            <div>
                <ul class="update">
                <#if studentWorkParty??>
                    <#list studentWorkParty.articleList as article>
                    <li>
                        <div class="title"><a href="${article.id}">${article.title}</a></div>
                        <div class="pdate">${article.createDate?string("MM-dd")}</div>
                        <#if article_index <= 1>
                            <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20" height="11" /></div>
                        </#if>
                    </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div><!--wraper-->
        <div class="wraperdown">
            <div class="student_tit"></div>
            <div>
                <ul class="update">
                <#if studentActivities??>
                    <#list studentActivities.articleList as article>
                    <li>
                        <div class="title"><a href="${article.id}">${article.title}</a></div>
                        <div class="pdate">${article.createDate?string("MM-dd")}</div>
                        <#if article_index <= 1>
                            <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20" height="11" /></div>
                        </#if>
                    </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div><!--wraper-->
        <div class="wraperdown">
            <div class="graduate_tit"></div>
            <div>
                <ul class="update">
                <#if studentWorkGraduate??>
                    <#list studentWorkGraduate.articleList as article>
                    <li>
                        <div class="title"><a href="${article.id}">${article.title}</a></div>
                        <div class="pdate">${article.createDate?string("MM-dd")}</div>
                        <#if article_index <= 1>
                            <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20" height="11" /></div>
                        </#if>
                    </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div><!--wraper-->
        <div class="wraperdown">
            <div class="master_tit"></div>
            <div>
                <ul class="update">
                <#if studentWorkMaster??>
                    <#list studentWorkMaster.articleList as article>
                    <li>
                        <div class="title"><a href="${article.id}">${article.title}</a></div>
                        <div class="pdate">${article.createDate?string("MM-dd")}</div>
                        <#if article_index <= 1>
                            <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20" height="11" /></div>
                        </#if>
                    </li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div><!--wraper-->
        <div class="friend_link">
            <form name="myForm">
                <select>
                    <option selected="selected">友情文字链接站点</option>
                </select>
            </form>
        </div>
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