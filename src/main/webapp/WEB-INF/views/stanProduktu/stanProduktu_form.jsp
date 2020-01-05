<div class="form-group">
    <form:hidden path="id"/>
    <form:label path="stan">stan produktu</form:label>
    <form:input cssClass="form-control" path="stan"/>
    <p class="form-group has-error">
        <form:errors path="stan" element="label" cssClass="control-label help-block"/>
    <p/>
</div>

<button type="submit" class="btn btn-default">Submit</button>
