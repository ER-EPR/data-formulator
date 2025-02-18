FROM python:3

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir data_formulator
    # Note: we had to merge the two "pip install" package lists here, otherwise
    # the last "pip install" command in the OP may break dependency resolution…

CMD ["python", "-m", "data_formulator"]
