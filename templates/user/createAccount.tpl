{**
 * createAccount.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="navigation.account"}
{include file="common/header.tpl"}
{/strip} 

<form name="createAccount" method="post" action="{url op="createAccount"}">

<p>{translate key="user.account.completeForm"}</p>

{if !$existingUser}
  {url|assign:"url" page="user" op="account" existingUser=1}
  <p>{translate key="user.account.hasAccount" accountUrl=$url}</p>
{else}
  {url|assign:"url" page="user" op="account"}
  <p>{translate key="user.account.hasNoAccount" accountUrl=$url}</p>
  <input type="hidden" name="existingUser" value="1"/>
{/if}

{if $source}
  <input type="hidden" name="source" value="{$source|escape}" />
{/if}

<h3>{translate key="user.profile"}</h3>
{include file="common/formErrors.tpl"}

{if $existingUser}
<p>{translate key="user.account.loginToRegister"}</p>
{/if}

{* NOTE: The absolutely required fields in following form should be synced
   with the implementation in templates/registration/userRegistrationForm.tpl *}

<table class="data" width="100%">
{if count($formLocales) > 1 && !$existingUser}
  <tr valign="top">
    <td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
    <td width="80%" class="value">
      {url|assign:"createAccountUrl" page="user" op="account" escape=false}
      {form_language_chooser form="createAccount" url=$createAccountUrl}
      <span class="instruct">{translate key="form.formLanguage.description"}</span>
    </td>
  </tr>
{/if}
<tr valign="top"> 
  <td width="20%" class="label">{fieldLabel name="username" required="true" key="user.username"}</td>
  <td width="80%" class="value"><input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="textField" /></td>
</tr>
{if !$existingUser}
<tr valign="top">
  <td></td>
  <td class="instruct">{translate key="user.account.usernameRestriction"}</td>
</tr>
{/if}
  
<tr valign="top">
  <td class="label">{fieldLabel name="password" required="true" key="user.password"}</td>
  <td class="value"><input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="textField" /></td>
</tr>

{if !$existingUser}
<tr valign="top">
  <td></td>
  <td class="instruct">{translate key="user.account.passwordLengthRestriction" length=$minPasswordLength}</td>
</tr>
<tr valign="top">
  <td class="label">{fieldLabel name="password2" required="true" key="user.account.repeatPassword"}</td>
  <td class="value"><input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" maxlength="32" class="textField" /></td>
</tr>

{if $captchaEnabled}
  <tr>
    <td class="label" valign="top">{fieldLabel name="captcha" required="true" key="common.captchaField"}</td>
    <td class="value">
      <img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
      <span class="instruct">{translate key="common.captchaField.description"}</span><br />
      <input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField" />
      <input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
    </td>
  </tr>
{/if}

<tr valign="top">
  <td class="label">Nome*</td>
  <td class="value"><input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>

  
<tr valign="top">
  <td class="label">Sobrenome*</td>
  <td class="value"><input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="textField" /></td>
</tr>

<tr valign="top">
  <td class="label">{fieldLabel name="affiliation" key="user.affiliation" required="true"}</td>
  <td class="value"><textarea name="affiliation" rows="5" cols="40" class="textArea">{$affiliation|escape}</textarea></td>
</tr>


<tr valign="top">
  <td class="label">{fieldLabel name="email" required="true" key="user.email"}</td>
  <td class="value"><input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="textField" /></td>
</tr>


</table>

<div class="separator"></div>
<br/>
<p>O evento Iº Conexão Internacional Saúde e (Ciber) Cultura da
 <strong>Semana Nacional Ciência, Cultura e Saúde</strong> acontecerá na 
 <a href="http://www.next.icict.fiocruz.br/sec/" target="_blank">Rede Saúde e Cultura na internet</a><br/>
 </p>
<br/>
<p> Para saber mais sobre a Rede Saúde e Cultura na internet acesse o 
<a href="http://www.next.icict.fiocruz.br/sec/sobre">Sobre a rede na internet</a>
</p>
<br/>
<table class="data" width="100%">

<tr valign="top">
 <td class="label">Você gostaria de participar da 
 <a href="http://www.next.icict.fiocruz.br/sec/" target="_blank">Rede Saúde e Cultura na internet</a>
 e aceita os <a href="http://www.next.icict.fiocruz.br/sec/termos-de-servico">termos de serviço da rede</a>?
 </td>
</tr>

<tr valign="top">
 
  <td class="value">
    <select name="participardarede" id="participardarede" class="selectMenu">
      <option value="1">Sim eu quero participar da Rede da Rede Saúde e Cultura na internet</option>
      <option value="0">Não quero participar ou não concordo com os termos da rede</option>
    </select>
  </td>
  
</tr>

</table>

<div class="separator"></div>
<br/>

<table class="data" width="100%">
<tr valign="top">
  <td class="label">{fieldLabel name="sendPassword" key="user.sendPassword"}</td>
  <td class="value">
    <input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} /> <label for="sendPassword">{translate key="user.sendPassword.description"}</label>
  </td>
</tr>

{if count($availableLocales) > 1}
<tr valign="top">
  <td class="label">{translate key="user.workingLanguages"}</td>
  <td class="value">{foreach from=$availableLocales key=localeKey item=localeName}
    <input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> <label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
  {/foreach}</td>
</tr>
{/if}
{/if} 
  
{if ($allowRegReader || $allowRegReader === null) or $enableOpenAccessNotification or ($allowRegAuthor || $allowRegAuthor === null) or ($allowRegReviewer || $allowRegReviewer === null)}
<tr valign="top">
  <td class="label">{fieldLabel suppressId="true" name="createAs" key="user.account.createAs"}</td>
  <td class="value">
    {if $allowRegReader || $allowRegReader === null}
      <input type="checkbox" name="createAsReader" id="createAsReader" value="1"{if $createAsReader} checked="checked"{/if} /> <label for="createAsReader">{translate key="user.role.reader"}</label>: {translate key="user.account.readerDescription"}<br />
    {/if}
    {if $enableOpenAccessNotification}
      <input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} /> <label for="openAccessNotification">{translate key="user.role.reader"}</label>: {translate key="user.account.openAccessNotificationDescription"}<br />
    {/if}
    {if $allowRegAuthor || $allowRegAuthor === null}
      <input type="checkbox" name="createAsAuthor" id="createAsAuthor" value="1"{if $createAsAuthor} checked="checked"{/if} /> <label for="createAsAuthor">{translate key="user.role.author"}</label>: {translate key="user.account.authorDescription"}<br />
    {/if}
    {if $allowRegReviewer || $allowRegReviewer === null}<input type="checkbox" name="createAsReviewer" id="createAsReviewer" value="1"{if $createAsReviewer} checked="checked"{/if} /> <label for="createAsReviewer">{translate key="user.role.reviewer"}</label>: {if $existingUser}{translate key="user.account.reviewerDescriptionNoInterests"}{else}{translate key="user.account.reviewerDescription"} <input type="text" name="interests[{$formLocale|escape}]" value="{$interests[$formLocale]|escape}" size="20" maxlength="255" class="textField" />{/if}
    {/if}
  </td>
</tr>
{/if}
</table>

<p><input type="submit" value="{translate key="user.createAccount"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="index"}'" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{if $privacyStatement}
<h3>{translate key="user.account.privacyStatement"}</h3>
<p>{$privacyStatement|nl2br}</p>
{/if}
</form>

{include file="common/footer.tpl"}
