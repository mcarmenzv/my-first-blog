from django.shortcuts import render
from django.utils import timezone
from .models import Post
from django.contrib.auth.models import User

def post_list(request):
	me = User.objects.get(username='mcarmenzv')
	posts =  Post.objects.filter(author=me)
	return render(request, 'blog/post_list.html', {'posts': posts})
