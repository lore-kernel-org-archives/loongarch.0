Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B96D1FDA7A
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215643; cv=none; b=iw8ZFNuLeKi4nmj4qWjZUk1eQsV/r00MfbYQXiOsYTqxoQ93sKBXdlYwIrlU5P18oYgzLalc0qD/5ZsrN5mTf8GLaRstBZ/N8JV8zcj9/3LdNq+8eej6vqOjjOgAW3DDK8Nyu0TvPlormYFEH62a4AkLNpe4/XnUp4MySM/J6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215643; c=relaxed/simple;
	bh=g0QrlFghj/wYi3pHrM1E4FGE1hrhwiJrmPHndROZfrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n/5KbcHnjYDQmdfMKoVVsb4zx1s/VvbfhoWODwYH+OhoOh6eSnUxTGnK2+Wx8jpBO5zXDJ51sKPrD3R+ik6WtnWOI2RgtHgFZikCtO5GbimGWfseqettKvRW8pM5q2bhKbNGP35mbJ6Ll6XgdkXddrTb8rBsmOhDvEM0ZI25DGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gB9+CK+X; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gB9+CK+X"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fef5c978ccso120457a91.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 15:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215641; x=1741820441; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXOEYTInHDTSYq1AFClqzRbl+ZkEHDGXfjWhKaTrwBI=;
        b=gB9+CK+XAVuDXi8rzs5hdUKTrFDaw8YD3HV3j/P9MU0QWBwVVe6jTLYgYfreFwbIfu
         AWvJjOuyZg1ksLr+gmz3UF6ukKFqD9W/Zu6jZcBAT5tsz0OB6lJdSXDCzOLsbYOT2NcN
         LGKCvwvib120c3Y5lZDM6WUhdBqpX06hSMI0vIVUkdqQEwJIxZZ3NZ1c7lZgaZsqbU5e
         my1KYeL7WgKSNuwor+IOOqpw7T7fVG80SBdSQ/eY0/YaWUGLA7HT5zRPd109IRxK3AvX
         fvmjjIDRSgKSOqkDh1DoCzcVr4d7g9wIP5zliotksA0RT3VQEg399OIXIKzJGrRIdM1O
         taiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215641; x=1741820441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXOEYTInHDTSYq1AFClqzRbl+ZkEHDGXfjWhKaTrwBI=;
        b=gOufBO0bkdd32gq0FzPXLlqmBTqt8Wyz+opE/5KTtHq53Ym6TzEqq6Wv1Cu9t3MDEF
         MrWaUnTJO8VKcAKziB90ocPSZ9jX+ZGR/JK+Vk5ralW11jiVLqX9Xn+S43Hfz9N6TCIY
         B/QRJWyPKJH0SMGL1XsOHRiPWHyehP4pLRYcDwbgkc2fZwpFC9Pszp+SlXFTc7+lyLaD
         WGCsbWrnLGGwHZW/4joTYmrKEipqkMxrNMWzkSzO/UbonfxItg9r6bbMOUITJqba/u1d
         tv2D3+kB+ye4Ua6bH2g2xeSefXW0saG9LjE49Ld8FXTR48YG8Ou+83IG/qCUQ9tNkVU1
         uP3A==
X-Forwarded-Encrypted: i=1; AJvYcCXH/UvIO8SPr5JCGDCulNG5RaFmOfINHdd1NJG1v4y6rCoivb08Xz6GIme0ip0FvN3rkstOkT9IBxw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWfNZkfdhdFtni0FVMzjNdzczhsQvAVTBdtuC/OlynSQ9sQTDv
	y0RN2ztxigSy8YfJYhVG10sU/IsQtGnPlgEx9GEBWRj040nUGm6tPqyxPrhPAVo=
X-Gm-Gg: ASbGncuD2m8go7ePXBUmBlPYxDKWrytB95W+h3Td54JxzrC3uwOUXufC3ISIl5yIjti
	l6rUJ6yltK7uPYyJCLpp8EO0qvIKqr/NaT8viTn5brE0ljKX8ETPlSRk9ZyXXmg2yzae8m8Oplz
	UFOXb+I1dJlwViXlNzWmfbdF64sBwmdaILC6wsHqmMrnWcKyyXoQZI+tORtbM+TNJjXUB8MVtQD
	lP+vXz+2PfvpjM31mZvTukae0nwUaRPEic52IkBOmVBQ6IGKTFQ3uDUticoj/gfTS92pH/wCtk0
	ADAjhu5FxP1/aceZHGFmvVnsRFIaOlj3X1kfZVFRiavXo6Kn2bvXykLFozQP
X-Google-Smtp-Source: AGHT+IGC2nc8khTnmGuhu0Gds3SKj5WRJ4Lw9OkM+lUlr5dLYMfrx7W+qe5bbMu3V+b1JB/wwlZfuw==
X-Received: by 2002:a05:6a21:78a8:b0:1f3:48ef:8aa0 with SMTP id adf61e73a8af0-1f34944ed96mr9881349637.6.1741215641152;
        Wed, 05 Mar 2025 15:00:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH RESEND v4 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Wed, 05 Mar 2025 15:00:24 -0800
Message-Id: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=g0QrlFghj/wYi3pHrM1E4FGE1hrhwiJrmPHndROZfrM=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69Mea/w8opI0a+Kna9vNuo8tW5fAtvxt4uYpv19N8
 504pyJgT0cpC4MYF4OsmCILz7UG5tY7+mVHRcsmwMxhZQIZwsDFKQATKQ9g+J81JzTmQg+vl6Dw
 6m9zz3m/LCjLuBUzMeizw23LdC2dBV2MDIsme6f4GU82P2Yu9ueXXMqj14vzqnwCntwxKK5c8Sp
 yIRcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v4:
- I had messed up warning for ct_state() on rebase, correct that issue
- Link to v3: https://lore.kernel.org/r/20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com

Changes in v3:
- Fixup comment to properly reflect args (Alex)
- Fix prototypes for loongarch (Huacai)
- Link to v2: https://lore.kernel.org/r/20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com

Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      LoongArch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 8 files changed, 119 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
Charlie Jenkins <charlie@rivosinc.com>

