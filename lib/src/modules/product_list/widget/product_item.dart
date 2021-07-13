import 'package:flutter/material.dart';
import 'package:prox_web/src/modules/product_list/models/product_model.dart';

class ProductItem extends StatefulWidget {
  ProductModel model;
  Function callback;
  ProductItem({required this.model, required this.callback});
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController =
        TextEditingController(text: widget.model.quantityAvailable.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.model.description),
      ),
      onTap: () {},
      title: Text(widget.model.name),
      subtitle: Text("Rs. ${widget.model.discountPrice.toString()} \n Unit: ${widget.model.unit}"),
      isThreeLine: true,
      trailing: new Container(
        width: 150.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              flex: 3,
              child: TextFormField(
                  textAlign: TextAlign.end,
                  controller: _quantityController,
                  onChanged: (val) {
                    widget.callback(widget.model.id,int.parse(_quantityController.text));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
