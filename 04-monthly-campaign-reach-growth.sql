WITH fb AS (
  SELECT
    date(f.ad_date) AS ad_date,
    c.campaign_name AS campaign_name,
    COALESCE(f.reach, f.impressions, 0) AS reach
  FROM public.facebook_ads_basic_daily f
  LEFT JOIN public.facebook_campaign c
    ON f.campaign_id = c.campaign_id
),
gd AS (
  SELECT
    date(ad.ad_date) AS ad_date,
    ad.campaign_name,
    COALESCE(ad.reach, ad.impressions, 0) AS reach
  FROM public.google_ads_basic_daily ad
),
combined AS (
  SELECT * FROM fb
  UNION ALL
  SELECT * FROM gd
),
monthly AS (
  SELECT
    TO_CHAR(date_trunc('month', ad_date), 'YYYY-MM') AS month,
    campaign_name,
    SUM(reach) AS month_reach
  FROM combined
  GROUP BY 1,2
),
monthly_lag AS (
  SELECT
    month,
    campaign_name,
    month_reach,
    LAG(month_reach) OVER (PARTITION BY campaign_name ORDER BY month) AS prev_month_reach,
    (month_reach - LAG(month_reach) OVER (PARTITION BY campaign_name ORDER BY month)) AS reach_diff
  FROM monthly
)
SELECT
  campaign_name,
  month AS month_with_increase,
  month_reach::float AS month_reach,
  prev_month_reach::float AS prev_month_reach,
  reach_diff::float AS absolute_increase
FROM monthly_lag
WHERE prev_month_reach IS NOT NULL
ORDER BY absolute_increase DESC
LIMIT 1;