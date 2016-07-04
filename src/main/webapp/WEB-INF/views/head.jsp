<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-header navbar navbar-fixed-top">
    <div class="page-header-inner ">
        <div class="page-logo">
            <a href="#"> <img src="static/img/mnt_log2.png" alt="logo" class="logo-default" />
            </a>
            <div class="menu-toggler sidebar-toggler"></div>
        </div>
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
<!--                 <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" -->
<!--                     data-hover="dropdown" data-close-others="true"> <i class="icon-bell"></i> <span class="badge badge-default"> 7 </span> -->
<!--                 </a> -->
<!--                     <ul class="dropdown-menu"> -->
<!--                         <li class="external"> -->
<!--                             <h3> -->
<!--                                 <span class="bold">12 pending</span> notifications -->
<!--                             </h3> <a href="page_user_profile_1.html">view all</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283"> -->
<!--                                 <li><a href="javascript:;"> <span class="time">just now</span> <span class="details"> <span class="label label-sm label-icon label-success"> <i -->
<!--                                                 class="fa fa-plus"></i> -->
<!--                                         </span> New user registered. -->
<!--                                     </span> -->
<!--                                 </a></li> -->
<!--                                 <li><a href="javascript:;"> <span class="time">3 mins</span> <span class="details"> <span class="label label-sm label-icon label-danger"> <i -->
<!--                                                 class="fa fa-bolt"></i> -->
<!--                                         </span> Server #12 overloaded. -->
<!--                                     </span> -->
<!--                                 </a></li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                     </ul></li> -->
<!--                 <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" -->
<!--                     data-close-others="true"> <i class="icon-envelope-open"></i> <span class="badge badge-default"> 4 </span> -->
<!--                 </a> -->
<!--                     <ul class="dropdown-menu"> -->
<!--                         <li class="external"> -->
<!--                             <h3> -->
<!--                                 You have <span class="bold">7 New</span> Messages -->
<!--                             </h3> <a href="app_inbox.html">view all</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283"> -->
<!--                                 <li><a href="#"> <span class="photo"> <img src="static/img/avatar/avatar2.jpg" class="img-circle" alt=""> -->
<!--                                     </span> <span class="subject"> <span class="from"> Lisa Wong </span> <span class="time">Just Now </span> -->
<!--                                     </span> <span class="message"> Vivamus sed auctor nibh congue nibh. auctor nibh auctor nibh... </span> -->
<!--                                 </a></li> -->
<!--                                 <li><a href="#"> <span class="photo"> <img src="static/img/avatar/avatar3.jpg" class="img-circle" alt=""> -->
<!--                                     </span> <span class="subject"> <span class="from"> Richard Doe </span> <span class="time">16 mins </span> -->
<!--                                     </span> <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span> -->
<!--                                 </a></li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                     </ul></li> -->
<!--                 <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" -->
<!--                     data-close-others="true"> <i class="icon-calendar"></i> <span class="badge badge-default"> 3 </span> -->
<!--                 </a> -->
<!--                     <ul class="dropdown-menu extended tasks"> -->
<!--                         <li class="external"> -->
<!--                             <h3> -->
<!--                                 You have <span class="bold">12 pending</span> tasks -->
<!--                             </h3> <a href="app_todo.html">view all</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283"> -->
<!--                                 <li><a href="javascript:;"> <span class="task"> <span class="desc">New release v1.2 </span> <span class="percent">30%</span> -->
<!--                                     </span> <span class="progress"> <span style="width: 40%;" class="progress-bar progress-bar-success" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"> -->
<!--                                                 <span class="sr-only">40% Complete</span> -->
<!--                                         </span> -->
<!--                                     </span> -->
<!--                                 </a></li> -->
<!--                                 <li><a href="javascript:;"> <span class="task"> <span class="desc">Application deployment</span> <span class="percent">65%</span> -->
<!--                                     </span> <span class="progress"> <span style="width: 65%;" class="progress-bar progress-bar-danger" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"> -->
<!--                                                 <span class="sr-only">65% Complete</span> -->
<!--                                         </span> -->
<!--                                     </span> -->
<!--                                 </a></li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                     </ul></li> -->
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" 
                        data-hover="dropdown" data-close-others="true">
                        <img alt="" class="img-circle" src="static/img/avatar/${sysUser.userAvatar}" />
                        <span class="username username-hide-on-mobile">${sysUser.userName}</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a class="priv-page" href="priv/info/page">
                                <i class="icon-user"></i><span>我的资料</span>
                            </a>
                        </li>
                        <li>
                            <a class="priv-page" href="priv/calendar/page">
                                <i class="icon-calendar"></i><span>我的日历</span>
                            </a>
                        </li>
                        <li>
                            <a class="priv-page" href="app_inbox.html">
                                <i class="icon-envelope-open"></i><span>我的消息</span><span class="badge badge-danger">3</span>
                            </a>
                        </li>
                        <li>
                            <a class="priv-page" href="priv/task/page"><i class="icon-rocket"></i><span>我的任务</span>
                                <span class="badge badge-success task-count"> ${taskCount} </span>
                            </a>
                        </li>
                        <li class="divider"></li>
