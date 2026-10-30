<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  <#if section = "scripts">
    <script type="module" src="${url.resourcesPath}/js/register.js"></script>
  </#if> 
    <script id="environment" type="application/json">
          {
            "urls": {
              "loginResetCredentials": "${(url.loginResetCredentialsUrl)!''}",
                "login": "${(url.loginUrl)!''}",
                "registration": "${(url.registrationUrl)!''}",
                 "loginAction": "${(url.loginAction)!''}",
                "registrationAction": "${(url.registrationAction)!''}",
                "resourcesPath": "${(url.resourcesPath)!''}",
                "loginRestartUrl":"${(url.loginRestartFlowUrl)!''}"
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
              "password": <#if realm.password>true<#else>false</#if>,
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
              "loginUsername": "${(login.username!'')}",
              "loginRememberMe": <#if login.rememberMe??>true<#else>false</#if>,
              "selectedCredential": "${(auth.selectedCredential!'')}",
              "registerFirstName": <#if register??>"${(register.formData.firstName!'')}"<#else>""</#if>,
              "registerLastName": <#if register??>"${(register.formData.lastName!'')}"<#else>""</#if>,
              "registerEmail": <#if register??>"${(register.formData.email!'')}"<#else>""</#if>,
              "registerUsername": <#if register??>"${(register.formData.username!'')?json_string}"<#else>""</#if>,
              "registerPhone": <#if register??>"${(register.formData.phone!'')?json_string}"<#else>""</#if>,
              "registerPrefferedUsername": <#if register??>"${(register.formData.preffered_username!'')?json_string}"<#else>""</#if>,
               "registerFormData": {
                                <#if register??>
                                  <#list register.formData?keys as key>
                                    "${key}": "${(register.formData[key]!'')?json_string}"<#sep>,</#sep>
                                  </#list>
                                </#if>
                              }
            },
            "user": {
              "username": <#if user??>"${(user.username!'')}"<#else>""</#if>,
              "email": <#if user??>"${(user.email!'')}"<#else>""</#if>,
              "firstName": <#if user??>"${(user.firstName!'')}"<#else>""</#if>,
              "lastName": <#if user??>"${(user.lastName!'')}"<#else>""</#if>
            },
            "validations": {
              "firstName": <#if messagesPerField.existsError('firstName')>"${kcSanitize(messagesPerField.get('firstName'))?no_esc}"<#else>""</#if>,
              "lastName":  <#if messagesPerField.existsError('lastName')>"${kcSanitize(messagesPerField.get('lastName'))?no_esc}"<#else>""</#if>,
              "email": <#if messagesPerField.existsError('email')>"${kcSanitize(messagesPerField.get('email'))?no_esc}"<#else>""</#if>,
              "usernameOrPassword": <#if messagesPerField.existsError('username','password')>"${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"<#else>""</#if>,
              "username": <#if messagesPerField.existsError('username')>"${kcSanitize(messagesPerField.get('username'))?no_esc}"<#else>""</#if>,
              "password": <#if messagesPerField.existsError('password')>"${kcSanitize(messagesPerField.get('password'))?no_esc}"<#else>""</#if>,
              "passwordConfirm": <#if messagesPerField.existsError('password-confirm')>"${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}"<#else>""</#if>
            },
            "message": {
             "type": <#if message?has_content && message.type == 'error'>"${message.type}"<#else>""</#if>,
              "summary": <#if message?has_content && message.type == 'error'>"${kcSanitize(message.summary)?no_esc}"<#else>""</#if>
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
            "social": [
              <#if realm.password && social.providers??>
                <#list social.providers as p>
                  { 
                    "alias": "${p.alias}",
                    "displayName": "${p.displayName!}",
                    "loginUrl": "${p.loginUrl}"
                  }<#sep>, </#sep>
                </#list>
              </#if>
            ]
          }
        </script>
</@layout.registrationLayout>
