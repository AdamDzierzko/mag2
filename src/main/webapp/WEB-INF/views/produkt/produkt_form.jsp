<%@ taglib prefix="for" uri="http://www.springframework.org/tags/form" %>

<div class="form-group">
    <form:hidden path="id"/>
    <for:label path="nazwa">Nazwa</for:label>
    <form:input path="nazwa" cssClass="form-control"/>
    <p class="form-group has-error">
        <form:errors path="nazwa" element="label" cssClass="control-label help-block"/>
    <p/>
</div>
<div class="form-group">
    <for:label path="numerSeryjny">Numer seryjny</for:label>
    <form:input path="numerSeryjny" cssClass="form-control"/>
    <p class="form-group has-error">
        <form:errors path="numerSeryjny" element="label" cssClass="control-label help-block"/>
    <p/>
</div>
<div class="form-group">
    <for:label path="stanProduktu">Stan produktu</for:label>
    <form:select itemLabel="stan" path="stanProduktu" cssClass="form-control" items="${stanyProduktu}"/>
</div>
<div class="form-group">
    <for:label path="user">Uzytkownik</for:label>
    <form:select itemLabel="name" path="user" cssClass="form-control" items="${users}"/>
</div>
<div class="form-group">
    <for:label path="typProduktu">Typ Produktu</for:label>
    <form:select itemLabel="typ" path="typProduktu" cssClass="form-control" items="${typyProduktu}"/>
</div>

<button type="submit" class="btn btn-default">Submit</button>