<#--
  Общий блок <script id="environment"> для всех страниц темы.
  Параметры позволяют сохранить различия между страницами:
    emptyLoginAction - выводить пустой url.loginAction (на странице error)
    loginPassword   - выводить realm.password или пустую строку
    restartUrl      - добавлять url.loginRestartUrl
    clientBaseUrl   - добавлять client.baseUrl
    formsMode       - "login" | "register" | "template" | "empty"
    validationsMode - "messages" | "empty"
    messageMode     - "error" | "display" | "empty"
    socialMode      - "list" | "none" | "emptyString"
    displayMessage  - используется только при messageMode="display"

  Подключается так:
    <#import "environment.ftl" as env>
    <@env.environment />
-->
<#macro environment
    emptyLoginAction=false
    loginPassword=true
    restartUrl=true
    clientBaseUrl=false
    formsMode="login"
    validationsMode="messages"
    messageMode="error"
    socialMode="list"
    displayMessage=false
>
  <script id="environment" type="application/json">
    {
      "urls": {
        "loginResetCredentials": "${(url.loginResetCredentialsUrl)!''}",
        "login": "${(url.loginUrl)!''}",
        "registration": "${(url.registrationUrl)!''}",
        "loginAction": <#if emptyLoginAction>""<#else>"${(url.loginAction)!''}"</#if>,
        "registrationAction": "${(url.registrationAction)!''}",
        "resourcesPath": "${(url.resourcesPath)!''}",
        "pageRedirectUri": "${(pageRedirectUri)!''}",
        "actionUri": "${(actionUri)!''}"<#if restartUrl>,
        "loginRestartUrl": "${(url.loginRestartFlowUrl)!''}"</#if><#if clientBaseUrl>,
        "clientBaseUrl": <#if client?? && client.baseUrl?has_content>"${(client.baseUrl)!''}"<#else>""</#if></#if>
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
        "password": <#if loginPassword><#if realm.password>true<#else>false</#if><#else>""</#if>,
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
      "forms": <#if formsMode = "empty">{
        "loginUsername": "",
        "loginRememberMe": "",
        "selectedCredential": "",
        "registerFirstName": "",
        "registerLastName": "",
        "registerEmail": "",
        "registerUsername": ""
      }<#elseif formsMode = "template">{
        "loginUsername": "",
        "loginRememberMe": "",
        "selectedCredential": "",
        "registerFirstName": <#if register??>"${(register.formData.firstName!'')}"<#else>""</#if>,
        "registerLastName": <#if register??>"${(register.formData.lastName!'')}"<#else>""</#if>,
        "registerEmail": <#if register??>"${(register.formData.email!'')}"<#else>""</#if>,
        "registerUsername": <#if register??>"${(register.formData.username!'')}"<#else>""</#if>
      }<#elseif formsMode = "register">{
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
      }<#else>{
        "loginUsername": "${(login.username!'')}",
        "loginRememberMe": <#if login.rememberMe??>true<#else>false</#if>,
        "selectedCredential": "${(auth.selectedCredential!'')}",
        "registerFirstName": <#if register??>"${(register.formData.firstName!'')}"<#else>""</#if>,
        "registerLastName": <#if register??>"${(register.formData.lastName!'')}"<#else>""</#if>,
        "registerEmail": <#if register??>"${(register.formData.email!'')}"<#else>""</#if>,
        "registerUsername": <#if register??>"${(register.formData.username!'')}"<#else>""</#if>
      }</#if>,
      "user": {
        "username": <#if user??>"${(user.username!'')}"<#else>""</#if>,
        "email": <#if user??>"${(user.email!'')}"<#else>""</#if>,
        "firstName": <#if user??>"${(user.firstName!'')}"<#else>""</#if>,
        "lastName": <#if user??>"${(user.lastName!'')}"<#else>""</#if>
      },
      "validations": <#if validationsMode = "messages">{
        "firstName": <#if messagesPerField.existsError('firstName')>"${kcSanitize(messagesPerField.get('firstName'))?no_esc}"<#else>""</#if>,
        "lastName": <#if messagesPerField.existsError('lastName')>"${kcSanitize(messagesPerField.get('lastName'))?no_esc}"<#else>""</#if>,
        "email": <#if messagesPerField.existsError('email')>"${kcSanitize(messagesPerField.get('email'))?no_esc}"<#else>""</#if>,
        "usernameOrPassword": <#if messagesPerField.existsError('username','password')>"${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"<#else>""</#if>,
        "username": <#if messagesPerField.existsError('username')>"${kcSanitize(messagesPerField.get('username'))?no_esc}"<#else>""</#if>,
        "password": <#if messagesPerField.existsError('password')>"${kcSanitize(messagesPerField.get('password'))?no_esc}"<#else>""</#if>,
        "passwordConfirm": <#if messagesPerField.existsError('password-confirm')>"${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}"<#else>""</#if>
      }<#else>{
        "firstName": "",
        "lastName": "",
        "email": "",
        "usernameOrPassword": "",
        "username": "",
        "password": "",
        "passwordConfirm": ""
      }</#if>,
      "message": <#if messageMode = "empty">{
        "type": "",
        "sumary": ""
      }<#elseif messageMode = "display">{
        "type": <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>"${message.type}"<#else>""</#if>,
        "summary": <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>"${kcSanitize(message.summary)?no_esc}"<#else>""</#if>
      }<#else>{
        "type": <#if message?has_content && message.type == 'error'>"${message.type}"<#else>""</#if>,
        "summary": <#if message?has_content && message.type == 'error'>"${kcSanitize(message.summary)?no_esc}"<#else>""</#if>
      }</#if>,
      "realm": {
        "displayName": "${(realm.displayName!'')}"
      }<#if socialMode = "list">,
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
      ]</#if><#if socialMode = "emptyString">,
      "social": ""</#if>
    }
  </script>
</#macro>
