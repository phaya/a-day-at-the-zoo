README
================
Pablo Haya
24/02/2019

A Day At The Zoo
================

During a splendid sunny day at the zoo, I was collecting several data facts about animals I saw during the visit. I focused on gestation periods and mean number of offsprings. My first hypothesis was that longer gestation periods lead to fewer number of offsprings, as fetus will develop futher require more space preventing that other embryos grow up.

I performed a very straightforward analysis to test my hipothesis. The results could inspire a [enquiry-based learning](https://en.wikipedia.org/wiki/Inquiry-based_learning) activity for kids that combine outdoor activity, and data analysis.

Main conclusions
----------------

The following chart summarizes the results after analyzing the dataset:

![](README_files/figure-markdown_github/main-chart-1.png)

Animal's common name are showed in red, except felines that are highlighted in green. Human is represented by a blue triangle.

Several insigths can be extracted:

-   Most of the displayed animals has only one offspring. There is a lot of variance in the gestation period betwenn species with only one offspring.
-   It can be observed a slighty inverse relationship between gestation period and number of offsprings that points out to the original hypothesis. Actually, a regression analysis reveals a correlation of 0.3 It was found that number of offsprings significantly predicts gestation period (β = 0.004, p&lt;.001).
-   All displayed felines share low gestation periods, and a number of offsprings above one.
-   Elephant and hippopotamus gestation periods multiplies human gestation period by two and three respectively.

Dataset
-------

The [dataset](/blob/master/data/gestationoffsprings.csv) was gathered at [Madrid Zoo Acuarium](https://goo.gl/maps/ZUQfrk8Kr7A2) from animal data sheets on 23th Febraury, 2019. It is a non-random sample of the [Zoo's animals](https://www.zoomadrid.com/en/in-the-zoo/animals). All errors are my own.

Dataset attributes are:

-   `CommonName` most widely used name for this species.
-   `Gestation` number of days between conception and birth. It can be a single figure or a range.
-   `Offspring` number of offsprings produces at a time. It can be a single figure or a range.

**Important notes**

-   Lion's gestation period unit is weeks instead of days, as it appeared on the Zoo's data sheet.
-   Gestation refers specifically to viviparous animals, although there are non-viviparous species in the dataset. In this case, it should be named as incubation instead.

Dataset is provided in the same format as the original datasheets. Nonetheless, a [cleaned version](/blob/master/data/gestationoffsprings_clean.csv) of the data set is also available.

To Do
-----

-   Translate common names to english

License
-------

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />The material of this repository is licensed under <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
