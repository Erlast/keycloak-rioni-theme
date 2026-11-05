<#import "environment.ftl" as env>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true loginAction=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="referrer" content="no-referrer" />
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, width=device-width">
    
    <title>${(realm.displayName!'Личный кабинет')}</title>
 
    <link rel="icon" href="${url.resourcesPath}/img/favicon32.png">
    <link rel="stylesheet" href="${url.resourcesPath}/css/default.css">
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css">
    
    <style>
       @font-face {
         font-family: 'Plus Jakarta Sans';
         src: url('${url.resourcesPath}/fonts/webfonts/PlusJakartaSans-Regular.woff2') format('woff2');
         font-weight: normal;
         font-style: normal;
       }
       
       @font-face {
         font-family: 'Plus Jakarta Sans';
         src: url('${url.resourcesPath}/fonts/webfonts/PlusJakartaSans-Bold.woff2') format('woff2');
         font-weight: bold;
         font-style: normal;
       }
       
       @font-face {
         font-family: 'Plus Jakarta Sans';
         src: url('${url.resourcesPath}/fonts/webfonts/PlusJakartaSans-Italic.woff2') format('woff2');
         font-style: italic;
         font-weight: normal;
       }
       
       @font-face {
         font-family: 'Plus Jakarta Sans';
         src: url('${url.resourcesPath}/fonts/webfonts/PlusJakartaSans-SemiBold.woff2') format('woff2');
         font-style: normal;
         font-weight: 600;
       }
       
       @font-face {
         font-family: 'Plus Jakarta Sans';
         src: url('${url.resourcesPath}/fonts/webfonts/PlusJakartaSans-Medium.woff2') format('woff2');
         font-style: normal;
         font-weight: 700;
       }

        </style>
   
    <#nested "head">
</head>
<body>
  <div id="app"></div>
  <@env.environment loginPassword=false restartUrl=true clientBaseUrl=true formsMode="template" validationsMode="empty" messageMode="display" socialMode="emptyString" displayMessage=displayMessage emptyLoginAction=!loginAction />
  <#nested "scripts">
</body>
</html>
</#macro>
