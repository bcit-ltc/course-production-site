# Quality Assurance Check

The purpose of the QA check is to ensure that the HTML output matches what was requested in the **original Word file**.

* Check:
  * [ ] module titles match
  * [ ] all links
  * [ ] dropboxes/assignments have been created
  * [ ] record any ugly URL's
  * [ ] instructions in the build file that indicate something is pending (placeholder or *to come*)

If we missed something that was requested, fix the problem in D2L and record it in the QA Report.

## Sample QA report

```bash
# QA Report

* [Medical Surveillance Programs](https://learn.bcit.ca/d2l/le/content/427907/viewContent/2722107/View)
  * missing image: flammable_storage.jpg

## Fixed
* [Fire Fighting](https://learn.bcit.ca/d2l/le/content/427907/viewContent/2722114/View)
  * added missing dropbox link
```

## QA check steps

1. Assign yourself the QA sub-task
1. Move Post-it into QA In Progress on production board
1. Check Teamwork messages tab for any last-minute messages
1. Compare the original Word doc to D2L
1. Record observations in a comment in the QA sub-task using the [QA Checklist](https://courseproduction.ltc.bcit.ca/qa-checklist.md)

    * eg. `* [Link to page]: description of observation`

1. Mark the sub-task complete
1. Notify the requestor that the task is complete with a parent task comment
1. Mark the parent task complete
1. Move Post-it into Complete on production board
