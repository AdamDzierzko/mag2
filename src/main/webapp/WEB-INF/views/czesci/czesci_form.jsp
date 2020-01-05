<div class="form-group">
    <form:hidden path="id"/>
    <form:label path="nazwa">nazwa elementu</form:label>
    <form:input cssClass="form-control" path="nazwa"/>
    <p class="form-group has-error">
        <form:errors path="nazwa" element="label" cssClass="control-label help-block"/>
    <p/>
</div>
<div class="form-group">
    <form:label path="ilosc">ilosc elementow</form:label>
    <form:input cssClass="form-control" path="ilosc"/>
    <p class="form-group has-error">
        <form:errors path="ilosc" element="label" cssClass="control-label help-block"/>
    <p/>
</div>
<div class="form-group">
    <for:label path="user">Uzytkownik</for:label>
    <form:select itemLabel="name" path="user" cssClass="form-control" items="${users}"/>
</div>
<div class="form-group">
    <for:label path="typCzesci">Typ czesci</for:label>
    <form:select itemLabel="typ" path="typCzesci" cssClass="form-control" items="${typCzesci}"/>
</div>

<button type="submit" class="btn btn-default">Submit</button>
