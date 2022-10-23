from slugify import slugify


def cipherAbb(number):
    if number >= 1000000000:
        number = number / 1000000000
        number = f'{number:.1f}'
        return "{}{}".format(number, 'B')
    elif number >= 1000000:
        number = number / 1000000
        number = f'{number:.1f}'
        return "{}{}".format(number, 'M')
    elif number >= 1000:
        number = number / 1000
        number = f'{number:.1f}'
        return "{}{}".format(number, 'K')
    elif number == '' or number == None :
        return 0
    else:
        return number
        
def urlFormat(title, idpost):
    url = slugify(title, separator='%')
    return "{}-{}".format(url,idpost)