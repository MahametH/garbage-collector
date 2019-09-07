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

use Dwij\Laraadmin\Models\Module;
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
     * Show the bin status.
     *
     * @return Response
     */
    public function status()
    {
        if(Module::hasAccess('Corbeilles', 'view')) {
            $corbeilles = Corbeille::with('poubelleParent')->whereNull('deleted_at')->get();
        
            return View('la.status', [
                'corbeilles' => $corbeilles
            ]);
        } else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
    }

    public function data(Request $request)
    {
        dd($request);   
    }

}