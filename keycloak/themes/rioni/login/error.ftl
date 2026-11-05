<#import "template.ftl" as layout>
<#import "environment.ftl" as env>
<@layout.registrationLayout displayMessage=false loginAction=false; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/common.js"></script>
    <script type="module" src="${url.resourcesPath}/js/error.js"></script>
  </#if>
  <@env.environment emptyLoginAction=true loginPassword=false restartUrl=true clientBaseUrl=true formsMode="empty" validationsMode="empty" messageMode="error" socialMode="none" />
</@layout.registrationLayout>
