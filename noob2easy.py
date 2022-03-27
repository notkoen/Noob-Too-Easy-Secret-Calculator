#Noob 2 Easy Script for Calculating Secret
#By koen

DES = [1,3,6,5,4,8,0,9,2,7]
IPB = [
57,49,41,33,25,17, 9,1,
59,51,43,35,27,19,11,3,
61,53,45,37,29,21,13,5,
63,55,47,39,31,23,15,7,
58,50,42,34,26,18,10,2,
60,52,44,36,28,20,12,4,
62,54,46,38,30,22,14,6,
64,56,48,40,32,24,16,8 ]

button = input("Enter your HP: \n")
int_button = int(button)

if(int_button < 100):
    int_button = int_button * 10
if(int_button >= 1000):
    int_button = (int_button - int_button % 10) / 10

b1 = int(int_button % 10)
b2 = int(((int_button - b1) / 10) % 10)
b3 = int((((int_button - b1) / 10) - b2) / 10)

bk = IPB[DES[b1]] * IPB[DES[b2]] * IPB[DES[b3]] + IPB[DES[b1]]+IPB[DES[b2]] + IPB[DES[b3]] +IPB[DES[int((b1+b2+b3)%10)]]

print("Your secret code: ")
print(bk)
