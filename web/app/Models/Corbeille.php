<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Corbeille extends Model
{
    use SoftDeletes;
	
	protected $table = 'corbeilles';
	
	protected $hidden = [
        
    ];

	protected $guarded = [];

	protected $dates = ['deleted_at'];

	/**
     * Get the user that owns upload.
     */
    public function poubelleParent()
    {
        return $this->belongsTo('App\Models\Poubelle', 'poubelle');
    }
}
