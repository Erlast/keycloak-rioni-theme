<#import "template.ftl" as layout>
<#import "environment.ftl" as env>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
<#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/common.js"></script>
    <script type="module" src="${url.resourcesPath}/js/login-update-password.js"></script>
    <@env.environment formsMode="login" restartUrl=true />
</#if>
</@layout.registrationLayout>
