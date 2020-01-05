<div class="form-group">
    <form:hidden path="id"/>
    <form:label path="typ">typ produktu</form:label>
    <form:input cssClass="form-control" path="typ"/>
    <p class="form-group has-error">
        <form:errors path="typ" element="label" cssClass="control-label help-block"/>
    <p/>
</div>

<button type="submit" class="btn btn-default">Submit</button>
