@include('layout.headerAuth')
<section class="section-pagetop bg-white flex">
    <div class="container clearfix padding-y">
    	<h3>Product Katalog</h3>
    </div>
    <!-- <div class="container clearfix padding-y text-right mt-1">
    	<a href="/">Login</a>
    </div> -->
</section>
<section class="section-content bg padding-y">
    <div class="container clearfix">
    	<div class="row">
    		@forelse($dataProduk as $product)
    		<div class="col-lg-3">
    			 <figure class="card card-product">

                    @if ($product->foto->count() > 0)
                        <div 
	                    	class="img-wrap padding-y"><img src="{{ $product->foto->first()->path }}" 
	                    	alt	
	                		width="100%"
	                		height="200px"
                        ></div>
                    @else
	                    <div class="img-wrap padding-y">
	                    	<img 
	                    		src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png" 
	                    		alt="" 
	                    		width="100%"
	                    		height="200px"
	                    	/>
	                    </div>
                    @endif
                    <div class="bottom-wrap">
					    <div class="container padding-y">
		                  	<h4 class="price">{{$product->nama_produk}}</h4>
                        	<h6 class="price">Rp. <?php echo number_format($product->harga, 2) ?></h6>
					    </div>
                    </div>
                    <div class="bottom-wrap">
					    <div class="container padding-y">
                            <a class="block btn-sm " title="Order" href="{{$product->link_shopee}}" target="_blank">
                                <img src="https://iili.io/JIjzCib.png" height="35px"> 
                            </a>
					    </div>
					    <div class="container my-3 mx-2  text-right">
                            <a class="block btn btn-success btn-sm " title="Order" href="/katalog/{{$product->id}}">
                                <i class="mdi mdi-eye"></i> Detail
                            </a>
					    </div>
                    </div>
    			 </figure>
    		</div>
            @empty
                <p>No Products found .</p>
            @endforelse
    	</div>

	</div>
</section>
@include('layout.footerApp')

<script>

    // var botmanWidget = {

    //     aboutText: '',

    //     introMessage: " Hi! I'm bot katalog."

    // };

    var botmanWidget = {
	    title:'Katalog Bot',
	    introMessage: 'Hallo, Selamat datang di toko kami. Apakah ada yang bisa kami bantu ?',
	    mainColor:'#303030',
	    aboutText:'',
	    bubbleBackground:'#303030',
	    headerTextColor: '#fff',
	};

</script>
<script src='https://cdn.jsdelivr.net/npm/botman-web-widget@0/build/js/widget.js'></script>
<style type="text/css">
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
</style>