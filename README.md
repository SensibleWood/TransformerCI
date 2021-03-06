# API Transformer demonstrator

This project was created to demonstrate a use case for API Transformer and accompanies a Nordic APIs blog post on the subject.

## Running the demo

This demo uses Docker to run a container that starts Jenkins with a pre-build configuration. Before running the project you need to:

* Clone this repository:

```
git clone https://github.com/SensibleWood/TransformerCI.git
```

* Clone it's pal that holds the Python web app:

```
git clone https://github.com/SensibleWood/TransformerWebApp.git
```

* Create an S3 bucket called "transformerdemo"

Then cd into the TransformerCI repository and execute:

```
./run-demo.sh
```

When the server has successfully booted you'll be able to access the Jenkins homepage at [http://localhost:8080](http://localhost:8080). Before you can run the demo end-to-end you'll need to add your AWS credentials at Manage Jenkins>Configure System>S3 (AWS Key and Secret). If you don't do this the build will be marked unstable.

Once you've added the key and secret, trigger the demo by committing a change to the TransformerWebApp repository. This shell script will do it for you:


```
cd ../TransformerWebApp
cat >> README.md<<EOF
Update of README.md
EOF

git commit -a -m "Code change to trigger build"
```

On the next poll a build will happen, transform the Swagger JSON and upload to your AWS S3 bucket.