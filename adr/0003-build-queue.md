- When user tries to start build, check queue count against number of buildings
- Add build start time to build_queue table
- Check every minute if build is complete
- User clicks button to complete build
    - Decrement build queue count
    - Increase unit table count
    - Consider resolving automatically on page load

- One new building at a time??