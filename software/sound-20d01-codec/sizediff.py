#!/usr/bin/env python3

import os
import sys

def human_readable_size(size_bytes):
    """Converts size in bytes to a human-readable format."""
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if size_bytes < 1024:
            return f"{size_bytes:.2f} {unit}"
        size_bytes /= 1024
    return f"{size_bytes:.2f} PB"

def compare_file_sizes(original_file, compressed_file):
    # Check if files exist
    if not os.path.isfile(original_file):
        print(f"Error: file '{original_file}' not found.")
        return
    if not os.path.isfile(compressed_file):
        print(f"Error: file '{compressed_file}' not found.")
        return

    # Get file sizes
    original_size = os.path.getsize(original_file)
    compressed_size = os.path.getsize(compressed_file)

    # Get delta size
    delta_size = original_size - compressed_size

    # Calculate compression percentage
    compression_ratio = (original_size - compressed_size) / original_size * 100

    # Print results
    print(f"Original file:     {human_readable_size(original_size)}")
    print(f"Compressed file:   {human_readable_size(compressed_size)}")
    print(f"Delta:             {human_readable_size(delta_size)}")
    print(f"Compression ratio: {compression_ratio:.2f}%")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <original file> <compressed file>")
    else:
        original_path = sys.argv[1]
        compressed_path = sys.argv[2]
        compare_file_sizes(original_path, compressed_path)
