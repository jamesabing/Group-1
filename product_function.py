def get_all_products(connection):

    cursor = connection.cursor()

    query = ("SELECT product_table.idproduct_id, product_table.Name, product_table.oum_Id, product_table.price_per_unit, uom.uom_name"
             " FROM product_table INNER JOIN uom ON product_table.oum_id = uom.uom_id")

    cursor.execute(query)

    products = []
    for (idproduct_id, Name, oum_Id, price_per_unit, uom_name) in cursor:
        products.append({
            'id': idproduct_id,
            'name': Name,
            'oum_Id': oum_Id,
            'price_per_unit': price_per_unit,
            'uom_name': uom_name
        })

    cursor.close()
    return products

