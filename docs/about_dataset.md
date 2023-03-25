# About `Steam Games Dataset`

This dataset consists of player count history, price history, and data about 2000 applications available in the Steam games platform.  The 2000 applications are the applications in Steam with the highest player count within the last 24 hours on the 11th of December 2017 chosen based on the player statistics provided in `SteamDB` (https://steamdb.info/graph/).  

The player count history of each application from `14-12-2017` to `12-08-2020` is available. Player count was collected in 5-minutes intervals for the top 1000 applications (`PlayerCountHistoryPart1.zip`) and in 1-hour intervals for the next 1000 applications(`PlayerCountHistoryPart2.zip`) using the ISteamUserStats interface of the Steamworks web API. One file per each application is available containing UTC Time and `Playercount` columns. 

The price history of non Free to Play applications are available from `07-04-2019` to `12-08-2020`. Price information was collected using the `StorefrontAPI` in `USD` currency and is available in daily frequency. Hence, price changes that did not last for 24 hours would not be available. One file per each application is available containing Date, Initialprice, Finalprice, and Discount columns. 

Data about the applications were collected using the `StorefrontAPI`, except for tags which was collected using SteamSpy API. The format of each file is described as follows:

- `applicationInformation.csv` : This file consists of the application ID used in Steam, application name, the release date of the application, application type representing whether the application is a game, mod, demo, advertising or dlc. (There are 1963 games in the dataset out of the 2000 applications.) Whether the game is Free to play or not is represented as a binary feature. Columns:
  - `appid`
  - `type`
  - `name`
  - `releasedate`
  - `freetoplay`
- `applicationDevelopers.csv`: Consist of the `appid` and a `list of the developers` of the application.
- `applicationPublishers.csv`: Consist of the `appid` and a `list of the publishers` of the application.
- `applicationSupportedlanguages.csv`: Consist of the `appid` and a `list of the languages` the application supports.
- `applicationGenres.csv`: Consist of the `appid` and a `list of the genres` assigned to the application on Steam store.
- `applicationTags.csv`: Consist of the `appid` and the `list of the tags` assigned to the application on Steam store.

Research Paper(s) resulting from this dataset:  D. Vihanga, M. Barlow, E. Lakshika and K. Kasmarik, "Weekly Seasonal Player Population Patterns in Online Games: A Time Series Clustering Approach," 2019 IEEE Conference on Games (CoG), London, United Kingdom, 2019, pp. 1-8, doi: 10.1109/CIG.2019.8848108.

