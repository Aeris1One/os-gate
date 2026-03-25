<?php

namespace OPNsense\Gate;

class IndexController extends \OPNsense\Base\IndexController
{
    public function indexAction()
    {
        $this->view->generalForm = $this->getForm('general');
        $this->view->routeForm = $this->getForm('route');
        $this->view->pick('OPNsense/Gate/index');
    }
}
