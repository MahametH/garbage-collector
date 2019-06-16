<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use App\Http\Requests;
use Illuminate\Http\Request;

use App\Models\Quartier;
use App\Models\Poubelle;
use App\Models\Corbeille;
use App\Models\Camion;
use DB;

use Mapper;

/**
 * Class DashboardController
 * @package App\Http\Controllers
 */
class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
    public function index()
    {
        $quartiers = DB::table('quartiers')->count();
        $poubelles = DB::table('poubelles')->count();
        $corbeilles = DB::table('corbeilles')->count();
        $camions = DB::table('camions')->count();
        return view('la.dashboard', compact(["quartiers", "poubelles", "corbeilles", "camions"]));
    }

    /**
     * Show the application maps.
     *
     * @return Response
     */
    public function gmaps()
    {
       Mapper::map(52.381128999999990000, 0.470085000000040000)->informationWindow(53.381128999999990000, -1.470085000000040000, 'Content', ['markers' => ['animation' => 'DROP']]);
        return view('la.gmaps');
    }


}