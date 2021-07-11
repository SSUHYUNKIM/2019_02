}QueueType;

void error(char *message)
{
	fprintf(stderr, "%s\n", message);
	exit(1);
}

void init_queue(QueueType *q)
{
	q->front = q->rear = 0;
}

int is_empty(QueueType *q)
{
	return(q->front == q->rear);
}

int is_full(QueueType *q)
{
	return ((q->rear + 1) % MAX_QUEUE_SIZE == q->front);
}

void enqueue(QueueType *q, element item)
{
	if (is_full(q))
		error("큐가 포화상태입니다");
	q->rear = (q->rear + 1) % MAX_QUEUE_SIZE;
	q->data[q->rear] = item;
}

element dequeue(QueueType *q)
{
	if (is_empty(q))
		error("큐가 공백상태입니다");
	q->front = (q->front + 1) % MAX_QUEUE_SIZE;
	return q->data[q->front];
}

void level_order(TreeNode *ptr)
{
	QueueType q;

	init_queue(&q);

	if (ptr == NULL) return;
	enqueue(&q, ptr);
	while (!is_empty(&q)) {
		ptr = dequeue(&q);
		printf(" [%d] ", ptr->data);
		if (ptr->left)
			enqueue(&q, ptr->left);
		if (ptr->right)
			enqueue(&q, ptr->right);
	}
}

TreeNode n1 = { 2, NULL, NULL };
TreeNode n2 = { 3, NULL, NULL };
TreeNode n3 = { 12,&n1, NULL };
TreeNode n4 = { 1, NULL, NULL };
TreeNode n5 = { 11, &n2, NULL };
TreeNode n6 = { 7, &n4, &n3 };
TreeNode n7 = { 9, NULL, NULL };
TreeNode n8 = { 4, NULL, &n5 };
TreeNode n9 = { 5, &n7, &n6 };
TreeNode n10 = { 8, &n9, &n8 };
TreeNode *root = &n10;

int MAXIMUM(TreeNode *root) {
	int root_val, left, right, max = INT_MIN;

	if (root != NULL) {
		root_val = root->data;
		left = MAXIMUM(root->left);
		right = MAXIMUM(root->right);
		if (left > right)
			max = left;
		else max = right;
		if (root_val > max)
			max = root_val;
	}
	return max;
}

int MINIMUM(TreeNode *root) {
	int root_val, left, right, min = INT_MAX;

	if (root != NULL) {
		root_val = root->data;
		left = MINIMUM(root->left);
		right = MINIMUM(root->right);
		if (left < right)
			min = left;
		else min = right;
		if (root_val < min)
			min = root_val;
	}
	return min;

}
int main() {
	printf("레벨 순회=");
	level_order(root);
	printf("\n");
	printf("MAX = %d\n", MAXIMUM(root));
	printf("MIN = %d\n", MINIMUM(root));

	system("paus
