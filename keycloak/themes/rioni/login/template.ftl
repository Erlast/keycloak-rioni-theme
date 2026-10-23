<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <#--  <title>${msg("loginTitle",(realm.displayName!''))}</title>  -->
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
       } m,,
       
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
  <script id="environment" type="application/json">
    {
      "urls": {
        "loginResetCredentials": "${(url.loginResetCredentialsUrl)!''}",
          "login": "${(url.loginUrl)!''}",
          "registration": "${(url.registrationUrl)!''}",
          "loginAction": "",
          "registrationAction": "${(url.registrationAction)!''}",
          "resourcesPath": "${(url.resourcesPath)!''}"
      },
      "titles": {
        "loginProfileTitle": "${msg("loginProfileTitle")}",
        "loginAccountTitle": "${msg("loginAccountTitle")}",
        "registerTitle": "${msg("registerTitle")}",
        "emailForgotTitle": "${msg("emailForgotTitle")}",
        "confirmLinkIdpTitle": "${msg("confirmLinkIdpTitle")}",
        "emailLinkIdpTitle": "${msg("emailLinkIdpTitle", idpDisplayName)}"
      },
      "permissions": {
        "usernameEditDisabled": <#if usernameEditDisabled??>true<#else>false</#if>,
        "loginWithEmailAllowed": <#if realm.loginWithEmailAllowed>true<#else>false</#if>,
        "registrationEmailAsUsername": <#if realm.registrationEmailAsUsername>true<#else>false</#if>,
        "rememberMe": <#if realm.rememberMe>true<#else>false</#if>,
        "resetPasswordAllowed": <#if realm.resetPasswordAllowed>true<#else>false</#if>,
        "password": "",
        "registrationAllowed": <#if realm.registrationAllowed>true<#else>false</#if>,
        "registrationDisabled": <#if registrationDisabled??>true<#else>false</#if>,
        "passwordRequired": <#if passwordRequired??>true<#else>false</#if>
      },
      "labels": {
        "firstName": "${msg("firstName")}",
        "lastName": "${msg("lastName")}",
        "username": "${msg("username")}",
        "usernameOrEmail": "${msg("usernameOrEmail")}",
        "email": "${msg("email")}",
        "password": "${msg("password")}",
        "passwordConfirm": "${msg("passwordConfirm")}",
        "rememberMe": "${msg("rememberMe")}",
        "doForgotPassword": "${msg("doForgotPassword")}",
        "doLogIn": "${msg("doLogIn")}",
        "doSubmit": "${msg("doSubmit")}",
        "noAccount": "${msg("noAccount")}",
        "doRegister": "${msg("doRegister")}",
        "backToLogin": "${kcSanitize(msg("backToLogin"))?no_esc}",
        "confirmLinkIdpContinue": "${msg("confirmLinkIdpContinue")}",
        "doClickHere": "${msg("doClickHere")}"
      },
      "forms": {
        "loginUsername": "",
        "loginRememberMe": "",
        "selectedCredential": "",
        "registerFirstName": <#if register??>"${(register.formData.firstName!'')}"<#else>""</#if>,
        "registerLastName": <#if register??>"${(register.formData.lastName!'')}"<#else>""</#if>,
        "registerEmail": <#if register??>"${(register.formData.email!'')}"<#else>""</#if>,
        "registerUsername": <#if register??>"${(register.formData.username!'')}"<#else>""</#if>
      },
      "user": {
        "username": <#if user??>"${(user.username!'')}"<#else>""</#if>,
        "email": <#if user??>"${(user.email!'')}"<#else>""</#if>,
        "firstName": <#if user??>"${(user.firstName!'')}"<#else>""</#if>,
        "lastName": <#if user??>"${(user.lastName!'')}"<#else>""</#if>
      },
      "validations": {
        "firstName": "",
        "lastName":  "",
        "email": "",
        "usernameOrPassword": "",
        "username": "",
        "password": "",
        "passwordConfirm": ""
      },
      "message": {
        "type": <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>"${message.type}"<#else>""</#if>,
        "sumary": <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>"${kcSanitize(message.summary)?no_esc}"<#else>""</#if>
      },
      "realm": {
        "displayName": "${(realm.displayName!'')}"
      },
      <#--  "instruction": {
        "emailLinkIdp1": "${msg("emailLinkIdp1", idpDisplayName, brokerContext.username, realm.displayName)}",
        "emailLinkIdp2": "${msg("emailLinkIdp2")}",
        "emailLinkIdp3": "${msg("emailLinkIdp3")}",
        "emailLinkIdp4": "${msg("emailLinkIdp4")}",
        "emailLinkIdp5": "${msg("emailLinkIdp5")}"
      },  -->
      "social": ""
    }
  </script>
  <#nested "scripts">
</body>
</html>
</#macro>
