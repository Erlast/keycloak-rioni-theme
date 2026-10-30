<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/error.js"></script>
  </#if>
  <script id="environment" type="application/json">
      {
        "urls": {
          "loginResetCredentials": "${(url.loginResetCredentialsUrl)!''}",
            "login": "${(url.loginUrl)!''}",
            "registration": "${(url.registrationUrl)!''}",
             "loginAction": "",
            "registrationAction": "${(url.registrationAction)!''}",
            "resourcesPath": "${(url.resourcesPath)!''}",
             "loginRestartUrl":"${(url.loginRestartFlowUrl)!''}",
             "clientBaseUrl":<#if client?? && client.baseUrl?has_content>"${(client.baseUrl)!''}"<#else>""</#if>
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
          "registerFirstName": "",
          "registerLastName": "",
          "registerEmail": "",
          "registerUsername": ""
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
          "type": <#if message?has_content && message.type == 'error'>"${message.type}"<#else>""</#if>,
          "summary": <#if message?has_content && message.type == 'error'>"${kcSanitize(message.summary)?no_esc}"<#else>""</#if>
        },
        "realm": {
          "displayName": "${(realm.displayName!'')}"
        }
      }
    </script>
</@layout.registrationLayout>
