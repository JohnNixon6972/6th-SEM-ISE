#function to add item to list
from secrets import choice


def add(list,item):
    list.append(item)

#function to remove item from list
def delete(list,item):
    list.remove(item)

#function to concatenate 2 list:
def concatenate(list1,list2):
    return list1 + list2 

#function to generate permutations of list
def permute(list):
    if len(list) == 0:
        return
    if len(list) == 1:
        return [list]
    
    prem_list = []
    for i in range(len(list)):
        m = list[i]
        remlist = list[:i] + list[i+1:]

        for p in permute(remlist):
            prem_list.append([m]+p)

        return prem_list

#function to find if item present in list
def search(list,item):
    return item in list

# Main menu driven function
def main():
    while True:
        print("------Menu------")
        print("1.Find")
        print("2.Concatenate")
        print("3.Permutation")
        print("4.Add")
        print("5.Delete")
        print("6.Exit")

        choice = int(input("Enter your choice :: "))

        if choice == 1:
            print("Enter list Elements")
            arr = list(map(int,input().split()))
            print("Enter item to be searched")
            item = int(input())
            print(search(arr,item))

        elif choice == 2:
            print("Enter list1 Elements")
            arr1 = list(map(int,input().split()))
            print("Enter list2 Elements")
            arr2 = list(map(int,input().split()))
            print(concatenate(arr1,arr2))

        elif choice == 3:
            print("Enter list Elements")
            arr = list(map(int,input().split()))
            print(permute(arr))
        
        elif choice == 4:
            print("Enter list Elements")
            arr = list(map(int,input().split()))
            print("Enter new element to be added to list")
            ele = int(input())
            print(add(arr,ele))

        elif choice == 5:
            print("Enter list Elements")
            arr = list(map(int,input().split()))
            print("Enter item to be deleted")
            item = int(input())
            delete(arr,item)
            print(arr)

        elif choice == 6:
            break
        else:
            print("Wrong option!!")

# code to trigger main function
if __name__ == "__main__":
    main()
        
