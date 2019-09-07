@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/users') }}">Utilisateur</a> :
@endsection
@section("contentheader_description", $user->$view_col)
@section("section", "Utilisateurs")
@section("section_url", url(config('laraadmin.adminRoute') . '/users'))
@section("sub_section", "Editer")

@section("htmlheader_title", "Utilisateurs Edition : ".$user->$view_col)

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box">
	<div class="box-header">
		
	</div> 
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($user, ['route' => [config('laraadmin.adminRoute') . '.users.update', $user->id ], 'method'=>'PUT', 'id' => 'user-edit-form']) !!}
					{{--
					@la_form($module)
					--}}
					
					@la_input($module, 'name') 
					@la_input($module, 'email')
					@la_input($module, 'type')
					
					<div class="form-group">
						<label for="role">Role* :</label>
						<select class="form-control" required="1" data-placeholder="Selection Rôle" rel="select2" name="role">
							<?php $roles = App\Role::all(); ?>
							@foreach($roles as $role)
								@if($role->id != 1 || Entrust::hasRole("SUPER_ADMIN"))
									@if($user->hasRole($role->name))
										<option value="{{ $role->id }}" selected>{{ $role->name }}</option>
									@else
										<option value="{{ $role->id }}">{{ $role->name }}</option>
									@endif
								@endif
							@endforeach
						</select>
					</div>
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Mettre à jour', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/users') }}">Annuler</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {
	$("#user-edit-form").validate({
		
	});
});
</script>
@endpush
