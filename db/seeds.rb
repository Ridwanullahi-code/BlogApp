third_user = User.create(name: 'Alex', photo: 'https://picsum.photos/200/200', bio: 'Teacher from Nigeria Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')

fourth_user = User.create(name: 'Danny', photo: 'https://picsum.photos/200/400', bio: 'Teacher from Kenya.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')

fifth_user = User.create(name: 'Rose', photo: 'https://picsum.photos/200/300', bio: 'Teacher from Kenya.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')


first_post = Post.create(author: fourth_user, title: 'Birthday', text: 'This is my first post')
second_post = Post.create(author: fourth_user, title: 'Hi', text: 'This is my Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries post')
third_post = Post.create(author: fifth_user, title: 'Dance', text: 'This is my third post')
	
first_post = Post.create(author: fifth_user, title: 'Birthday', text: 'This is my first post')
second_post = Post.create(author: third_user, title: 'Hi', text: 'This is my Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries post')
third_post = Post.create(author: third_user, title: 'Dance', text: 'This is my third post')
third_post = Post.create(author: third_user, title: 'Dance', text: 'This is my third post')
Comment.create(post: third_post, author: third_user, text: 'It was needed' )
Comment.create(post: third_post, author: third_user, text: 'It was needed' )
Comment.create(post: third_post, author: third_user, text: 'It was needed' )
Comment.create(post: first_post, author: fourth_user, text: 'It was needed' )
Comment.create(post: first_post, author: fourth_user, text: 'It was needed' )
Comment.create(post: first_post, author: fifth_user, text: 'It was needed' )
Comment.create(post: second_post, author: fifth_user, text: 'Sunny day today' )
Comment.create(post: third_post, author: fifth_user, text: 'Sunny day today' )