import torch
import ray


def test_pytorch():
  print('Testing PyTorch...')
  if torch.cuda.is_available():
    print("PyTorch can use GPUs!")

    # Check the number of GPUs available
    num_gpus = torch.cuda.device_count()
    print(f"Number of GPUs available: {num_gpus}")

    try:
      # Loop over all available GPUs and print their specifications
      for i in range(num_gpus):
        device = torch.device(f"cuda:{i}")
        gpu_properties = torch.cuda.get_device_properties(device)
        print(f"\nGPU {i} specifications:")
        print(f"  Name: {gpu_properties.name}")
        print(
            f"  Compute Capability: {gpu_properties.major}.{gpu_properties.minor}"
        )
        print(f"  Total memory (GB): {gpu_properties.total_memory / 1e9}")
        print(f"  Multiprocessors: {gpu_properties.multi_processor_count}")

      # Test PyTorch's ability to perform calculations on the GPU
      test_tensor = torch.tensor([1.0, 2.0]).cuda()
      print("\nPerforming operations on GPU...")
      print(f"Original tensor: {test_tensor}")
      print(f"Tensor after addition: {test_tensor + 2}")
      print("All PyTorch functionalities are working on the GPU!")

      print('PyTorch can access the GPU.')
    except RuntimeError as e:
      print('Error performing a calculation on the GPU:', e)
  else:
    print('PyTorch cannot access the GPU.')


def test_ray():
  print('Testing Ray...')
  ray.init(num_gpus=1)

  @ray.remote(num_gpus=1)
  def f():
    return torch.rand(1000, 1000).cuda().sum()

  try:
    result = ray.get(f.remote())
    print('Ray can perform calculations on the GPU.')
  except RuntimeError as e:
    print('Error performing a calculation on the GPU:', e)


if __name__ == "__main__":
  test_pytorch()
  test_ray()
