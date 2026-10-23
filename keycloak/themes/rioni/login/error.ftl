<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#-- Заголовок страницы, можно оставить пустым или добавить свой -->
    <#elseif section = "form">
        <div id="kc-error-message" class="error-container">
            <#-- Иконка ошибки (можно использовать свою или встроенную) -->
            <div class="pf-c-alert pf-m-danger pf-m-inline" aria-label="Ошибка">
                <div class="pf-c-alert__icon">
                    <i class="pficon pficon-error-circle-o" aria-hidden="true"></i>
                </div>
                <p class="pf-c-alert__title">
                    <span class="pf-screen-reader">Ошибка:</span>
                    <#-- Вывод самого сообщения об ошибке от Keycloak -->
                    ${kcSanitize(message.summary)?no_esc}
                </p>
            </div>

            <#-- Кнопки действий -->
            <div class="form-actions" style="margin-top: 20px;">
                <#-- Кнопка "Вернуться в приложение", если известен URL клиента -->
                <#if client?? && client.baseUrl?has_content>
                    <div id="kc-back-to-application">
                        <a href="${client.baseUrl}" class="pf-c-button pf-m-primary">
                            Вернуться в приложение
                        </a>
                    </div>
                </#if>

                <#-- Кнопка "Попробовать снова" (ведет на страницу логина) -->
                <div id="kc-back-to-login" style="margin-top: 10px;">
                    <a href="${url.loginUrl}" class="pf-c-button pf-m-secondary">
                        Вернуться на страницу входа
                    </a>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>