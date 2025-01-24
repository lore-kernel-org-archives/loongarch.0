Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FEB1DB138
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 22:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737757889; cv=none; b=ddmkO0NIoLNR4L6NT0+JX8TkYZM6kAfUIXnNfOgTnhgEpYqTOnWYp5bBqkCLXeC0svXy4sDopJxyN65P2Zs/XktUGxmqIR26y047F42PIpl0BNx4OaMnTURHjsjkg9XZDh9ytHypzvpPtN2KkA1kFWdPjQZBzD61TwtoCka9F1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737757889; c=relaxed/simple;
	bh=QuTYhwkjqC2Q1qvisEg7E9GMLG0lRbTzGqUS/XuRBZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lxBFqcdHueJpqbYqksfKuPmlyPha+2lZFEif2UELboaEB4duBrocLM+vSvUFnUsA+okgiLmLvebq/AAgEftIA0aaJP5QB6+S2KvvJPPZHzHPYIF5XLIjVldf+2kqjNl8DXNKoeEjPyOB1MXWnzbx4FYqV8QPvA8AyyyujiKtjoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SfCwxao1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SfCwxao1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165cb60719so46919785ad.0
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757886; x=1738362686; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCdnCBzEep19sj1mltTtEXamKsaejEfo5Qiz5jj87Z8=;
        b=SfCwxao1RD2FfO9YV7SP+DBrEDwzOwB1RGic9gVfqtdUysU/i8pVtJYe5/T8P0vvP+
         MjgXMf2g6y1M3QBTBGviLWc1ySxiLI3Ozc4JME6J7IOPNQry66n4WGV4X6sRd9vRaXZC
         GqUyuedN9Yul6Jm2r6Xttn2BrfrseJveIKyMiqvpeYcHbX6vQKJForxVtIxxJVgBa7pt
         PND6aEk6xr+bYZonjQs+bOxCJXJ2y8NjYCWS6mdW1dt48F9h+NThEPk3rKHcy+NT47GE
         M9Euc01WeHWyB4K3sZ6cJoEqi1TNCNcdT0lsseE/9FnTRTfdFvAwF8geDCXOvefFM17N
         2DKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757886; x=1738362686;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCdnCBzEep19sj1mltTtEXamKsaejEfo5Qiz5jj87Z8=;
        b=ooNNBqC7NZRKaJzkMACQAL3Ve/u+8ajEUDwuA1Hf2oXnWNs7ziuFvgwmriFSrVc3ph
         GF7LOcuzKKJmjrdyGaz/JZ6KUVJraeHeNb9J2GZVFmO2V7W/lyHuOZ2+yBfMgGY60crZ
         tTY+VXCEC3JkRORKiW/Ujfi67eVaAuGCsUPKg1wFOe88/DyS7KJly4e2uzlyfX4+xiow
         D6O+N9HyviLKm9oTylRkbQARm8C6gvEgc2JHxdk3Q6FE+wdMqPnRs8aJOTetYmQy3wNI
         tdToJWDQ0gyrCK218teyoT//TwRjGKY9HHZKU6Z7tnxs2fSQGeBDf+7wto8kSzOK3nbE
         jLBw==
X-Forwarded-Encrypted: i=1; AJvYcCVwHvwuj45cMJULnGA7X4sh8wtGMLYxDYIQgGAApQtkeeHjoU7ss0x49KmXQ3eXQbIrqPk9pZ1WWhg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkWDaWzBplngA1/MZsNlcOIgk3ZSuZ59ecsjKrII7y/40fddtU
	84d5+5lnzgP2YeMQUkwEPPbeauIR9lMpmqxReurKOcJocFepjuIylCMkIDjPC47zHqKnl/WWi3G
	Q
X-Gm-Gg: ASbGncu67fICadJzotjAVyzg2MwIzH+fA/ZCvD8WkCDQGaPMZ1CH58SHbExAloB7AFn
	JNrOlGLaKarn32cYYV3DMocWpNH1voD24eBdjZZ63kp2b2tGH80FLRaPt3GK3IHy1VeRmaI8ctd
	JzEiSjuTCgjG8vQ6e2MeIYCtVFMR/2WfTKR9yl4UrqIO24PWCTSkc64Hf5fYLhdlhRWqW+Ztusa
	wmUzdA3wMkgxbG2LTfFiTK53Ju0I3MVB7ABDi1KXIEK0Xy4JgM/E68k+uiPRb3Q9O4fhUq4E8lx
	baproasUqY7X1LIsFqwF
X-Google-Smtp-Source: AGHT+IEEHymMdtBs9J+QK89q3SHcA3s5N088XlUlO7j0IZSWZHaUNaTFF3ke0CgoFEEi01F/zYr4WQ==
X-Received: by 2002:a05:6a00:448e:b0:72d:a208:d34e with SMTP id d2e1a72fcca58-72dafb557c2mr46816794b3a.18.1737757886587;
        Fri, 24 Jan 2025 14:31:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Fri, 24 Jan 2025 14:30:58 -0800
Message-Id: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIUlGcC/3XNQQqDMBCF4atI1k0ZJwk1XfUepUiJY52FRhIJt
 eLdG12Vgsv/wXyziEiBKYprsYhAiSP7IYc6FcJ1z+FFkpvcAgE1aEAZOLpU+3Hinj9U0zCFWZp
 KVVppBIVG5NMxUMvvnb0/cnccJx/m/Usqt3UDDZR4AKZSgtRE1hhjXdvALXDykQd3dr4Xm5nw1
 1EHDmbn4tBYbbExUP0567p+AYLMPfsDAQAA
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=QuTYhwkjqC2Q1qvisEg7E9GMLG0lRbTzGqUS/XuRBZU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkWVqjiq9v0POTmm/ff676f3HbWc2Lcr+dueW3cNas
 y/vDGe+6ihlYRDjYpAVU2ThudbA3HpHv+yoaNkEmDmsTCBDGLg4BWAil78xMmxVZP5oWDBHjUlx
 QvSs8hB966znfQcfawrPEmANFsitC2P478zY9FTVfenqsPl63zauXipzIyzV6Mcnic/hlWdl81N
 SGAA=
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
- Charlie

