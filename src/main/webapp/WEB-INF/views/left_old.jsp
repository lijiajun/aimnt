<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<ul class="page-sidebar-menu  page-header-fixed "
			data-keep-expanded="false" data-auto-scroll="true"
			data-slide-speed="200" style="padding-top: 20px">
			<li class="sidebar-toggler-wrapper hide">
				<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				<div class="sidebar-toggler"></div> <!-- END SIDEBAR TOGGLER BUTTON -->
			</li>
			<li class="sidebar-search-wrapper">
				<form class="sidebar-search" action="page_general_search_3.html"
					method="POST">
					<a href="javascript:;" class="remove"> <i class="icon-close"></i>
					</a>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn"> <a href="javascript:;"
							class="btn submit"> <i class="icon-magnifier"></i>
						</a>
						</span>
					</div>
				</form>
			</li>
			<li class="nav-item start active open">
				<a href="login" class="nav-link nav-toggle">
					<i class="icon-home"></i>
					<span class="title">主页</span>
					<span class="selected"></span>
				</a>
			</li>
			<li class="heading">
				<h3 class="uppercase">Features</h3>
			</li>
			<li class="nav-item">
				<a href="javascript:;" class="nav-link nav-toggle">
					<i class="icon-diamond"></i>
					<span class="title">基础信息管理</span>
					<span class="arrow"></span>
				</a>
				<ul class="sub-menu">
					<li class="nav-item">
						<a href="static/html/index.html" class="nav-link">
						<span class="title">产品管理</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="login" class="nav-link">
						<span class="title">版本管理</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="javascript:;" class="nav-link nav-toggle">
							<span class="title">二级菜单</span>
							<span class="arrow"></span>
						</a>
						<ul class="sub-menu">
							<li class="nav-item">
								<a href="login" class="nav-link"> 三级菜单1 </a>
							</li>
							<li class="nav-item ">
								<a href="ui_page_progress_style_2.html" class="nav-link "> 三级菜单2 </a>
							</li>
						</ul>
					</li>
				</ul>
			</li>
			<li class="nav-item">
				<a href="javascript:;" class="nav-link nav-toggle">
					<i class="icon-bulb"></i>
					<span class="title">Elements</span>
					<span class="arrow"></span>
				</a>
				<ul class="sub-menu">
					<li class="nav-item">
						<a href="login" class="nav-link">
						<span class="title">Steps</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="elements_lists.html" class="nav-link">
						<span class="title">Lists</span>
						</a>
					</li>
				</ul>
			</li>

			<li class="heading">
				<h3 class="uppercase">Pages</h3>
			</li>
			<li class="nav-item"><a href="javascript:;"
				class="nav-link nav-toggle"> <i class="icon-settings"></i> <span
					class="title">System</span> <span class="selected"></span> <span
					class="arrow"></span>
			</a>
				<ul class="sub-menu">
					<li class="nav-item  "><a href="page_system_coming_soon.html"
						class="nav-link " target="_blank"> <span class="title">Coming
								Soon</span>
					</a></li>
					<li class="nav-item  "><a href="page_system_404_1.html"
						class="nav-link "> <span class="title">404 Page 1</span>
					</a></li>
					<li class="nav-item  "><a href="page_system_404_2.html"
						class="nav-link " target="_blank"> <span class="title">404
								Page 2</span>
					</a></li>
					<li class="nav-item  "><a href="page_system_404_3.html"
						class="nav-link " target="_blank"> <span class="title">404
								Page 3</span>
					</a></li>
					<li class="nav-item  active open"><a
						href="page_system_500_1.html" class="nav-link "> <span
							class="title">500 Page 1</span> <span class="selected"></span>
					</a></li>
					<li class="nav-item  "><a href="page_system_500_2.html"
						class="nav-link " target="_blank"> <span class="title">500
								Page 2</span>
					</a></li>
				</ul></li>
			<li class="nav-item"><a href="javascript:;"
				class="nav-link nav-toggle"> <i class="icon-folder"></i> <span
					class="title">Multi Level Menu</span> <span class="arrow "></span>
			</a>
				<ul class="sub-menu">
					<li class="nav-item"><a href="javascript:;"
						class="nav-link nav-toggle"> <i class="icon-settings"></i>
							Item 1 <span class="arrow"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item"><a href="javascript:;" target="_blank"
								class="nav-link"> <i class="icon-user"></i> Arrow Toggle <span
									class="arrow nav-toggle"></span>
							</a>
								<ul class="sub-menu">
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="icon-power"></i> Sample Link 1
									</a></li>
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="icon-paper-plane"></i> Sample Link 1
									</a></li>
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="icon-star"></i> Sample Link 1
									</a></li>
								</ul></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="icon-camera"></i> Sample Link 1
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="icon-link"></i> Sample Link 2
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="icon-pointer"></i> Sample Link 3
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="javascript:;" target="_blank"
						class="nav-link"> <i class="icon-globe"></i> Arrow Toggle <span
							class="arrow nav-toggle"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="icon-tag"></i> Sample Link 1
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="icon-pencil"></i> Sample Link 1
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="icon-graph"></i> Sample Link 1
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="icon-bar-chart"></i> Item 3
					</a></li>
				</ul></li>
		</ul>
	</div>
</div>
<!-- END SIDEBAR -->