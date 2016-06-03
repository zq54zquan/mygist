__author__ = 'zhouquan'
emptyList = []
weekdays = ['Monday','Tuesday','Wednesday','Thusday','Friday']
big_birds = ['emu','ostrich','cassowary']
first_names = ['Graham','John','Terry','Terry','Michael']

another_empty_list = list()

print(list('cat'))

a_tuple = ('ready','fire','aim')
print(list(a_tuple))
birthday = '1/6/1952'
print(birthday.split('/'))

first_names.append('Zeppo')
first_names.extend(weekdays)
print(first_names)
first_names.insert(4,'Sunday')
print(first_names)
del first_names[4]
print(first_names)
first_names.remove('John')
print(first_names)
print(first_names.pop(1))
print(first_names)



print(first_names.index('Terry'))

print('Graham' in first_names)


print(first_names.count('Graham'))

first_names.sort(reverse=True)
print(first_names)
print(len(first_names))


empty_tuple = ()
marx_tuple = 'Groucho','Chico','Harpo'
a,b,c = marx_tuple
print(a)
print(b)

empty_dict = {}
los = ['ab','cd','ef']
losdict = dict(los)

an = ['gh','ij']
andict = dict(an)

andict.update(losdict)
print(andict)
del andict['g']
print(andict)

print(andict.get('i'))
print(list(andict.keys()))


disaster = True
if disaster :
    print('weo!')
else:
    print("whee!")

x = 8
if 3<x<9:
    print('ok')

#wile else 没有走break就会走else
#for else 一样
while x < 10:
    print(x)
    x = x+1
else:
    print('x ='+str(x))

#推倒式
numberlist = [ number for number in range(1,6)]
print(numberlist)

a_list = [number for number in range(1,6) if number%2==0]
print(a_list)


rows = range(1,4)
cols = range(1,3)

cells = [(row,col) for row in rows for col in cols]
print(cells)


word = 'letters'
letter_counts  = {letter:word.count(letter) for letter in word}
print(letter_counts)


def is_none(thing):
    if thing is None:
        print('its none')
    elif thing:
        print('its true')
    else:
        print('its false')

is_none(None)

def defaultfunc(name,ll=[]):
    print(ll);

defaultfunc('',[123,23])
