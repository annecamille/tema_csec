{**
 * navbar.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
<div id="navbar">
	<ul class="menu">
		<li class="home"><a href="{url context=$homeContext op="index"}">{translate key="navigation.home"}</a></li>
		
		<li><a href="{$baseUrl}/index.php/CRSC/index/pages/view/sobre">{translate key="navigation.about"}</a></li>
		
		<li><a href="http://www.next.icict.fiocruz.br/conferencias/programacao.pdf">Programação</a></li>

		{if $currentConference}

			{if $enableAnnouncements}
				<li><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
			{/if}{* $enableAnnouncements *}

			{call_hook name="Templates::Common::Header::Navbar::CurrentConference"}
		{/if}{* $currentConference *}

		{foreach from=$navMenuItems item=navItem}
			{if $navItem.url != '' && $navItem.name != ''}
				<li><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
		
		
		{if $isUserLoggedIn}
			<li><a href="{url page="user"}">{translate key="navigation.userHome"}</a></li>
		{/if}
		
	</ul>
</div>
