![Alt text](/images/xee_01.png)

XEEPluralizer
=============

XEEPluralizer is a class that helps you perform gramtically correct pluralization of the words in various languages.
Pluralization is a trivial task for most of the well known world's langauges. But for some langages (mostly Slavic) it can be a nuisance.
For example in English word "wolf" woulf be pluralized like this:
<li>
<ul>1 wolf</ul>
<ul>2 wolves</ul>
<ul>3 wolves</ul>
<ul>...</ul>
</li>

In Slovenian, for example, the same thing would look like this:
<li>
<ul>1 volk</ul>
<ul>2 volkovi</ul>
<ul>3 volkova</ul>
<ul>4 volkova</ul>
<ul>5 volkov</ul>
<ul>6 volkov</ul>
<ul>7 volkov</ul>
<ul>...</ul>
</li>

In Croatian and Serbian, on the other hand, it would look like this:
<li>
<ul>1 vuk</ul>
<ul>2 vuka</ul>
<ul>3 vuka</ul>
<ul>4 vuka</ul>
<ul>5 vukova</ul>
<ul>6 vukova</ul>
<ul>...</ul>
<ul>11 vukova</ul>
<ul>12 vukova</ul>
<ul>...</ul>
<ul>20 vukova</ul>
<ul>21 vuk</ul>
<ul>22 vuka</ul>
<ul>23 vuka</ul>
<ul>24 vuka</ul>
<ul>25 vukova</ul>
<ul>...</ul>
</li>


Usage
------------

```objc
XEEPluralizer* pluralizerWolf = [[XEEPluralizer alloc] initWithWordForms:
  @{kXEEPluralizerFormSingular : NSLocalizedString(@"wolfSingular", nil),
    kXEEPluralizerFormDual : NSLocalizedString(@"wolfDual", nil),
    kXEEPluralizerFormPaucal : NSLocalizedString(@"wolfPaucal", nil),
    kXEEPluralizerFormPlural : NSLocalizedString(@"wolfPlural", nil)
  }];
    
for (int i = 0; i< 100; i++) {
  NSLog(@"%@", [pluralizerWolf pluralizedSyntagmForQuantity:N]);
}
```

Localizable.strings // English
```
"wolfSingular" = "wolf";
"wolfPlural" = "wolves";
```

Localizable.strings // Croatian
```
"wolfSingular" = "vuk";
"wolfPaucal" = "vuka";
"wolfPlural" = "vukova";
```

Localizable.strings // Slovenian
```
"wolfSingular" = "volk";
"wolfDual" = "volkova";
"wolfPaucal" = "volkovi";
"wolfPlural" = "volkov";
```


Contact
================

Follow XEETech on Twitter (<a href="https://twitter.com/XEE_Tech">XEE Tech</a>).

Connect with us on LinkedIn (<a href="http://www.linkedin.com/company/xee-tech">@XEE_Tech</a>).


License
================
XEEPluralizer is available under the MIT license. See the LICENSE file for more info.

