{**
 * index.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference index page. Displayed when both a conference and a
 * scheduled conference have been specified.
 *
 * $Id$
 *}
{*
 * The page and crumb titles differ here since the breadcrumbs already include
 * the conference title, but the page title doesn't.
 *}
{strip}
{assign var="pageCrumbTitleTranslated" value=$schedConf->getSchedConfTitle()}
{assign var="pageTitleTranslated" value=$schedConf->getFullTitle()}
{include file="common/header.tpl"}
{/strip}

{if $schedConf->getSetting('startDate')}<div class="img-date">{$schedConf->getSetting('startDate')|date_format:$dateFormatLong} &ndash; {$schedConf->getSetting('endDate')|date_format:$dateFormatLong}</div>{/if}

<br />

<div>{$schedConf->getLocalizedSetting("introduction")|nl2br}</div>

{if $enableAnnouncementsHomepage}
	{* Display announcements *}
	<div id="announcementsHome">
		<h3>{translate key="announcement.announcementsHome"}</h3>
		{include file="announcement/list.tpl"}	
		<table class="announcementsMore">
			<tr>
				<td><a href="{url page="announcement"}">{translate key="announcement.moreAnnouncements"}</a></td>
			</tr>
		</table>
	</div>
{/if}

<br />

{if $homepageImage}
<div id="homepageImage"><img src="{$publicFilesDir}/{$homepageImage.uploadName|escape}" width="{$homepageImage.width}" height="{$homepageImage.height}" {if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{translate key="common.conferenceHomepageImage.altText"}"{/if} /></div>
{/if}

{if $schedConfPostOverview || $schedConfShowCFP
			|| $schedConfPostPolicies || $schedConfShowProgram ||  $schedConfPostPresentations || $schedConfPostSchedule 
			|| $schedConfPostPayment  || $schedConfPostAccommodation || $schedConfPostSupporters  || $schedConfPostTimeline}

{/if}
{$additionalHomeContent}

{include file="common/footer.tpl"}
