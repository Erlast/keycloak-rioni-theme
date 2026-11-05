<#import "template.ftl" as layout>
<#import "environment.ftl" as env>
<@layout.registrationLayout displayMessage=true loginAction=false; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/common.js"></script>
    <script type="module" src="${url.resourcesPath}/js/info.js"></script>
  </#if>
  <@env.environment loginPassword=false restartUrl=true clientBaseUrl=true formsMode="empty" validationsMode="empty" messageMode="display" displayMessage=true socialMode="none" emptyLoginAction=true />
</@layout.registrationLayout>
