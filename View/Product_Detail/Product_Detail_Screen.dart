import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Widget/MyProgressIndicator.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_Bloc.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_State.dart';
import 'package:apple_store/Model/DataClass/Product.dart';
import 'package:apple_store/View/Product_Detail/Widget/CustomButtonAddToCart_Widget.dart';
import 'package:apple_store/View/Product_Detail/Widget/DetailAppbar_Widget.dart';
import 'package:apple_store/View/Product_Detail/Widget/ProductInfoComment_Widget.dart';
import 'package:apple_store/View/Product_Detail/Widget/ProductInfo_Widget.dart';
import 'package:apple_store/View/Product_Detail/Widget/Product_Image_Section_Widget.dart';
import 'package:apple_store/View/Product_Detail/Widget/Variants/Colors_Widget_Variant.dart';
import 'package:apple_store/View/Product_Detail/Widget/Variants/Guarantee_Widget_Variant.dart';
import 'package:apple_store/View/Product_Detail/Widget/Variants/Storage_Widget_Variant.dart';
import 'package:apple_store/View/Product_Detail/Widget/Variants/Wat_Widget_Variant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/Product_Bloc/Product_Event.dart';
import '../../Model/DataClass/Product_Variant.dart';
import '../../Model/DataClass/Properties.dart';
import '../../Services/DI/di.dart';
import 'Widget/CustomButtonPrice_Widget.dart';
import 'Widget/ProductInfoDes_Widget.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.product});

  Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ScrollController _controller = ScrollController();

  List<Variant> variants = [];
  List<ProductColorVariant> colors = [];
  List<ProductStorageVariant> storage = [];
  List<String> guarantee = [];
  List<ProductWatVariant> wat = [];
  List<String> images = [];
  List<Properties> properties = [];

  String appbarTitle = '';
  String productName = '';
  String? content = '';

  num rate = 0.0;

  int selectedColor = 0;
  int selectedStorage = 0;
  int selectedGuarantee = 0;
  int selectedWat = 0;

  bool progress = false;
  bool selectedProductDec = false;
  bool selectedProductInfo = false;

  ProductBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) {
        var bloc = ProductBloc(di.get(), di.get());
        _getProductDetails(widget.product.id!, bloc);
        _getCategoryName(widget.product.category!,bloc);
        _getProperties(widget.product.id!,bloc);
        _getVariants(widget.product.id!,bloc);
        return bloc;
        },
      child: Scaffold(
        backgroundColor: MyColor.white,
        body: SafeArea(child: _getBody(context)),
      ),
    );
  }

  _getBody(BuildContext context) => BlocListener<ProductBloc, ProductState>(
        listener: (BuildContext context, state) {
          if (state is ProductLoadingState) {
            progress = state.active;
          }
          if (state is ProductDetailsState) {
            state.productDetail.fold((l) {}, (r) {
              productName = r.title!;
              content = r.content;
              images = r.gallery!;
              rate = r.rate!;
              variants = r.variant;
            });
          }
          if (state is ProductCategoryNameState) {
            state.category.fold((l) {
              appbarTitle = 'مشخصات محصول';
            }, (r) {
              appbarTitle = r;
            });
          }
          if (state is ProductVariantsState) {
            state.productVariant.fold((l) {}, (r) {
              _generateVariants(r);
            });
          }
          if (state is ProductPropertiesState) {
            state.properties.fold((l) => {}, (r) => {properties = r});
          }

          setState(() {});
        },
        child: _getUI(context),
      );

  _getUI(BuildContext context) => progress
      ? const Center(
          child: MyProgress(),
        )
      : Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: CustomScrollView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              dragStartBehavior: DragStartBehavior.start,
              slivers: [
                _getAppbar(),
                _getProductTitle(productName, context),
                _getGallerySection(images),
                for (var v in variants) ...[
                  _getProductVariantsListWidget(v, context),
                ],
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                _getProductInfo(),
                _getProductDec(),
                _getProductComment(),
                _getAddToCartBtn(
                    widget.product.price! + _calculatorPrice().toInt(),
                    widget.product.discount!),
                const SliverPadding(padding: EdgeInsets.only(bottom: 10))
              ],
            ),
          ),
        );

  _getAppbar() => SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 20),
        child: ProductDetailAppbar(title: appbarTitle),
      ));

  _getProductVariantsListWidget(Variant variant, BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Text(_getTitleVariant(variant),
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          SizedBox(
            height: 27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _getVariantsListLength(variant),
                itemBuilder: (context, index) =>
                    _generatorVariantFromType(variant, index)),
          )
        ],
      ),
    );
  }

  Widget _generatorVariantFromType(Variant variant, int index) {
    if (variant == Variant.COLOR) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedColor = index;
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: SelectColor(
              colors: colors[index],
              index: index,
              selected: selectedColor,
            )),
      );
    }
    if (variant == Variant.STORAGE) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedStorage = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: SelectStorage(
            storage: storage[index],
            index: index,
            selected: selectedStorage,
          ),
        ),
      );
    }
    if (variant == Variant.GUARANTEE) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedGuarantee = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: SelectGuarantee(
            guarantee: guarantee[index],
            index: index,
            selected: selectedGuarantee,
          ),
        ),
      );
    }
    if (variant == Variant.WAT) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedWat = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: SelectWat(
            wat: wat[index].value!,
            index: index,
            selected: selectedWat,
          ),
        ),
      );
    }
    return Text('error');
  }

  String _getTitleVariant(Variant variant) {
    if (variant == Variant.COLOR) {
      return 'انتخاب رنگ';
    }
    if (variant == Variant.STORAGE) {
      return 'انتخاب حافظه داخلی';
    }
    if (variant == Variant.GUARANTEE) {
      return 'انتخاب گارانتی محصول';
    }
    if (variant == Variant.WAT) {
      return 'انتخاب ولتاژ';
    }
    return '';
  }

  int _getVariantsListLength(Variant variant) {
    if (variant == Variant.COLOR) {
      return colors.length;
    }
    if (variant == Variant.STORAGE) {
      return storage.length;
    }
    if (variant == Variant.GUARANTEE) {
      return guarantee.length;
    }
    if (variant == Variant.WAT) {
      return wat.length;
    }
    return 0;
  }

  _getProductTitle(String title, BuildContext context) => SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.black87,
              ),
          textAlign: TextAlign.center,
        ),
      ));

  _getGallerySection(List<String> images) => SliverToBoxAdapter(
      child: ProductImageSection(images: images, rate: rate));

  _getProductInfo() => SliverToBoxAdapter(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedProductInfo = !selectedProductInfo;
            });
          },
          child: ProductInfo(
            title: 'مشخصات فنی :',
            properties: properties,
            selected: selectedProductInfo,
          ),
        ),
      );

  _getProductDec() => SliverToBoxAdapter(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedProductDec = !selectedProductDec;
            });
          },
          child: ProductInfoDec(
              title: 'توضیحات محصول :',
              content: content ?? '',
              selected: selectedProductDec),
        ),
      );

  _getProductComment() => SliverToBoxAdapter(
        child: ProductInfoComment(
          title: 'نظرات کاربران :',
          content: '',
        ),
      );

  _getAddToCartBtn(int price, int discount) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomButtonProductDetail(
                color: MyColor.blue,
                title: 'افزودن به سبد خرید',
                product: widget.product,
              ),
              SizedBox(
                height: 47,
                child: CustomButtonProductDetailPrice(
                    color: MyColor.green, price: price, dis: discount),
              ),
            ],
          ),
        ),
      );

  _generateVariants(ProductVariant r) {
    if (variants.contains(Variant.COLOR)) {
      List<ProductColorVariant> json = List<ProductColorVariant>.generate(
          (r.values?['color'] as List<dynamic>).length,
          (index) => ProductColorVariant.fromJson(r.values?['color'][index]));
      colors = json;
    }

    if (variants.contains(Variant.STORAGE)) {
      List<ProductStorageVariant> json = List<ProductStorageVariant>.generate(
          (r.values?['storage'] as List<dynamic>).length,
          (index) =>
              ProductStorageVariant.fromJson(r.values?['storage'][index]));
      storage = json;
    }

    if (variants.contains(Variant.GUARANTEE)) {
      var value = List<String>.generate(
          (r.values?['guarantee'] as List<dynamic>).length,
          (index) => r.values?['guarantee'][index]);
      guarantee = value;
    }

    if (variants.contains(Variant.WAT)) {
      var value = List<ProductWatVariant>.generate(
          (r.values?['wat'] as List<dynamic>).length,
          (index) => ProductWatVariant.fromJson(r.values?['wat'][index]));
      wat = value;
    }
  }

  int _calculatorPrice() {
    int value = 0;
    if (colors.isNotEmpty) {
      value += colors[selectedColor].change_price!;
    }
    if (storage.isNotEmpty) {
      value += storage[selectedStorage].change_price!;
    }
    if (wat.isNotEmpty) {
      value += wat[selectedWat].change_price!;
    }
    return value;
  }

  void _getProductDetails(String productId, ProductBloc bloc) {
    bloc.add(GetProductDetailsEvent(productId));
  }

  void _getVariants(String productId, ProductBloc bloc) {
    bloc.add(GetProductVariantsEvent(productId));
  }

  void _getCategoryName(String categoryId,ProductBloc bloc) {
    bloc.add(GetCategoryNameEvent(categoryId));
  }

  void _getProperties(String productId,ProductBloc bloc) {
    bloc.add(GetPropertiesEvent(productId));
  }
}
