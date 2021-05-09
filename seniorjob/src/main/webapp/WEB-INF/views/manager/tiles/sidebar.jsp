<!-- sidebar 구역 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> <!-- taglib : tiles -->   	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

				<ul class="menu">


					<li class='sidebar-title'>관리자 페이지</li>
					<a href="getMain" class='sidebar-link'> <i data-feather="home" width="20"></i> <span>홈페이지 메인으로</span>
					</a>
					
					<li class='sidebar-title'>관리 목록</li>

					<li class="sidebar-item"><a href="./userList"
						class='sidebar-link'> <i data-feather="user" width="20"></i> <span>회원관리</span>
					</a></li>

					<li class="sidebar-item"><a href="./mentoringList"
						class='sidebar-link'> <i data-feather="file-text" width="20"></i> <span>멘토링관리</span>
					</a></li>

					<li class="sidebar-item"><a href="./sumList"
						class='sidebar-link'> <i data-feather="trending-up" width="20"></i>
							<span>매출관리</span>
					</a>

						

				</ul>
