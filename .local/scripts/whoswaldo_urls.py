import sys
import argparse
import boto3


parser = argparse.ArgumentParser()
parser.add_argument('--aws-profile', type=str, default='cornellvision2')
parser.add_argument('--out', type=argparse.FileType('w'), default='./whoswaldo_signatures.csv', dest='output_file')
args = parser.parse_args()


session = boto3.Session(profile_name=args.aws_profile)

def parse_url(url):
    params = url.split('?')[1].split('&')
    param_dict = {}
    for p in params:
        [k, v] = p.split('=')
        param_dict[k] = v
    return param_dict

for i in range(6):
    url = session.client('s3').generate_presigned_url(ClientMethod='get_object', Params={'Bucket': 'whoswaldo', 'Key': f'release/whos_waldo_{i}.tar'}, ExpiresIn=7*24*60*60)
    params = parse_url(url)
    print("%i,%s,%s,%s" % (i, params['AWSAccessKeyId'], params['Signature'], params['Expires']), file=args.output_file)
