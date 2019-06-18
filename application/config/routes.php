<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'control_pagina/index';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;





//======================Carlos====================================//
$route['formatos/frm_1'] = 'C_Frm_1/index';
$route['formatos/frm_2'] = 'C_Frm_2/index';
$route['formatos/frm_3'] = 'C_Frm_3/index';
$route['formatos/frm_4'] = 'C_Frm_4/index';
$route['formatos/frm_5'] = 'C_Frm_5/index';






















































//======================Alberto====================================//


$route['formatos/frm_6'] = 'C_Frm_6/index';
$route['formatos/frm_7'] = 'C_Frm_7/index';
$route['formatos/frm_8'] = 'C_Frm_8/index';
$route['formatos/frm_9'] = 'C_Frm_9/index';
$route['formatos/frm_12'] = 'C_Frm_12/index';



















































//======================Randy====================================//

$route['formatos/frm_13'] = 'C_Frm_13/index';
$route['formatos/frm_14'] = 'C_Frm_14/index';
$route['formatos/frm_15'] = 'C_Frm_15/index';
$route['formatos/frm_16'] = 'C_Frm_16/index';
$route['formatos/frm_17'] = 'C_Frm_17/index';