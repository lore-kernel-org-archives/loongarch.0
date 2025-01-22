Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145651CAA66
	for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586617; cv=none; b=jnTGiXWItYumGb2j0a/f0G3oHuU+DRb96lOzDMyY0n/Cl0SciI371Lp3L6vAcolYxKmpH58ejo34gTreMy/50cB0ANmeb07UFZk29HjjK4z3PcirTeL1Dlj7VIiNS63OHobWZVcucOsM6b/yyFk+LTiUnxWuOsrhR/ee4LoOpH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586617; c=relaxed/simple;
	bh=mv7KUIbyKGHeuf7LA5c1+10gOtsNxeILI+8x5fj1ZI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CQhHXabLDJvl5qJU1bNbDcZrFJcDDnijHtR3mVXFDyCAhwl8bi3ppxIWgwxSNRDj3aJfC3y6UeP3NAPm6uQnOcyCbYoSbUnWPUlcyq++z6IqL+YNFwSWUTM6/RJYcxlEbkAx7dG6IwYz2qLknUksYU4OxYHY8A+w8k9lmwyUkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TfUS3ShR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TfUS3ShR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso505609a91.1
        for <loongarch@lists.linux.dev>; Wed, 22 Jan 2025 14:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586614; x=1738191414; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnzMlYCzKVvpxw7yPav+PLPBZlq1nGQlt5nCryj5lKM=;
        b=TfUS3ShRXvMtl+wY4+dsAOdEiHgEjH9WO1QJdkm1ootBLerqu8lNDmmQ4XqaLpTjKx
         giE1G8O5GyuorL4XHDMObTZpfboM+k8tPkTD1w5ZblHgfjBpnD3rKAGOMhcDz0HI0AtQ
         TqBCHmTeJ6EAM7l3JzePCDEiDyqu6dyuE6sF44ZLD55aHzKOpp6gmfbR2AE8PRHrEjK5
         TxTdZZXTOSGAz3nqAf/MaSHrNVdJlY0OeEFBHbEKO8H4igJbD8jzC6gW1PHtyF8cLbXF
         cqt/cAk94io+YSMrbRLiRcP8It90qIGqfQ70SDAcKr1Mlc5wieKIEj8YpP+OHwE6Vcl9
         vx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586614; x=1738191414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnzMlYCzKVvpxw7yPav+PLPBZlq1nGQlt5nCryj5lKM=;
        b=wAMHrkhf30ff0iWxnPU2Zoq1yvXmo8KOMgLiyeIQLU9Mc3sJBWj2l1Eo18UkGX8LC9
         5am4qQAoooGGjrk7SJsuO6ib9qkJ2eFqY6HKQhYdUIFAAKdQeOfTqI5LYVbb4bCTU60K
         UQENrfN0U0belOfL2jrUkzEzT2DdhxfDfgHFwUIaQ40n2yZ1MfsqxLe4Y6q79QEkDCM/
         X9eIsCiR1vfph+wWXIp4z4fas/85N2ST7glEZci7AMFNFAPrq98/kxCWdt4y2nNBCsRq
         6JgYCMalTrV7TOcQBn0GhSqFtLquzcR1EvAultwXyXJ55dylbwkwFW0pc5zvquaP5p0i
         6SHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV35F7cVQBDBT85oPAOKFxAFVt2PZSsLwbRR7SvCku+KcvNgBvcaL4ltIAMtaSavgKrzSQlk6jdAtg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHXbTutvZmQJc08Nr+Z6eUgPFy/i+0gBNO+ikAYBeY6qTqejpY
	W6CHKkKHMNgRB5Uq1zYPUq0X/XZDnAW8LZ9pWrACXP9z0wO3qSrM5ivUfuzWm90=
X-Gm-Gg: ASbGnctl1vEWHFwHuCJrH8E5ihmI3UPtPz26BP5VBKVLK0eEzKzQDQGV8wYj9m0mwTJ
	LZAH6YpIbBZAaTQAHLFzUcubC9FAqpcoM+0ady8ycVTosu8UAGHGjWld5gIqnAWUqFYlFvIaBP7
	sYtYPfmwbTUKHzZ1/0CuMfk55GBGGAu6vIQtZD9C9K9KuHTmO7JKKg1P2dtPbIKtfcZXb55FzBT
	G1LQ+loPV2CkIsA2LHt09lppi94LHdP2wOyxVKG2npKf/cF3uJmVA1jDNe2K8W9L+fYZqRxbnKb
	gjPRWwx22w==
X-Google-Smtp-Source: AGHT+IHB0x+Ki93nVMyNmjUvHS1Hbs7yWzbtT7Kml6NUqhDpPqvjvCne2/W3tEXbP1kUcPb30M8ZEw==
X-Received: by 2002:a17:90b:4b8d:b0:2ee:7a4f:9265 with SMTP id 98e67ed59e1d1-2f782c976f5mr35059946a91.15.1737586614341;
        Wed, 22 Jan 2025 14:56:54 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:53 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Wed, 22 Jan 2025 14:56:19 -0800
Message-Id: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN3kWcC/x3MTQqAIBBA4avErBNsNJCuEhFhU80iizGiH7x70
 vJbvPdCJGGK0BQvCJ0ceQsZVVmAX4Ywk+IxG1Cj1VajEo7+7Lf94JUf6ikccqvaGWeNRW2whpz
 uQhNf/7btUvoAcMITyGYAAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=mv7KUIbyKGHeuf7LA5c1+10gOtsNxeILI+8x5fj1ZI0=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8s0TrtXqsUUK2vXc8j4W/efQ3uZL75iF2SsOVnDeT
 A4Sej+/o5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlwXmT4n3/d44Sk1qzVd157
 MQQsunbo4UqfpE+mU7Yu3dsV5ztzqw8jQ/snE52ShgWi7NKP1iVNc5gjHhlyo0W+/uIiZvVbP9j
 e8gAA
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
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      loongarch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/switch_to.h  |  8 ++++++
 arch/loongarch/kernel/entry.S           | 22 +++++++--------
 arch/loongarch/kernel/process.c         | 36 ++++++++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h |  2 ++
 arch/riscv/kernel/entry.S               | 20 ++++++++------
 arch/riscv/kernel/process.c             | 21 ++++++++++++--
 include/linux/entry-common.h            | 43 +++++++++++++++++++++++++++--
 kernel/entry/common.c                   | 49 +--------------------------------
 8 files changed, 122 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie

