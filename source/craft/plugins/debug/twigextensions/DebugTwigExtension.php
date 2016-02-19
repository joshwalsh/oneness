<?php
namespace Craft;

use Twig_Extension;
use Twig_Filter_Method;

class DebugTwigExtension extends Twig_Extension {
  public function getName() {
    return 'debug';
  }

  public function getFilters() {
    return array(
        'debug' => new Twig_Filter_Method($this, 'debug'),
    );
  }

  public function debug($value) {
    return var_dump($value);
  }
}

?>
