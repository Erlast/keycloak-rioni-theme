<#import "template.ftl" as layout>
<#import "environment.ftl" as env>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/common.js"></script>
    <script type="module" src="${url.resourcesPath}/js/login.js"></script>
  </#if>
  <@env.environment formsMode="login" restartUrl=false />
</@layout.registrationLayout>
