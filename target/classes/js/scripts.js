/*!
* Start Bootstrap - Shop Homepage v5.0.2 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

/**
thêm mới sản phẩm vào giỏ hàng với số lượng.
 */
function AddProductToCart(baseUrl, productId, quality) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, 	// Id sản phẩm
		quality: quality, 	// Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function (jsonResult) {
			// alert("Tổng số lượng sản phẩm có trong giỏ hàng là: " + jsonResult.totalItems)

			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			$( ".totalPrice").html(jsonResult.totalPrice);
			// location.reload(true);
			$([document.documentElement, document.body]).animate({
				scrollTop: $("#fileProductAvatar").offset().top
			}, 2000);

		},
		error: function (jqXhr, textStatus, errorMessage) {

		}
	});
}

function UpdateQualityCart(baseUrl, productId, quality){
	let data = {
		productId: productId, 	// Id sản phẩm
		quality: quality, 	// Số lượng cho vào giỏ hàng
	};
	jQuery.ajax({
		url: baseUrl + "/ajax/updateToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function (jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quality_" + productId).html(jsonResult.totalItems);
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			$( ".totalPrice").html(jsonResult.totalPrice);
			// $( ".tax").html(jsonResult.tax);
			// refresh page jquery . tim hieu
			location.reload(true);

		},
		error: function (jqXhr, textStatus, errorMessage) {

		}
	});
}

function DeleteToCart(baseUrl, productId){
	let data = {
		productId: productId, 	// Id sản phẩm
		// Số lượng cho vào giỏ hàng
	};
	jQuery.ajax({
		url: baseUrl + "/ajax/deleteCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function (jsonResult) {
		// tăng số lượng sản phẩm trong giỏ hàng trong icon
		$( ".totalPrice" ).html(jsonResult.totalPrice);
		// $( ".tax").html(jsonResult.tax);
		// refresh page jquery . tim hieu
		location.reload(true);
	},
	error: function (jqXhr, textStatus, errorMessage) {

	}
});
}