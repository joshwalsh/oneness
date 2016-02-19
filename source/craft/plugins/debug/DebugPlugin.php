<?php

namespace Craft;

class DebugPlugin extends BasePlugin {
  function getName()
  {
      return Craft::t('Debug');
  }

  function getVersion()
  {
      return '0.1';
  }

  function getDeveloper()
  {
      return 'Designing Interactive';
  }

  function getDeveloperUrl()
  {
      return 'http://www.d-i.co';
  }

  public function addTwigExtension()
  {
      Craft::import('plugins.debug.twigextensions.DebugTwigExtension');

      return new DebugTwigExtension();
  }
}

?>
