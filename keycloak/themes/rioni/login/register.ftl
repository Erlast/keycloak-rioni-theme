<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/register.js"></script>
  </#if>
</@layout.registrationLayout>