<!--                         <li> -->
<!--                             <a href="page_user_lock_1.html"> -->
<!--                                 <i class="icon-lock"></i> 锁屏 -->
<!--                             </a> -->
<!--                         </li> -->
                        <li>
                            <a href="logout">
                            <i class="icon-key"></i> 退出
                            </a>
                        </li>
                    </ul>
                </li>
<!--                 <li class="dropdown dropdown-quick-sidebar-toggler"> -->
<!--                     <a href="javascript:;" class="dropdown-toggle"> -->
<!--                         <i class="icon-logout"></i> -->
<!--                     </a> -->
<!--                 </li> -->
            </ul>
        </div>
    </div>
</div>

<a href="javascript:;" class="page-quick-sidebar-toggler"> <i class="icon-login"></i>
</a>
<div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
    <div class="page-quick-sidebar">
        <ul class="nav nav-tabs">
            <li class="active"><a href="javascript:;" data-target="#quick_sidebar_tab_1" data-toggle="tab"> 主题 </a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active page-quick-sidebar-chat" id="quick_sidebar_tab_1">
                <div class="page-quick-sidebar-chat-users" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
                    <h3 class="list-heading">主题颜色</h3>
                    <ul class="media-list list-items">
                        <li class="theme-colors color-darkblue" data-style="darkblue"></li>
                        <li class="theme-colors color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey"></li>
                        <li class="theme-colors color-light2 tooltips" data-style="light2" data-container="body" data-html="true" data-original-title="Light 2"></li>
                        <li class="theme-colors color-light tooltips" data-style="light" data-container="body" data-original-title="Light"></li>
                    </ul>
                    <h3 class="list-heading">主题样式</h3>
                    <!--                      <ul class="media-list list-items"> -->
                    <!--                           <li> -->
                    <!--                              <span> 顶部 </span> -->
                    <!--                              <select class="layout-style-option form-control input-sm"> -->
                    <!--                                  <option value="square" selected="selected">固定</option> -->
                    <!--                                  <option value="rounded">不固定</option> -->
                    <!--                              </select> -->
                    <!--                           </li> -->
                    <!--                      </ul> -->
                    <!--                      <ul class="media-list list-items"> -->
                    <!--                           <li> -->
                    <!--                              <span> 左侧 </span> -->
                    <!--                              <select class="layout-style-option form-control input-sm"> -->
                    <!--                                  <option value="square" selected="selected">固定</option> -->
                    <!--                                  <option value="rounded">不固定</option> -->
                    <!--                              </select> -->
                    <!--                           </li> -->
                    <!--                      </ul> -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
</script>