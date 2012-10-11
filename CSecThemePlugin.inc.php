<?php

/**
 * @file DesertThemePlugin.inc.php
 *
 * Copyright (c) 2012 Alberto Souza, Anne camille
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class CSecThemePlugin
 * @ingroup plugins_themes_tema_csec
 *
 * @brief "tema_csec" theme plugin
 */

//$Id$

import('classes.plugins.ThemePlugin');

class CSecThemePlugin extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'CSecThemePlugin';
	}

	function getDisplayName() {
		return 'Rede Saúde e Cultura Theme';
	}

	function getDescription() {
		return 'Rede Saúde e Cultura layout';
	}

	function getStylesheetFilename() {
		return 'style.css';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}

	/**
	 * Activate the theme.
     * Add plugin theme template dir
	 */
	function activate(&$templateMgr) {
	
	if (($stylesheetFilename = $this->getStylesheetFilename()) != null) {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/' . $stylesheetFilename;
			$templateMgr->addStyleSheet($path);

			// add the plugin template dir
			$theme_template_dir = $_SERVER['DOCUMENT_ROOT'] . Request::getBasePath() . '/' . $this->getPluginPath() . '/templates' ;
			array_unshift($templateMgr->template_dir,$theme_template_dir );
		}
	}
}

// EXIBIR O CONTEÚDO DE UMA VARIAVÉL NO CONSOLE DO JAVASCRIPT DO NAVEGADOR
function debugaa($algo) {
  $algo = json_encode($algo);
  print "<script>console.log($algo)</script>";
}

?>
