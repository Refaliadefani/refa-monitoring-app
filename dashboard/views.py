from django.shortcuts import render
import psutil

def index(request):
    cpu_usage = psutil.cpu_percent(interval=1)
    ram_info = psutil.virtual_memory()
    disk_info = psutil.disk_usage('/')

    context = {
        'cpu': cpu_usage,
        'ram': ram_info.percent,
        'storage': round(disk_info.free / (1024**3), 2)
    }
    
    return render(request, 'dashboard/index.html', context)