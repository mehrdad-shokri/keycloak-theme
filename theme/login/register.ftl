<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
  <#elseif section = "form">   
   <div>
      <ul id="nav" class="nav justify-content-center">
         <li class="nav-item">
            <a href="${url.loginUrl}" target="_self" class="nav-link">
               <span>${msg("doLogIn")}</span>
            </a>
         </li>
         <li class="nav-item">
            <a href="${url.registrationUrl}" class="nav-link nuxt-link-active">
               <span>${msg("signup")}</span>
            </a>
         </li>
      </ul>
      <div class="divider"></div>
   </div>
   <div id="kc-form-wrapper" class="kcform">
        <div class="instruction">
          <p>
            ${msg("accountSignup")}
          </p>
        </div>
        <form id="kc-register-form" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="email" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" required/>
                    <small class="xs text-muted pl-1">${msg("req")}</small>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("usernameText")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" pattern="[a-zA-Z][a-zA-Z0-9-_.]{1,15}" title="${msg("usernameValid")}" required/>
                    <small class="xs text-muted pl-1">${msg("req")} - ${msg("usernameDesc")}</small>
                </div>
            </div>
         
            <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("passwordText")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" pattern=".{8,}"  class="${properties.kcInputClass!}" name="password" autocomplete="new-password" required/>
                    <small class="xs text-muted pl-1">${msg("passwordDesc")}</small>
                 </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" autocomplete="new-password" required/>
                </div>
            </div>
            </#if>
            <div class="${properties.kcFormGroupClass!}">
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="user.attributes.newsletter" name="user.attributes.newsletter"/>
                <label for="newsletter" class="form-check-label">${msg("newsletter")}</label>
              </div>   
            </div>
            
            <div class="${properties.kcFormGroupClass!}">
              <div class="${properties.kcLabelWrapperClass!}">
                <small>
                  ${msg("terms")?no_esc}
                </small>
              </div>
            </div>

         <div class="${properties.kcFormGroupClass!}">
           <div class="${properties.kcInputWrapperClass!}">
             <div id="kc-form-buttons" class="form-buttons flex-row-reverse">
               <input class="btn btn-primary" type="submit" value="${msg("signup")}"/>
             </div>
           </div>
        </div>
     </form>
    </div>
   </#if>
</@layout.registrationLayout>