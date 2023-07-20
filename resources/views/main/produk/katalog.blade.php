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
					    <div class="container mt-2 flex">
                            <a class=" mr-1" title="Tiktok Shop" href="{{$product->link_tiktokshop}}" target="_blank">
                                <img src="https://iili.io/H4tFfrG.png" height="30px">
                            </a>
                            <a class=" mr-1" title="Shopee" href="{{$product->link_shopee}}" target="_blank">
                                <img src="https://iili.io/H4tFY2j.png" height="30px">
                            </a>
                            <a class=" mr-1" title="Chat Telegram" href="https://t.me/NewBotKatalog_bot?start=true" target="_blank">
                                <img src="https://iili.io/H4tFWEg.png" height="30px">
                            </a>
					    </div>
					    <div class="container padding-y text-right">
                            <a class="block btn btn-info btn-sm " title="Order" href="{{$product->link_shopee}}" target="_blank">
                                <i class="mdi mdi-cart"></i>
                                Order 
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