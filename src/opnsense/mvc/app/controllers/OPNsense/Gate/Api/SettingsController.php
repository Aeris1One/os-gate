<?php

namespace OPNsense\Gate\Api;

use OPNsense\Base\ApiMutableModelControllerBase;

class SettingsController extends ApiMutableModelControllerBase
{
    protected static $internalModelName = 'Gate';
    protected static $internalModelClass = '\OPNsense\Gate\Gate';

    /**
     * Search routes
     * @return array search results
     */
    public function searchRouteAction()
    {
        return $this->searchBase('routes.route', ['enabled', 'host', 'backend', 'strategy']);
    }

    /**
     * Retrieve route by UUID
     * @param string $uuid item unique id
     * @return array route content
     */
    public function getRouteAction($uuid = null)
    {
        return $this->getBase('route', 'routes.route', $uuid);
    }

    /**
     * Update route by UUID
     * @param string $uuid item unique id
     * @return array save result
     */
    public function setRouteAction($uuid)
    {
        return $this->setBase('route', 'routes.route', $uuid);
    }

    /**
     * Add a new route
     * @return array save result
     */
    public function addRouteAction()
    {
        return $this->addBase('route', 'routes.route');
    }

    /**
     * Delete route by UUID
     * @param string $uuid item unique id
     * @return array delete result
     */
    public function delRouteAction($uuid)
    {
        return $this->delBase('routes.route', $uuid);
    }

    /**
     * Toggle route enabled/disabled
     * @param string $uuid item unique id
     * @param string $enabled desired state
     * @return array toggle result
     */
    public function toggleRouteAction($uuid, $enabled = null)
    {
        return $this->toggleBase('routes.route', $uuid, $enabled);
    }
}
