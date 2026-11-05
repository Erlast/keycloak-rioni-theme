<#import "template.ftl" as layout>
<#import "environment.ftl" as env>
<@layout.registrationLayout displayMessage=false; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/common.js"></script>
    <script type="module" src="${url.resourcesPath}/js/login-page-expired.js"></script>
  </#if>
  <@env.environment formsMode="login" restartUrl=true messageMode="empty" />
</@layout.registrationLayout>
