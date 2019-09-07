@extends('la.layouts.app')

@section('htmlheader_title') Gestion des Collectes @endsection
@section('contentheader_title') Gestion des Collectes @endsection
@section('contentheader_description') Statut @endsection

@section('main-content')
  <!-- Main row -->
  <div class="row" style="height: 100%">
    @foreach($corbeilles as $c)
      @php
        if ($c->niveau <= 25) {
          $color = "bg-aqua";
        } elseif ($c->niveau <= 50) {
          $color = "bg-yellow";
        } elseif ($c->niveau <= 75) {
          $color = "bg-orange";
        } else {
          $color = "bg-red";
        }
      @endphp
      <div class="col-md-4">
        <div class="info-box {{ $color }}">
          <span class="info-box-icon"><i class="ion-ios-trash-outline"></i></span>

          <div class="info-box-content">
            <span class="info-box-text">
              <a style="color: #fff !important;" href="{{url(config('laraadmin.adminRoute'))}}/poubelles/{{$c->poubelleParent->id}}">
                {{ $c->poubelleParent->identifiant }}
              </a>
            </span>
            <span  class="info-box-number">
              <a style="color: #fff !important;" href="{{url(config('laraadmin.adminRoute'))}}/corbeilles/{{$c->id}}">
                {{ $c->identifiant }}
              </a>
            </span>

            <div class="progress">
              <div class="progress-bar" style="width: {{ $c->niveau }}%"></div>
            </div>
            <span class="progress-description">
              Niveau de déchets
            </span>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
    @endforeach
  </div><!-- /.row (main row) -->
@endsection

@push('styles')
<!-- Morris chart -->
<link rel="stylesheet" href="{{ asset('la-assets/plugins/morris/morris.css') }}">
<!-- jvectormap -->
<link rel="stylesheet" href="{{ asset('la-assets/plugins/jvectormap/jquery-jvectormap-1.2.2.css') }}">
<!-- Date Picker -->
<link rel="stylesheet" href="{{ asset('la-assets/plugins/datepicker/datepicker3.css') }}">
<!-- Daterange picker -->
<link rel="stylesheet" href="{{ asset('la-assets/plugins/daterangepicker/daterangepicker-bs3.css') }}">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="{{ asset('la-assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css') }}">
@endpush


@push('scripts')
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Sparkline -->
<script src="{{ asset('la-assets/plugins/sparkline/jquery.sparkline.min.js') }}"></script>
<!-- jvectormap -->
<script src="{{ asset('la-assets/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js') }}"></script>
<script src="{{ asset('la-assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js') }}"></script>
<!-- jQuery Knob Chart -->
<script src="{{ asset('la-assets/plugins/knob/jquery.knob.js') }}"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="{{ asset('la-assets/plugins/daterangepicker/daterangepicker.js') }}"></script>
<!-- datepicker -->
<script src="{{ asset('la-assets/plugins/datepicker/bootstrap-datepicker.js') }}"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="{{ asset('la-assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js') }}"></script>
<!-- FastClick -->
<script src="{{ asset('la-assets/plugins/fastclick/fastclick.js') }}"></script>
@endpush

@push('scripts')
<script>
(function($) {
	/*$('body').pgNotification({
		style: 'circle',
		title: 'LaraAdmin',
		message: "Welcome to LaraAdmin...",
		position: "top-right",
		timeout: 0,
		type: "success",
		thumbnail: '<img width="40" height="40" style="display: inline-block;" src="{{ Gravatar::fallback(asset('la-assets/img/user2-160x160.jpg'))->get(Auth::user()->email, 'default') }}" data-src="assets/img/profiles/avatar.jpg" data-src-retina="assets/img/profiles/avatar2x.jpg" alt="">'
	}).show();*/
})(window.jQuery);
</script>
@endpush