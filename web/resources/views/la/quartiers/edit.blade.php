@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/quartiers') }}">Quartier</a> :
@endsection
@section("contentheader_description", $quartier->$view_col)
@section("section", "Quartiers")
@section("section_url", url(config('laraadmin.adminRoute') . '/quartiers'))
@section("sub_section", "Editer")

@section("htmlheader_title", "Quartiers Edition : ".$quartier->$view_col)

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
				{!! Form::model($quartier, ['route' => [config('laraadmin.adminRoute') . '.quartiers.update', $quartier->id ], 'method'=>'PUT', 'id' => 'quartier-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'nom')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Mettre à jour', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/quartiers') }}">Annuler</a></button>
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
	$("#quartier-edit-form").validate({
		
	});
});
</script>
@endpush
