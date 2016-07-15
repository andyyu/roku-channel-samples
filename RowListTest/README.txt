#About
- This branch includes tests of loop iteration times for creating content meta-data.
  Data is stored in an Associative Array
- All tests were done on an Austin running on Roku OS 7.2

#Test Results
- Linear increase in computation time with # of iterations
- No difference in speed between BrightScript thread, Render thread, and Task thread
- Only the Render Thread times out. It does so after ~30 seconds on an Austin.

##Future Considerations
- This test can be run on other Roku devices to test for performance differences
