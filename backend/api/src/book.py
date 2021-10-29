"""Functionality that is related to accepting a file and sending it to the correct parser to generate a CMF profile."""
import os
# import yaml
from flask import json, request, jsonify, Blueprint, send_from_directory
# from werkzeug.exceptions import BadRequest


book_lib = Blueprint('book_lib', __name__)


@book_lib.route('/book', methods=['GET'])
def book():
    return jsonify("Here is a book")
    # """File submission Function
    # Params:
    #     result (string) [yaml, json] - type of return
    # Body:
    #     required:
    #         file (bytes) - Uploaded file

    #         ~ device control ~
    #         vendor (string) - the devices vendor
    #         product (string) - the devices product
    #     optional:

    #         ~ device positioning ~
    #         base (string)
    #         cloud (string)
    #         country (string)
    #         customer (string)
    #         geo (string)
    #         partner (string)
    #         site (string)



    # Returns:
    #     A yaml with the profile generated
    # """

    # # checks return type parameter, default jsonapi-developmentapi-development
    # try:
    #     returnType = request.args["result"]
    #     if returnType not in ["json", "yaml"]:
    #         raise KeyError
    # except KeyError:
    #     returnType = "json"

    # # Accept the file submission
    # if 'file' in request.files:
    #     file = request.files['file']
    #     file_bytes = file.stream.read()
    #     file_name = file.name
    #     if len(file_bytes) == 0:
    #         print(f"[{request.remote_addr}] INVALID submission: Submitted file 0 bytes.")
    #         raise BadRequest(f"[{request.remote_addr}] INVALID submission: Submitted file 0 bytes.")
    #     else:
    #         with open(os.path.join(UPLOAD_DIRECTORY, file_name), "wb") as fp:
    #             fp.write(file_bytes)
    # else:
    #     print(f'[{request.remote_addr}] INVALID REQUEST: Missing file, valid SHA256, or url.')
    #     raise BadRequest(f'[{request.remote_addr}] INVALID REQUEST: Missing file, valid SHA256, or url.')

    # # Check body for device control and device positioning inputs
    # req = request.form.to_dict()

    # # Device control is required
    # device_control = {}
    # for control in DEVICE_CONTROL:
    #     if control in req:
    #         device_control[control] = req.get(control)
    #     else:
    #         raise BadRequest(f"Missing {control} key in body")

    # device_positioning = {}
    # for position in DEVICE_POSITIONING:
    #     if position in req:
    #         device_positioning[position] = req.get(position)
    #     else:
    #         device_positioning[position] = ""

    # # send the file to the configuration parser to be parsed

    # reportObject = configIngestor(filePath=UPLOAD_DIRECTORY + file_name, deviceControl=device_control,
    #                               devicePositioning=device_positioning)
    # os.remove(UPLOAD_DIRECTORY + file_name)

    # # return function based on returnType parameter
    # if returnType == "yaml":  # place the CMF profile in a .yaml file
    #     profileName = "profile.yaml"
    #     profilePath = UPLOAD_DIRECTORY + profileName
    #     with open(profilePath, "w") as yamlFile:
    #         profile = yaml.dump(reportObject.reportToDict(), yamlFile)
    #     try:
    #         return send_from_directory(directory=UPLOAD_DIRECTORY, path=profileName, as_attachment=True)
    #     except FileNotFoundError:
    #         raise BadRequest(f"Core not operating properly. Please alert the team")
    # else:
    #     return jsonify(reportObject.reportToDict())
