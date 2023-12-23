@include('layout.headerAuth')
<section class="section-content padding-y">
    <div class="container clearfix">
    	<div class="row">
    		<!-- {{$dataProduk}} -->
    		<div class="container">
			    <div class="card">
			        <div class="card-body">
			            <h3 class="card-title">{{$dataProduk->nama_produk}}</h3>
			            <h6 class="card-subtitle"><a href="/katalog">Produk Katalog</a> / {{$dataProduk->nama_produk}}</h6>
			            <div class="row">
			                <div class="col-lg-5 col-md-5 col-sm-6">
			                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
								  <ol class="carousel-indicators">
								    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
								    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								  </ol>
								  <div class="carousel-inner">
								  	<?php  $i = 0 ?>
						    		@forelse($dataProduk->foto as $product)
						    			<?php if ($i==0): ?>
										    <div class="carousel-item active">
										      <img class="d-block w-100 " src="{{'/'.$product->path}}" alt="Second slide">
										    </div>
						    			<?php else: ?>
										    <div class="carousel-item ">
										      <img class="d-block w-100 " src="{{'/'.$product->path}}" alt="Second slide">
										    </div>
						    			<?php endif ?>
						    			if
						    		{{$i++}}
						            @empty
				                    	<img 
				                    		src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png" 
				                    		alt="" 
				                    		width="100%"
				                    	/>
						            @endforelse
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
			                </div>
			                <div class="col-lg-7 col-md-7 col-sm-6">
			                    <h4 class="box-title mt-4">Product description</h4>
			                    <h6>Stok : {{$dataProduk->stok}}</h6>
			                    <p>{{$dataProduk->deskripsi}}</p>
			                    <h4 class="mt-2">
			                    	Rp. {{$dataProduk->harga}} 
			                    </h4>
			                    <div class="my-2">
			                    	<div class="btn-group" role="group">
									  <button type="button" class="btn btn-default">Warna</button>
									  <button type="button" class="btn btn-default"> : <b>{{$dataProduk->warna}}</b></button>
									</div>
								</div>
			                    <div class="my-2">
			                    	<div class="btn-group" role="group">
									  <button type="button" class="btn btn-default">Bahan</button>
									  <button type="button" class="btn btn-default"> : <b>{{$dataProduk->bahan}}</b></button>
									</div>
								</div>
			                    <div class="my-2">
			                    	<div class="btn-group" role="group">
									  <button type="button" class="btn btn-default">Ukuran</button>
									  <button type="button" class="btn btn-default"> : <b>{{$dataProduk->size}}</b></button>
									</div>
			                    	<div class="btn-group" role="group">
									  <button type="button" class="btn btn-default">Berat</button>
									  <button type="button" class="btn btn-default"> : <b>{{$dataProduk->berat}}</b></button>
									</div>
			                    </div>
			                    <div class="my-2">
			                    	<div class="btn-group" role="group">
									  <button type="button" class="btn btn-default">Penutup</button>
									  <button type="button" class="btn btn-default"> : <b>{{$dataProduk->penutup}}</b></button>
									</div>
								</div>
	                            <a class="block btn-sm " title="Order" href="{{$dataProduk->link_shopee}}" target="_blank">
	                                <img src="https://iili.io/JIjzCib.png" height="35px"> 
	                            </a>
			                    <button class="btn btn-dark btn-rounded" id="btn-chat" data-toggle="tooltip" title="" data-original-title="Chat Penjual">
			                        <i class="mdi mdi-chat"></i>
			                    </button>
			                </div>
			            </div>
			        </div>
			    </div>
	    	</div>
	    </div>
	</div>
</section>
@include('layout.footerApp')

<script src='https://cdn.jsdelivr.net/npm/botman-web-widget@0/build/js/widget.js'></script>
<script>

	$('#btn-chat').click(function(){
		let data = <?php echo $dataProduk; ?>;
		let foto = data.foto.length > 0 ? '../'+data.foto[0].path : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
		$('.desktop-closed-message-avatar').click();

		let text = `<img src="${foto}" width="200px"/> <p>Nama Produk : <b>${data.nama_produk} (${data.id})</b></p>`;
		setTimeout(function() {
			botmanChatWidget.say(text);
		}, 3000); // 3 seconds delay
	});

    var botmanWidget = {
	    title:'Katalog Bot',
	    mainColor:'#303030',
	    aboutText:'',
	    bubbleBackground:'#303030',
	    headerTextColor: '#fff',
	};

</script>
<style type="text/css">
	.desktop-closed-message-avatar{
		display: none !important;
	}
	.flex{
		display: flex;
		padding: 0px 8%;
	}
	.padding-y{
		padding: 10px;
	}
	.price{
		margin-top: 5px;
	}
	.title{
		margin-left: 10px;
	}
	.footer{
		left: 0px !important;
	}
	.bottom-wrap{
		display: flex;
	}
	body{
	    background-color: #edf1f5;
	    margin-top:20px;
	}
	.card {
	    margin-bottom: 30px;
	}
	.card {
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 0 solid transparent;
	    border-radius: 0;
	}
	.card .card-subtitle {
	    font-weight: 300;
	    margin-bottom: 10px;
	    color: #8898aa;
	}
	.table-product.table-striped tbody tr:nth-of-type(odd) {
	    background-color: #f3f8fa!important
	}
	.table-product td{
	    border-top: 0px solid #dee2e6 !important;
	    color: #728299!important;
	}
</style>