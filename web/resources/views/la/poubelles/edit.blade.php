@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/poubelles') }}">Poubelle</a> :
@endsection
@section("contentheader_description", $poubelle->$view_col)
@section("section", "Poubelles")
@section("section_url", url(config('laraadmin.adminRoute') . '/poubelles'))
@section("sub_section", "Editer")

@section("htmlheader_title", "Poubelles Edition : ".$poubelle->$view_col)

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
				{!! Form::model($poubelle, ['route' => [config('laraadmin.adminRoute') . '.poubelles.update', $poubelle->id ], 'method'=>'PUT', 'id' => 'poubelle-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'identifiant')
					@la_input($module, 'quartier')
					@la_input($module, 'emplacement')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Mettre à jour', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/poubelles') }}">Annuler</a></button>
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
	$("#poubelle-edit-form").validate({
		
	});
});
</script>
@endpush
