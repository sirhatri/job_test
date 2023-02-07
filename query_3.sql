SELECT distinct(product_name) gift_name, product_img_url, product_url, product_price_min, product_short_description FROM grommet_products
INNER JOIN grommet_product_categories
ON grommet_products.id = grommet_product_categories.product_id
INNER JOIN grommet_gifts_categories
ON grommet_product_categories.product_category_id = grommet_gifts_categories.id
INNER JOIN grommet_product_to_keyword 
ON grommet_products.id = grommet_product_to_keyword.product_id
INNER JOIN grommet_product_keywords
ON grommet_product_to_keyword.keyword_id = grommet_product_keywords.id
WHERE grommet_gifts_categories.sub_category
IN ("Beauty & Personal Care", "Skincare")
OR grommet_product_keywords.keyword = 'Aromatherapy'
AND is_sold_out = 0
;