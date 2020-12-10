-- 1. Finding 5 oldest users

Select *
From users
Order by created_at
Limit 5;

-- 2. Most Popular Registration Date 

Select 
    username,
    DAYNAME(created_at) as Day,
    Count(*) as Total
From users
Group By Day
Order By Total DESC;

-- 3. Identify Inactive Users (users with no photots)

Select username
From users
Left Join photos
    On users.id = photos.user_id
where photos.id is NULL;

-- 4. Identify most popular phot (and user who created it)

Select 
    username,
    photos.id, 
    photos.image_url, 
    COUNT(*) as total 
From photos
Inner Join likes
    On likes.photo_id = photos.id
Inner Join users
    On photos.user_id = users.id
Group By photos.id
Order By total DESC
Limit 1;

-- 5. Calculate avg number of photos per user

total number of photos / total number of users

Select 
(Select Count(*) From photos) / 
(Select Count(*) From users) as Average_Post;

-- 6. Top 5 most commonly used hashtags 

Select 
    tags.tag_name,
    count(*) as Total
From photo_tags
Join tags 
    On photo_tags.tag_id = tags.id
Group by tags.id
Order by Total DESC
Limit 5;
    
Select * From tags;
Select * From photo_tags;

-- 7. Users that liked every photo (Finding Bots)

Select 
    username,
    Count(*) as num_likes
From users
Inner Join likes
    On users.id = likes.user_id
Group by likes.user_id
Having num_likes = (Select Count(*) From photos);




