{**
 * complete.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * The submission process has been completed; notify the author.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="author.track"}
{include file="common/header.tpl"}
{/strip}
<div id="submissionComplete">
<p>Submissão concluída. Agradecemos seu interesse em contribuir para o evento Semana de Ciência, Cultura e Saúde.</p>

<p>&#187; <a href="{url page="author"}">{translate key="author.track"}</a></p>
</div>
{include file="common/footer.tpl"}
