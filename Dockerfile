FROM tensorflow/tensorflow:0.10.0-devel-gpu

WORKDIR /tensorflow
RUN printf "\n\n\n\n\n3.0\n" | ./configure
RUN bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg && \
    pip install --upgrade /tmp/tensorflow_pkg/tensorflow-0.10.0-py2-none-any.whl

