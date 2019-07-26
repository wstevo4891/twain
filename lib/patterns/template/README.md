
# Template Method Pattern

The general idea of the Template Method pattern is to build an abstract base class with a skeletal method. This skeletal method (also called a template method) drives the bit of the processing that needs to vary, but it does so by making calls to abstract methods, which are then supplied by the concrete subclasses.

We pick the variation that we want by selecting one of those concrete subclasses.

In our example, the basic outline is all the things you need to do to generate a report: output any header information, the report title, and then each lien of the report. In this case, the detail-supplying methods of the subclasses deal with sriting out the report in the correct format, either plain text or HTML.

If we engineer all of these tasks correctly, we will end up separating the stuff that stays the same (the basic algorithm expressed in the template method) from the stuff that changes (the details supplied by the subclasses).

One characteristic that the HTMLReport and PlainTextReport classes share with all properly written Template Method pattern concrete subclasses is that they look fragmentary. Like the good concrete subclasses that they are, both HTMLReport and PlainTextReport override output_line and the other abstract methods. The subclasses get their fragmentary appearance from the fact that they do not override the key template method, output_report. In the Template Method pattern, the abstract base class controls the higher-level processing through the template method; the subclasses simply fill in the details.

## Hook Methods

Non-abstract methods that can be overridden in the concrete classes of the Template Method pattern are called hook methods. Hook methods permit the concrete classes to choose (1) to override the base implementation and do something different or (2) to simply accept the default implementation.

Frequently, the base class will define hook methods solely to let the concrete subclass know what is going on. When the Report class calls output_start, for example, it is telling its subclasses, “We are ready to start outputting the report, so if you need to do something, do it now.”

The default implementations of these informative hook methods are frequently empty. They exist merely to let the subclasses know what is happening but do not require the subclasses to override methods that do not interest them.

## Initialize is a Hook Method

There is another very common example of the Template Method pattern that is perhaps so pervasive that it is hard to see. Think about the initialize method that we use to set up our objects. All we know about initialize is that it is called sometime toward the end of the process of creating a new object instance and that it is a method that we can override in our class to do any specific initialization. Sounds like a hook method to me.

## Wrapping Up

The Template Method pattern is simply a fancy way of saying that if you want to vary an algorithm, one way to do so is to code the invariant part in a base class and to encapsulate the variable parts in methods that are defined by a number of subclasses. The base class can simply leave the methods completely undefined—in that case, the subclasses must supply the methods. Alternatively, the base class can provide a default implementation for the methods that the subclasses can override if they want.

Olsen, Russ. Design Patterns in Ruby (Addison-Wesley Professional Ruby Series) (pp. 65-75). Pearson Education. Kindle Edition.
