select
  o.user_id,
  u.age as uder_age,
  u.gender as user_gender,
  u.state as user_state,
  u.street_address as user_street_address,
  u.postal_code as user_postal_code,
  u.city as user_city,
  u.country as user_country,
  u.latitude as user_latitude,
  u.longitude as user_longitude,
  u.traffic_source as user_traffic_source,
  o.order_id,
  o.status as order_status,
  o.created_at as order_created_at,
  o.returned_at as order_returned_at,
  o.shipped_at as order_shipped_at,
  o.delivered_at as order_delivered_at,
  oi.product_id,
  p.category as product_category,
  p.name as product_name,
  p.brand as product_brand,
  p.department as product_department,
  p.sku as product_sku,
  p.cost as product_cost,
  p.retail_price as product_retail_price,
  oi.sale_price as product_sale_price,
  p.distribution_center_id,
  dc.name as distribution_center,
  dc.latitude as distribution_center_latitude,
  dc.longitude as distribution_center_longitude,
  dc.distribution_center_geom
from bigquery-public-data.thelook_ecommerce.orders o
join bigquery-public-data.thelook_ecommerce.order_items oi
  on oi.order_id = o.order_id
  and oi.user_id = o.user_id
join bigquery-public-data.thelook_ecommerce.users u
  on u.id = oi.user_id
join bigquery-public-data.thelook_ecommerce.products p
  on oi.product_id = p.id
join bigquery-public-data.thelook_ecommerce.distribution_centers dc
  on dc.id = p.distribution_center_id
