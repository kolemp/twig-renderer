<?php
declare(strict_types=1);

namespace TwigRenderer;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class TwigRendererExtension extends AbstractExtension
{
    public function getFunctions(): array
    {
        return [
            new TwigFunction('env', 'getenv'),
        ];
    }

}