This repository contains the data, SPL Queries, and R analysis used to create a stock trading strategy. This strategy aims to capture profits by taking long positions in small cap stocks that have had a large breakout day and riding the momentum.
The data was collected manually by tracking 167 different stocks that had a daily gain of more than 5% assuming a stop loss was placed at the bottom of the breakout candle
The column attributes and definitions for the csv file are as follows

row = Row number

ticker = Stock ticker symbol

flag = Color code to determin the price action of the stock in reference to the 50 day SMA. R - price was well under 50 SMA, B- price had reached 50 SMA but closed beneath it, 
       G - Price had crossed over the 50 SMA, Y - Price opened and closed above 50 SMA but did not make new highs, P- price opened and closed above 50 SMA and made new highs

daily_increase = Percent increase of the stock

news = Was news a driving factor of the move and what kind of news was it

highs = Shows if the stock is making nwe 7 day highs, 14 day highs, 21 day highs etc...

move = Shows if this was the initial move above the 50 SMA, a secondary move, or a continued move

rsi = RSI reading on the breakout day

short_percent = What percent of shares are being sold short

volume = Volume on the breakout day

industry = What industry the stock is in

three_day_return = What percentage increase had occured three days after the initial breakout day

one_week_return = ''

two_week_return= ''

absolute_high = Greatest percent increase in the stock during a two week time frame

second_day = Refers to the candle following the breakout day, DR - red candle that closed lower, UG - green candle that closed higher etc..
             DR's that are highlited blue show that if a position is closed on the second day losses would be smaller than waiting for stop loss to be hit
             DR's that are highlited purple show that if a position is closed on the second day potential profits would have been missed

announcements = Shows if any news occured in the days following the move

Using this data I conducted cleaning to remove NULL values, correct mispellings, correct punctuation, and manipulate the data into datatypes that could be used for exploration
During my exploration I discovered ...

Holding stocks for three days had a 2/3 win/loss ratio with an average profit of 16.7% and an average loss of 9.4%

Holding stocks for one week had a 1/2 win/loss ratio with an average profit of 24.1% and an average loss of 9.9%

Holding stocks for two weeks had a 2/5 win/loss ratio with an average profit of 33.5% and an average loss of 11.9%

For stocks only held for 3 days an RSI greater than 65 had a total net profit of 213.9%

Removing stocks that had an RSI less than 55, short % less than 20 and a daily increase less than 50% removed 13 losers and 2 winners

There were 32 DR days that if I raised my Stop Loss would have reduced losses

There were 15 DR days that if I raised my Stop Loss would have reduced gains



Using this data I developed the following strategy

I will only take long positions in trades that have a daily increase of 5% to 50% and are trading under $5

I will not take trades that are being shorted more than 20%

I will hold the trades for three days and sell at the close of the third day, or when profits are over 130%

I will raise my stop loss to the bottom of the second day candle if it closes lower than the breakout day
