#include <iostream>
#include <unordered_map>
#include <string>
#include <fstream>
#include "../header-files/LinkedList.h"

void build_list(List& mylist, std::string filename)
{
    std::ifstream in_file;
    std::string fileLine = "", ListNodeQuestion = "", ListNodeJobGroup = ""; 

    in_file.open(filename);

    while(getline(in_file, fileLine))
    {
        ListNode* newListNode = new ListNode;
        char lastCh = fileLine[fileLine.size() - 2];

        if(lastCh == '.')
        {
            newListNode->question = fileLine;
            
            getline(in_file, fileLine);
            for(int i = 0; i < static_cast<int>(fileLine.length()) - 1; i++)
            {
                char ch = fileLine[i];
                if(ch == '|')
                {
                    newListNode->JobGroups.push_back(ListNodeJobGroup);
                    ListNodeJobGroup = "";
                }
                else
                {
                    ListNodeJobGroup += ch;
                } //end of if else
            } //end of for
            newListNode->JobGroups.push_back(ListNodeJobGroup);
            ListNodeJobGroup = "";
            
            if (mylist.tail == nullptr)
            {
                mylist.head = newListNode;
                mylist.tail = newListNode;
            }
            else
            {
                newListNode->prev = mylist.tail;
                mylist.tail->next = newListNode;
                mylist.tail = newListNode;
            } //end of if else
        }
    } //end of while
}

void display (List& mylist) // displays list for testing
{
    ListNode* temp = new ListNode();
    temp = mylist.head;
    while (temp != nullptr)
    {
        std::cout << temp->question << std::endl;
        temp = temp->next;
    }
}

void free(List& mylist)
{   // deletes ListNodes of a list to prevent memory leaks
    ListNode* to_delete = mylist.head;
    while (to_delete != nullptr)
    {
        ListNode* next_to_delete = to_delete->next;
        delete to_delete;
        to_delete = next_to_delete;
    }
    mylist.head = nullptr;
    mylist.tail = nullptr;
}
