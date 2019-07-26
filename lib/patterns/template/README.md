
# Template Method Pattern

The general idea of the Template Method pattern is to build an abstract base class with a skeletal method. This skeletal method (also called a template method) drives the bit of the processing that needs to vary, but it does so by making calls to abstract methods, which are then supplied by the concrete subclasses.

We pick the variation that we want by selecting one of those concrete subclasses.

In our example, the basic outline is all the things you need to do to generate a report: output any header information, the report title, and then each lien of the report. In this case, the detail-supplying methods of the subclasses deal with sriting out the report in the correct format, either plain text or HTML.

If we engineer all of these tasks correctly, we will end up separating the stuff that stays the same (the basic algorithm expressed in the template method) from the stuff that changes (the details supplied by the subclasses).

One characteristic that the HTMLReport and PlainTextReport classes share with all properly written Template Method pattern concrete subclasses is that they look fragmentary. Like the good concrete subclasses that they are, both HTMLReport and PlainTextReport override output_line and the other abstract methods. The subclasses get their fragmentary appearance from the fact that they do not override the key template method, output_report. In the Template Method pattern, the abstract base class controls the higher-level processing through the template method; the subclasses simply fill in the details.

Olsen, Russ. Design Patterns in Ruby (Addison-Wesley Professional Ruby Series) (pp. 65-66). Pearson Education. Kindle Edition.
