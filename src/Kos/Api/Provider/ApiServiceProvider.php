<?php
namespace Kos\Api\Provider;

use Silex\Application;
use Pimple\Container;
use Pimple\ServiceProviderInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

class ApiServiceProvider implements ServiceProviderInterface
{
    public function register(Container $app)
    {
        $app['api'] = $app->protect(function ($statusCode, $data) use ($app) {

            // response array
            $responseMessage = array(
                'statusCode' => $statusCode,
                'data' => $data,
            );

            return new JsonResponse($responseMessage);
        });
    }

}