<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="/WEB-INF/tags/functions.tld" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>

    <title><sitemesh:write property="title"/></title>
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css"/>

</head>
<body>

<nav id="menu-wrap">
    <ul id="menu">
        <li><a href="/">Главная</a></li>

        <li>
            <a href="">Найти игру</a>
            <ul>
                <li>
                    <a href="">HTML/CSS</a>
                </li>
                <li>
                    <a href="">Графика</a>
                </li>

                <li>
                    <a href="">Разработка</a>
                </li>
                <li>
                    <a href="">Веб дизайн</a>
                </li>
            </ul>
        </li>

        <li><a href="">О Сайте</a></li>
        <li><a href="">Контакты</a></li>
        <sec:authorize access="isAnonymous()">
            <li><label class="btn-label" for="modal-1">Вход</label></li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li>
                <a href="">${username}</a>
                <ul>

                    <li>
                        <a href="">Пункт 1</a>

                    </li>
                    <li>
                        <a href="">Пункт 2</a>

                    </li>
                    <li>
                        <a href="/logout">Выход</a>

                    </li>
                </ul>
            </li>
        </sec:authorize>

    </ul>
</nav>

<sitemesh:write property="body"/>
<div class="footer">
    ${f:getMessage("footer.message")}
</div>

<div class="modal">
    <input type="checkbox" class="modal-open" id="modal-1" hidden/>

    <div class="modal-wrap" aria-hidden="true" role="dialog">
        <label for="modal-1" class="modal-overlay"></label>

        <div class="modal-dialog">
            <div class="modal-header">
                <h2>Войдите или <label class="btn-label" for="modal-2">зарегистрируйтесь</label></h2>
                <label for="modal-1" class="btn-close" aria-hidden="true">×</label>
            </div>
            <div class="modal-body">
                <form action="/login" method="post">
                    <input name="username" placeholder="${f:getMessage("form.placeholder.username")}" class="textbox"
                           required/>
                    <input name="password" placeholder="${f:getMessage("form.placeholder.password")}" class="textbox"
                           type="password" required/>
                    <input name="remember-me" id="check" type="checkbox" checked="checked"/>
                    <label for="check">${f:getMessage("form.remember")}</label>

                    <input name="submit" class="btn btn-form" type="submit" value="${f:getMessage("form.submit")}"/>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal">
    <input type="checkbox" class="modal-open" id="modal-2" hidden/>

    <div class="modal-wrap" aria-hidden="true" role="dialog">
        <label for="modal-2" class="modal-overlay"></label>

        <div class="modal-dialog">
            <div class="modal-header">
                <h2>Регистрация</h2>
                <label for="modal-2" class="btn-close" aria-hidden="true">×</label>
            </div>
            <div class="modal-body">
                <form action="/user/add" method="post">
                    <input name="username" placeholder="${f:getMessage("form.placeholder.username")}" class="textbox"
                           required/>
                    <input name="email" placeholder="${f:getMessage("form.placeholder.email")}" class="textbox"
                           type="email" required/>
                    <input name="password" placeholder="${f:getMessage("form.placeholder.password")}" class="textbox"
                           type="password" required/>
                    <input name="submit" class="btn btn-form" type="submit" value="${f:getMessage('form.submit')}"/>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
