@extends("la.layouts.app")

@section("contentheader_title", "Backups")
@section("contentheader_description", "Backups liste")
@section("section", "Backups")
@section("sub_section", "Liste")
@section("htmlheader_title", "Backups Liste")

@section("headerElems")
@la_access("Backups", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Ajouter Backup</button>
@endla_access
@endsection

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

<div class="box box-success">
	<!--<div class="box-header"></div>-->
	<div class="box-body">
		<table id="example1" class="table table-bordered">
		<thead>
		<tr class="success">
			@foreach( $listing_cols as $col )
			<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
			@endforeach
			@if($show_actions)
			<th>Actions</th>
			@endif
		</tr>
		</thead>
		<tbody>
			
		</tbody>
		</table>
	</div>
</div>

@la_access("Backups", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Ajouter Backup</h4>
			</div>
			{!! Form::open(['action' => 'LA\BackupsController@store', 'id' => 'backup-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
                    @la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'file_name')
					@la_input($module, 'backup_size')
					--}}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
				{!! Form::submit( 'Valider', ['class'=>'btn btn-success']) !!}
			</div>
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endla_access

@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/backup_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Rechercher"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#backup-add-form").validate({
		
	});
});
</script>
@endpush
