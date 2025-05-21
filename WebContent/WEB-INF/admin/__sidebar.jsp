<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${pageContext.request.contextPath }">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Manage</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="true" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                Contacts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav px-0">
                                    <a class="nav-link" href="${pageContext.request.contextPath }/sudo/listing/contact"><i class="fa fa-users me-1"></i> All Contacts</a>
                                    <a class="nav-link" href="${pageContext.request.contextPath }/sudo/create/contact"><i class="fa fa-user-plus me-1"></i> Add new</a>
                                </nav>
                            </div>
                            
                            
                            <div class="sb-sidenav-menu-heading">Site</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/deployment/context">
                                <div class="sb-nav-link-icon"><i class="fas fa-server me-1"></i></div>
                                Context Manager
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/endpoints">
                                <div class="sb-nav-link-icon"><i class="fas fa-wifi me-1"></i></div>
                                URL Discovery
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Admin
                    </div>
                </nav>
            </div>

