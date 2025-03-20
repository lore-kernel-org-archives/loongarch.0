Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12A02248B8
	for <loongarch@lists.linux.dev>; Thu, 20 Mar 2025 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742491777; cv=none; b=nm/Sm7jo3DT+SMJKlOL9Aj/jNklJUANvdKSOPqK10q52vJiB1zTz0/FxIfiLeEhsHvLl3aik47XfiAkSs8HzB16d9OdMJ9bd4Gx7GrItdsnTfffmj/ZJav1BQtsrfH7xvziEg3V8w5mXo8PiNWtrTjpnni8cwVv3cF7eJ2z+bZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742491777; c=relaxed/simple;
	bh=a8buKjZuVTHhVCVaVyShn58mf2Nkd71JLIuuvN814fY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dqg6+7X48M+l0HL019s5JXeC+bO4vglSTR43fS0LINRTJPAIiAKizq0vFT09fqZUNDF4UXlNbJWXqR3tdM26SD6xluBguy1QajvA8bHfz9Fe/HirRPv5It5Df81k79+vk1uKVo2KkbvvtV7Q+UKzqzXLIy2RD4JPCgQFKK3AC0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IeL/beC6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IeL/beC6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22622ddcc35so28134265ad.2
        for <loongarch@lists.linux.dev>; Thu, 20 Mar 2025 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491774; x=1743096574; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOLJdCBk/78Wkkx/KXUXc/Jejf3oa/Cc0UGcw9XLKfM=;
        b=IeL/beC6chDSdZ9kBgV4Nv2OXIevXUiOFJL9K7xs4LCHaFJCUtPONxrkqw61+MIwf+
         VEEgbdMcd3AOUff/atw+kfoQL7FSFcX2zQlY57cMwyS4DGL0frby9cZAy31quVee11f6
         jJ7UR8CNaK9iattuDHGbTY0AN6+P41aHwSOrj+HTvzhr6GLRmkavKFFr9Hy1CT4rbQ77
         I4BiN/qf2RHU4UtXjgWunwzUqN+VPBDj4ZUIVWZ8wG2vkxIelYo/qcOqT1vLyGP1PKN4
         p4QnasBErUEdkdYcZHhFDcFElUUghQ5Y/sJRRkLHwMNgw4LfRa/dwrRfKZXYFyDowOHe
         6COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491774; x=1743096574;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOLJdCBk/78Wkkx/KXUXc/Jejf3oa/Cc0UGcw9XLKfM=;
        b=azJO8hKPFRPwgLzY8ZS5M7ZvRGpyC+gh3HgLbaJ8+CstCSYogjC6zwh63Ol/iRo48F
         fh3oCCtSb6h/V2yA1MCspE+scSNne4NSrk7TG5Cg7XFENwxWeNun7ewCtseUUcvUEm4R
         FD6ZVN7bffD8EPsOJfAmic45Co1VOYFICNuK0eH2zDW3fAIAD3RFQrS5nSFoEUwRF1N+
         LArKXYPEG2PQuRQ5uoI86ujf4dBLnADeYLFNOow2aCM5y3xgaYDIgEGPfpe22q48g5qZ
         JoBk3aGE7wSv8wu3EVKULxmVdss54ruamFcE+S2+jnRQ0LZCpvmNxlLX+oMhZDO7PALG
         Wb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXV7C9XuiUmLxLsZK0wkAte0PUnAOB9X6YWSiB6MjHkiOCclGcr+bKlGJ4sCL5xpUW6gMLIwXodJ9Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ2wegdEXyTHK4DaMSWNypSuXR+clT+qloEpdFkb6TkQRknmF4
	luum4Mcd2b7dri35+TqffGyxMvP70HPLONXp9HCCNe7j5kjCUQf8d56DwHSvAz0=
X-Gm-Gg: ASbGnctE0c0MmESSDqChyZZIs/o8NAHLdCkarmrP0nGdgo4ayG5GwZn9w2viwL6NGrG
	Yt9OZc+r3I7+wvg2uW6kz2bRUhl4hFObXEOeeRhXW0XSa4y4kuE/txW3k7Ieh8+vQOwl5OJsS+L
	7oiTvZNgR+nUiMCwWlFS3NSL0dYFTY4yoEUXVdnDPgKdU2aRmGGqXsHmFiQCbsAcaQbL1yKeIbV
	Mr0/q345pu3ETFhV4/MIBq07d5enGh/ncOd6PzNxvJj/KhBO/i4QbdsUAbYAGoqcMFgPh3yhPHO
	N543JhGfPAOYSZs/TRsjPKB1c+VGbucXwdc0A8ZDeix9ilGG1CuIQKD2YM6l
X-Google-Smtp-Source: AGHT+IFXuSVtt/SbthfzSQ7d/yin99emZxJRiizVTSUOUe3m9+sM1X8UQDxWeADHE07ExVrAEJGYsQ==
X-Received: by 2002:a17:902:e5ce:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22780e1968dmr3057635ad.46.1742491773712;
        Thu, 20 Mar 2025 10:29:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Thu, 20 Mar 2025 10:29:20 -0700
Message-Id: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBQ3GcC/3XNwW6DMAzG8Vepch6TcWIgPe09pqkawVl9KKkSF
 K2rePcFLkMTHP+f5J+fKnEUTup8eqrIWZKEsUTzclLu+jl+cSVDaYWABgxgFSW5fAn3SW7ywxc
 ep/ioqNOd0QZBI6lyeo/s5Xtl3z9KXyVNIT7WL7le1gUkqPEAzHUFlWG2RGSdH+AtSg5JRvfqw
 k0tZsatow8cLE7rkKyxOBB0O47eOubA0cXpGut101s2ut9xzNZpDxyzOp3zbQs4OLvj0J+jgQ4
 cKk5D0PY0eK8d/3Pmef4Fp6eT/tsBAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=a8buKjZuVTHhVCVaVyShn58mf2Nkd71JLIuuvN814fY=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qdgBKJN1WZ8kWL3/nEz5zO7lCjc+zutHMHZU2l6u0vG
 7RtqzfuKGVhEONikBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCISixgZZq9pOhD26vCzr4fX
 7Xh18IZ18jWF6RcO7KtT52crW/8uKILhv48Sb/bb/DkPLzx66Fw1+/PuvBcdEu1ipRP14vr/m9y
 T4wYA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

The Intel bot also reported "kernel test robot noticed a 1.9%
improvement of stress-ng.seek.ops_per_sec" [2]

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench
[2] https://lore.kernel.org/linux-riscv/202502051555.85ae6844-lkp@intel.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v6:
- Update commit message of patch 4 to contain performance numbers
- Link to v5: https://lore.kernel.org/r/20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com

Changes in v5:
- Rebase on 6.14-rc5
- Link to v4: https://lore.kernel.org/r/20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com

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
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie

