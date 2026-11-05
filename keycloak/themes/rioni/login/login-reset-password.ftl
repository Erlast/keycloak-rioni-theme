<#import "template.ftl" as layout>
<#import "environment.ftl" as env>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
 <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/common.js"></script>
    <script type="module" src="${url.resourcesPath}/js/login-reset-password.js"></script>
  </#if>
  <@env.environment formsMode="login" restartUrl=true />
</@layout.registrationLayout>
