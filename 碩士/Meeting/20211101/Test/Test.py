
import csv
import matplotlib.pyplot as plt
import numpy as np

def ReadData(fileName):
    with open(f"{fileName}.csv", 'r') as f:
        rows = csv.reader(f)

        datas = np.array(list(rows))[1:,:]
        datas = np.float_(datas)
        return datas

'''
files = ['X', 'Z', 'Roll', 'Pitch']

for file_name in files:
        datas = ReadData(file_name)
        # print(datas[:,1])
        plt.plot(datas[:, 0], datas[:, 1])
        # plt.title(file_name)
        plt.xlabel("t(sec)")
        plt.ylabel(file_name)
        plt.grid()
        plt.savefig(f"./Fig/{file_name}.png")
        plt.show()

x_datas = ReadData("X")
z_datas = ReadData("Z")

plt.plot(x_datas[:, 1], z_datas[:, 1])
# plt.title("Response at X-Z plane")
plt.xlabel("x")
plt.ylabel("z")
plt.grid()
plt.savefig(f"./Fig/xz_plane.png")
plt.show()
'''

datas = ReadData("Roll")
end = 7500
plt.plot(datas[:end, 0], datas[:end, 1])
# plt.title(file_name)
plt.xlabel("t(sec)")
plt.ylabel("Roll angle(rad)")
plt.grid()
plt.savefig(f"./Fig/Roll_.png")
plt.show()
