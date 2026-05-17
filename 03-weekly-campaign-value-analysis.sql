WITH fb AS (
    SELECT
        date_trunc('week', f.ad_date::date) AS week_start,
        c.campaign_name AS campaign_name,
        SUM(COALESCE(f.value,0)) AS total_value
    FROM public.facebook_ads_basic_daily f
    LEFT JOIN public.facebook_campaign c
        ON f.campaign_id = c.campaign_id
    GROUP BY 1,2
),
gd AS (
    SELECT
        date_trunc('week', ad_date::date) AS week_start,
        campaign_name,
        SUM(COALESCE(value,0)) AS total_value
    FROM public.google_ads_basic_daily
    GROUP BY 1,2
),
all_campaigns AS (
    SELECT * FROM fb
    UNION ALL
    SELECT * FROM gd
),
weekly_totals AS (
    SELECT
        week_start,
        campaign_name,
        SUM(total_value) AS weekly_value
    FROM all_campaigns
    GROUP BY 1,2
)
SELECT
    TO_CHAR(week_start, 'YYYY-MM-DD') AS week_start,
    campaign_name,
    weekly_value
FROM weekly_totals
ORDER BY weekly_value DESC
LIMIT 1;