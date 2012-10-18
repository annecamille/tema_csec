{**
 * userRegistrationForm.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Attendee self-registration page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="schedConf.registration"}
{include file="common/header.tpl"}
{/strip} 

<form action="{url op="register"}" name="registration" method="post">
<input type="hidden" name="registrationTypeId" value="{$registrationTypeId|escape}" />

{include file="common/formErrors.tpl"}

{if count($formLocales) > 1 && !$existingUser}
<div id="locales">
<table class="data" width="100%">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
		<td width="80%" class="value">
			{url|assign:"registerUrl" op="registration" escape=false}
			{form_language_chooser form="registration" url=$registerUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</tr>
</table>
</div>
{/if}

{assign var="registrationAdditionalInformation" value=$schedConf->getLocalizedSetting('registrationAdditionalInformation')}
{if $registrationAdditionalInformation}
<div id="registrationAdditionalInformation">
	<h3>{translate key="manager.registrationPolicies.registrationAdditionalInformation"}</h3>

	<p>{$registrationAdditionalInformation|nl2br}</p>
</div>
	<div class="separator"></div>
{/if}

<div id="account">
<h3>{translate key="schedConf.registration.account"}</h3>
{if $userLoggedIn}
	{url|assign:"logoutUrl" page="login" op="signOut" source=$requestUri}
	{url|assign:"profileUrl" page="user" op="profile"}
	<p>{translate key="schedConf.registration.loggedInAs" logoutUrl=$logoutUrl profileUrl=$profileUrl}</p>

	<table class="data" width="100%">
		<tr valign="top">
			<td width="20%" class="label">{translate key="user.name"}</td>
			<td width="80%" class="value">{$user->getFullName()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="user.email"}</td>
			<td class="value">{$user->getEmail()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="user.phone"}</td>
			<td class="value">{$user->getPhone()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="user.fax"}</td>
			<td class="value">{$user->getFax()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="common.mailingAddress"}</td>
			<td class="value">{$user->getMailingAddress()|strip_unsafe_html|nl2br}</td>
		</tr>
	</table>
{else}
	{url|assign:"loginUrl" page="login" op="index" source=$requestUri}
	<p>{translate key="schedConf.registration.createAccount.description" loginUrl=$loginUrl}</p>

	<table class="data" width="100%">
		<tr valign="top">	
			<td width="20%" class="label">{fieldLabel name="username" required="true" key="user.username"}</td>
			<td width="80%" class="value"><input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="textField" /></td>
	</tr>

	<tr valign="top">
		<td class="label">{fieldLabel name="password" required="true" key="user.password"}</td>
		<td class="value"><input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="textField" /></td>
	</tr>

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
  <td class="label">{fieldLabel name="email" required="true" key="user.email"}</td>
  <td class="value"><input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="textField" /></td>
</tr>

<tr valign="top">
  <td class="label">CPF:*</td>
  <td class="value"><input type="text" id="cpf" name="cpf" value="{$smarty.post.cpf}" size="30" maxlength="90" class="textField" /></td>
</tr>

<tr valign="top">
  <td class="label">Telefone fixo ou celular de contato</td>
  <td class="value"><input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="textField" /></td>
</tr>

<tr valign="top">
	<td class="label">Nome completo da {fieldLabel name="affiliation" key="user.affiliation" required="true"} onde atua</td>
	<td class="value"><textarea id="affiliation" name="affiliation" rows="5" cols="40" class="textArea">{$affiliation|escape}</textarea></td>
</tr>

</table>
<div class="separator"></div>
<table class="data" width="100%">

<tr valign="top">
  <td class="label"><strong>Informe a natureza da sua atuação:</strong><br/><br/></td>
</tr>  
<tr valign="top">  
  <td class="value">
    <input type="checkbox" name="naturezaatuacao[]" value="a">Profissional de Saúde<br>
    <input type="checkbox" name="naturezaatuacao[]" value="b">Profissional de Educação<br>
    <input type="checkbox" name="naturezaatuacao[]" value="c">Profissional de Cultura<br>
    <input type="checkbox" name="naturezaatuacao[]" value="d">Cargo de Chefia na Adm. Pública<br>
    <input type="checkbox" name="naturezaatuacao[]" value="e">Artista, Promotor Cultural, Artesão<br>
    <input type="checkbox" name="naturezaatuacao[]" value="f">Militante de movimento social<br>
    <input type="checkbox" name="naturezaatuacao[]" value="g">Estudante<br>
    <input type="checkbox" name="naturezaatuacao[]" value="h">Pesquisador<br>
    <input type="checkbox" name="naturezaatuacao[]" value="i">Voluntário<br>
    Outro, especifique: <input type="text" name="naturezaatuacaooutro" {$smarty.post.naturezaatuacaooutro}"><br>
  </td>
</tr>
 
</table>
<div class="separator"></div>
<table class="data" width="100%">

<tr valign="top">
  <td class="label"><strong>Quais, dentre os temas abaixo, você gostaria de discutir durante o Encontro
Nacional da Rede Saúde e Cultura? (indique até duas prioridades):</strong><br/><br/></td>
</tr>
<tr valign="top">
  <td class="value">
    <input type="checkbox" name="temas[]" value="a">Práticas Tradicionais em Saúde<br>
    <input type="checkbox" name="temas[]" value="b">Práticas integrativas e complementares em saúde<br>
    <input type="checkbox" name="temas[]" value="c">Equidade em saúde e cultura<br>
    <input type="checkbox" name="temas[]" value="d">Saúde Indígena<br>
    <input type="checkbox" name="temas[]" value="e">Saúde Mental<br>
    <input type="checkbox" name="temas[]" value="f">A Arte e o cuidado à saúde (promoção, prevenção e reestabelecimento da
saúde)<br>
    <input type="checkbox" name="temas[]" value="g">Controle social, participação e solidariedade<br>
    <input type="checkbox" name="temas[]" value="h">Acesso a conhecimentos e expressões culturais tradicionais<br>
    <input type="checkbox" name="temas[]" value="i">Necessidades de formação para apoiar a gestão, os serviços e as práticas na
interface saúde e cultura<br>  
  <br>
  </td>
</tr>

</table>

<input type="hidden" value="." name="mailingAddress" /> 

<input type="hidden" value="BR" name="country" />	



<div class="separator"></div>
<br/>
<p>O evento Iº Conexão Internacional Saúde e (Ciber) Cultura da
 <strong>Semana Nacional Ciência, Cultura e Saúde</strong> acontecerá na 
 <a href="http://www.next.icict.fiocruz.br/sec/" target="_blank">Rede Saúde e Cultura na internet</a><br/>
 </p>
<br/>
<p> Para saber mais sobre a Rede Saúde e Cultura na internet acesse o 
<a href="http://www.next.icict.fiocruz.br/sec/sobre" target="_blank">Sobre a rede na internet</a>
</p>
<br/>
<table class="data" width="100%">

<tr valign="top">
 <td class="label">Você gostaria de participar da 
 <a href="http://www.next.icict.fiocruz.br/sec/" target="_blank">Rede Saúde e Cultura na internet</a>
 e aceita os <a href="http://www.next.icict.fiocruz.br/sec/termos-de-servico" target="_blank">termos de serviço da rede</a>?
 </td>
</tr>

<tr valign="top">
  <td class="value">
    <select name="participardarede" id="participardarede" class="selectMenu">
      <option value="1">Sim, eu gostaria de participar da Rede da Rede Saúde e Cultura na internet</option>
      <option value="0">Não gostaria de participar ou não concordo com os termos da rede</option>
    </select>
  </td>
  
</tr>

</table>

{/if}{* user is logged in *}
</div>
<div class="separator"></div>

{if $currentSchedConf->getSetting('registrationName')}
<div id="registrationContact">
<h3>{translate key="manager.registrationPolicies.registrationContact"}</h3>

<table class="data" width="100%">
	<tr valign="top">
		<td width="20%" class="label">{translate key="user.name"}</td>
		<td width="80%" class="value">{$currentSchedConf->getSetting('registrationName')|escape}</td>
	</tr>
	{if $currentSchedConf->getSetting('registrationEmail')}<tr valign="top">
		<td class="label">{translate key="about.contact.email"}</td>
		<td class="value">{mailto address=$currentSchedConf->getSetting('registrationEmail')|escape encode="hex"}</td>
	</tr>{/if}
	{if $currentSchedConf->getSetting('registrationPhone')}<tr valign="top">
		<td class="label">{translate key="about.contact.phone"}</td>
		<td class="value">{$currentSchedConf->getSetting('registrationPhone')|escape}</td>
	</tr>{/if}
	{if $currentSchedConf->getSetting('registrationFax')}<tr valign="top">
		<td class="label">{translate key="about.contact.fax"}</td>
		<td class="value">{$currentSchedConf->getSetting('registrationFax')|escape}</td>
	</tr>{/if}
	{if $currentSchedConf->getSetting('registrationMailingAddress')}<tr valign="top">
		<td class="label">{translate key="common.mailingAddress"}</td>
		<td class="value">{$currentSchedConf->getSetting('registrationMailingAddress')|nl2br}</td>
	</tr>{/if}
</table>
</div>
<div class="separator"></div>
{/if}{* if displaying reg manager info *}

<p><input type="submit" value="{translate key="schedConf.registration.register"}" class="button defaultButton" /></p>

</form>

{include file="common/footer.tpl"}
