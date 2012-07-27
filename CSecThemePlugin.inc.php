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
		return 'estilo.css';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}
}

?>
