Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2E314A62A
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738042402; cv=none; b=g6nG1CfNbYMRe+Q+zVCBmQq0V81XWP7STlikw0DCYAloFQ/iOTt8B0R01/kwC8rF7Om6uDPeTgV7xfpgv6yM+/sxTr+8b2pKNS9kDoO3HC5j5JWgk8PnzWj+NYR2fMKJWT9nyuwnmbTTR03F/cVrlyWaIn9IDxzg5KhnmO4OYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738042402; c=relaxed/simple;
	bh=vsu6cgsvHKwBowyBPOBpPBCq2EM+Gs+NrcIx6EM09Hc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YyoreDHd9p4EWluobVSmap35NYat3CyPCIDCH79uQZ3t+RI7TQmpUIDfjfKwCkFVXBYL6bo0Drqw4YQj8S5u9d/+R4VSiit5qVC96x8lDkXqUgVhGocIAga+/pSZehsuP7c4yESPjdFMEXiCJ+17uxEB/MoQ0H/STEwMTAAZbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hkqB/FNF; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hkqB/FNF"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so6923847a91.3
        for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 21:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042400; x=1738647200; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sle+tYzc1Kj6tbZ7/BHbrlcS2vI3Z3FG3YJYp8onC8U=;
        b=hkqB/FNFy75Zsi4uy9NC6W/d4Um1v2/T8FHtmHgfVLWyjumoYpy56W11bsUpDMpJEa
         /CpblRtEgB39pebFWefiPIbwXA5jm+M84WktXU9qiTiIciLSnVuXHzNGwB0IXZ/0euoY
         5D9K8lWYr9b9f6OgqIY0RS7QVlmHC0LcAUcYSyUS30ptUNrjecLa8ZGphNl999J+Ai/0
         7KzTT2j3J9KJK/L81DZfc3hOovQTQNm/sHbd1u6j46SzByH+42sWezjl9iI5/67Ct6P5
         ET5zkAdB1AHiXLl6/KQWoPi7UbHW0AN/M1FgjzB3xhlcLza2PdLadRumDfkmbd/CrDZT
         9Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042400; x=1738647200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sle+tYzc1Kj6tbZ7/BHbrlcS2vI3Z3FG3YJYp8onC8U=;
        b=l5P8Dg6OAiDBL0o866m27heOc/phYVDt1H9Wd4bUBC8ZjfO0MBOWV+49MZvJcSOgR/
         vQAgVpxAMFk1f+4uYXhKKU1cGaKS2A22DFAogBx/0zqCUusETTFN/+yjq4mutlDuRKfH
         5SLL9EgkMyq0sMWIlj9fbp8HfqjT/8BRDDOi2y/pWE0rO+2g4+QBwwtDIFGEziURFhJx
         QdlXaQLk+9z4hm4e1yHEXulqFB+u4nTawYTDNopJbOJmpmM4n4+0MQkOehjNI8hOILBW
         EXHZz5Bw1fjHkNqA2n47b+K6vmRV4Ix6FW5raszfleWkUnBzRE0LjjoA5htHI5VBmrzl
         83Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXADNJKzQYx7F0lQJ7PnPKuo96r7tjuGe0Uruy8zAcIgCNiPEGuMkZQfqXmCKd8HJQ4SRZi1xJzzW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq/lISZ7RUyznNHfBBDo8wazMKWr06OnLjQgsixM9puJjb8wwq
	D+Vz6Lp4JImP7qDHCI6VMIuEkOxoyARjivfpbU02cPiNT+JPM+cnFW1o9rkAjRw=
X-Gm-Gg: ASbGnct0TsySGuUCrQz73XBHEfCInmqEDGJJmuVSuGyhIE9ps71k1YMObaJFGRTxzXI
	QjZgtDdTf/PSFki4o4C9SL+oxw+CAdHBs7gSe+lyVtvzD40lRPTa+70gej+j4NWRX5Q6tBKUqb0
	Tc5U5O9otVQSEqwQLh5wkMlN/NGbsXPwWiuYmvM6MpVF/zmnhsn8+O30gXiVkBsnt9pzp51xRjP
	/BOVEsDIl99OjP3g856OZVftHOYFda4u7zZJjJK3KVi+5P+GGTvKfHvcbyb+DMptakcF2WB+/gB
	xlkGpJAdGQ8Ki/zQjPo86WWcoRc9G48=
X-Google-Smtp-Source: AGHT+IGZkd74wEJ76f8m4806LJQwkYr3HqMsqTNdi/AqpJOBfIND9TCgujBv+d+IppRw8DYDaApu3g==
X-Received: by 2002:a17:90b:5448:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f782c4d75cmr60542708a91.4.1738042400318;
        Mon, 27 Jan 2025 21:33:20 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:19 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Mon, 27 Jan 2025 21:33:08 -0800
Message-Id: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRsmGcC/3XNQQ6CMBCF4auQrq0p0ylSV97DGKJl0FlISUsa0
 XB3iytjZPm/ZL55iUiBKYp98RKBEkf2fQ7cFMLdzv2VJLe5BShAhQpk4OhS44eR7/ykhvoxTNL
 UukaNoDQYkU+HQB0/PuzxlPvGcfRh+nxJ5bIuoFElrICplEoikTXGWNe16hA4+ci92zp/F4uZ4
 NvRKw5kZ+fAWLTQGlX/cfS3gyuOzk5d2U5XF0uoLz/OPM9vIpGGXEsBAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=vsu6cgsvHKwBowyBPOBpPBCq2EM+Gs+NrcIx6EM09Hc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHPF7PA+2HPFSuWLm8pN9YV7aEamX16TPvjhzXHaFf
 dPLvSrrOkpZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjINWGG/xlTmq8y98Tnu3JM
 PDpzz7aGX8xCLSfWxBxJKV+muUvz4mmG/5nKU/TuzN/64MFXRbVQi1V2vg9VhU78lP8p3fVio5I
 wEyMA
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
- Charlie

