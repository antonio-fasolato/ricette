if __name__ == '__main__':
    import re

    print('Insert ingredient and weight. Insert done when finished.')
    count = 1
    ingredients = []
    total_weight = 0
    while True:
        data = input(f'{count}: ')
        if data == 'done':
            break

        regex = r"(.+) (\d*)"
        matches = re.findall(regex, data)
        if len(matches) == 0:
            print('wrong format. expected ingredient and weight')
            continue

        ingredients.append((matches[0][0], float(matches[0][1])))
        total_weight += float(matches[0][1])
        count += 1

    for ingredient in ingredients:
        print('{ingredient}: {percent:.2f}%'.format(ingredient=ingredient[0], percent=ingredient[1]*100/total_weight))
