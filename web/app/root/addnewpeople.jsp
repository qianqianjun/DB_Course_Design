<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="添加人员"></jsp:param>
</jsp:include>
<div class="container">
    <div class="row clearfix" style="margin-top: 30px;padding-left: 20px">
        <div class="detail_title">
            添加人员
        </div>
        <div class="col-md-12 column" style="margin-top: 50px;">
            <div class="col-md-5 column">
                <h3>添加学生</h3>
                <form role="form" action="${pageContext.request.contextPath}/addpeople" method="post" style="margin-top: 20px;">
                    <input type="hidden" value="student" name="type">
                    <div class="form-group">
                        <label for="sno">学号</label>
                        <input type="text" class="form-control" id="sno" name="sno" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="sname">姓名</label>
                        <input type="text" class="form-control" id="sname" name="sname" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="sexsssss">性别</label>
                        <select class="form-control" id="sexsssss" name="sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="class">班级</label>
                        <input type="text" class="form-control" id="class" name="klass" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="major">专业</label>
                        <input type="text" class="form-control" id="major" name="major" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="college" style="margin-right: 20px;">学院</label>
                        <select class="form-control college-search" id="college" name="college">
                            <option value="信息科学与技术学院">信息科学与技术学院</option>
                            <option value="化工学院">化工学院</option>
                            <option value="材料学院">材料学院</option>
                            <option value="机电学院">机电学院</option>
                            <option value="理学院">理学院</option>
                            <option value="文法学院">文法学院</option>
                            <option value="经济管理学院">经济管理学院</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
            <div class="col-md-1 column"></div>
            <div class="col-md-5 column">
                <h3>添加教师</h3>
                <form role="form" action="${pageContext.request.contextPath}/addpeople" method="post" style="margin-top: 20px;">
                    <input type="hidden" value="teacher" name="type">
                    <div class="form-group">
                        <label for="tno">工号</label>
                        <input type="text" class="form-control" id="tno" name="tno" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="tname">姓名</label>
                        <input type="text" class="form-control" id="tname" name="tname" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="sexssss">性别</label>
                        <select class="form-control" id="sexssss" name="sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="rank">职称</label>
                        <select class="form-control" id="rank" name="rank">
                            <option value="教授">教授</option>
                            <option value="副教授">副教授</option>
                            <option value="讲师">讲师</option>
                            <option value="助教">助教</option>
                            <option value="工程师">工程师</option>
                            <option value="">暂无职称</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tdept" style="margin-right: 20px;">部门</label>
                        <select class="form-control college-search" id="tdept" name="tdept">
                            <option value="信息科学与技术学院">信息科学与技术学院</option>
                            <option value="化工学院">化工学院</option>
                            <option value="材料学院">材料学院</option>
                            <option value="机电学院">机电学院</option>
                            <option value="理学院">理学院</option>
                            <option value="文法学院">文法学院</option>
                            <option value="经济管理学院">经济管理学院</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="location1" style="margin-right: 20px;">地址</label>
                        <select class="form-control college-search" id="location1" name="location1" style="width: 40%;">
                            <option value="昌平校区图书馆">昌平校区图书馆</option>
                            <option value="昌平校区实验楼A">昌平校区实验楼A</option>
                            <option value="昌平校区实验楼B">昌平校区实验楼B</option>
                            <option value="昌平校区实验楼C">昌平校区实验楼C</option>
                            <option value="昌平校区实验楼D">昌平校区实验楼D</option>
                            <option value="昌平校区后勤楼">昌平校区后勤楼</option>
                            <option value="东校区图书馆">东校区图书馆</option>
                            <option value="东校区科技大厦">东校区科技大厦</option>
                        </select>
                        <input type="text"
                               style="width: 40%;margin-left: 15px;display: inline-block;height: 34px;"
                               placeholder="详细地址"
                               class="form-control" id="location2" name="location2" required="required"/>

                    </div>
                    <div class="form-group">
                        <label for="phone">联系电话</label>
                        <input type="text" class="form-control" id="phone" name="phone" required="required"/>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/htmlFooter.jsp"%>