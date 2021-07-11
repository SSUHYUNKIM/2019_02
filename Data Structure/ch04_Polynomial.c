#include <stdio.h>
#include <stdlib.h>

typedef struct ListNode {
	int coef;
	int expon;
	struct ListNOde *Link;
}ListNode;

typedef struct ListHeader {
	int length;
	ListNode *head;
	ListNode *tail;
}ListHeader;

void init(ListHeader *plist)
{
	plist->length = 0;
	plist->head = plist->tail = NULL;
}

void insert_node(ListHeader *plist, int coef, int expon)
{
	ListNode * temp = (ListNode *)malloc(sizeof(ListNode));
	temp->coef = coef;
	temp->expon = expon;
	temp->Link = NULL;
	if (plist->tail == NULL)
	{
		plist->head = plist->tail = temp;
	}
	else
	{
		plist->tail->Link = temp;
		plist->tail = temp;
	}
	plist->length++;
}

void poly_add(ListHeader *p1, ListHeader *p2, ListHeader *p3)
{
	ListNode *a = p1->head;
	ListNode *b = p2->head;
	int sum;

	while (a&&b)
	{
		if (a->expon == b->expon)
		{
			sum = a->coef + b->coef;
			if (sum != 0)
			{
				insert_node(p3, sum, a->expon);
			}
			a = a->Link;
			b = b->Link;
		}
		else if (a->expon > b->expon)
		{
			insert_node(p3, a->coef, a->expon);
			a = a->Link;
		}
		else
		{
			insert_node(p3, b->coef, b->expon);
			b = b->Link;
		}
	}
	while (a != NULL)
	{
		insert_node(p3, a->coef, a->expon);
		a = a->Link;
	}
	while (b != NULL)
	{
		insert_node(p3, b->coef, b->expon);
		b = b->Link;
	}
}

void display_node(ListHeader *plist)
{
	ListNode *p = plist->head;
	while (p != NULL)
	{
		printf("%d*x^%d ", p->coef, p->expon);
		p = p->Link;
	}
}
void main()
{
	ListHeader list1, list2, list3;

	init(&list1);
	init(&list2);
	init(&list3);

	insert_node(&list1, 3, 6);
	insert_node(&list1, 7, 3);
	insert_node(&list1, -2, 2);
	insert_node(&list1, -9, 0);

	insert_node(&list2, -2, 6);
	insert_node(&list2, -4, 4);
	insert_node(&list2, 6, 2);
	insert_node(&list2, 6, 1);
	insert_node(&list2, 1, 0);

	poly_add(&list1, &list2, &list3);
	display_node(&list3);
