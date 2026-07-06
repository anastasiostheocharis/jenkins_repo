
Test · SH
#!/usr/bin/env bash
# A tiny test: run the app and check it says exactly what we expect.
# Exit 0 = pass (Jenkins stage goes green). Exit 1 = fail (stage goes red).
 
expected="Hello from the pipelineee!"
actual="$(./app.sh)"
 
if [ "$actual" = "$expected" ]; then
    echo "TEST PASSED: got the expected output."
    exit 0
else
    echo "TEST FAILED: expected '$expected' but got '$actual'."
    exit 1
fi
 