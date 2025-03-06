Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57E1AAC9
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221848; cv=none; b=BtPd902/n6+1NhBgO7nKUrVaiwpp+zcpfTKXL1WkIoRQrt4wMM3eNTAm0oCEFMXKDvc6px4rmDmXTMmPPYYdjFH+VgiZMvEsFcbVm7EzSU8ZQsqDBQcCPAPP5QWYsS9IL5O7cJ15u1tasXX6BQNucjxTFvI/KDSK3oDoWlLbcag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221848; c=relaxed/simple;
	bh=/XPBPYPK+Ts2ontme00hSLTZRIeMbEhmEiIPzB22szs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kSeg0pEsEnNWp7zhTGkaJZ8vJSAy/YJcfRQRZa5TkE+1Z7zhy42glsw4p9Vu3WgXsjFLvJ5YqzLLBcv5yWsVoxx7Bkw5GlPrdyBrooUZ5Hg9k6VFTWVhvjSAjUv6cdsWpamGpOgye5IOwn1+OVTBsL+MCNZjwSkoM0YtKx0LnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BBcFw3ih; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BBcFw3ih"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223378e2b0dso940105ad.0
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 16:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221845; x=1741826645; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl5pQMvwhs9KXlNz+24dCzwkEL5L1AwJPXBGp3tpzqo=;
        b=BBcFw3ihZds730qxMLnaG5xTMCGszpcycgedpPc5Smy3a1JT2n3qgDEhiyCuO/+0sr
         3c6TsHD9+hkB3xeOCWQ06Ez1w0W3boiNV1uB9YWYLmZlk+NfAiKX6808FOUBu4AReiez
         9kZVT3u4I0T+30/M3U+KjKA3xMIpJVuaYR0Oqzd6AogHsC9ddEjzH6dlevbWt7m1J1Jb
         ljwmF9qh3hC3WVU2G3bnu91f9hhzxyuRvW11bhZdWb9q1OAwEuPbIALKKFyNNyCEikql
         pArjtDLERSY3C+0xGUQoDXtlq8dxRkpLUjCcLsb5YjT4Q7W2wKhdSzA3Bwel7MMkz0Tu
         Wdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221845; x=1741826645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl5pQMvwhs9KXlNz+24dCzwkEL5L1AwJPXBGp3tpzqo=;
        b=LpywBr48bK5IT7lVu3jEvjGRIp0udknCkYPDwg7nDLvjYyClximlcRSXh0aMmQmgww
         wOZKemNst9Avxrpwy+5SvNP4qSAldgT1SCJaPrBnx4XJDxtMnzazLkYdBsAczQ4jGiow
         ddAfPjBezYrxmmUTkYYLRptkxg5TiueBBQsCFeoSpEfsuJ1OeBkrA/aUBJp5rLQBgq2I
         JYY+EOqqeA5/dpSapxKyzfjH9R9CbRDvpWZsRq2Ourp6ON9ABqID5nkyKOOCCs5kvNJA
         1FsjEzkhdXktfmAt7WBRA36blE1Nqew/qOHTtQZUHJVl0SCezjXZR5k0wB91/28xRWfB
         JoDg==
X-Forwarded-Encrypted: i=1; AJvYcCUdyNYaFFXKkYIDBEHIhueTPo77cgEgNyWuVyV6B0E7OcqiEIHaWEw9sc7sjRvYPumGkOupIDBaAKo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwcg+O8vnDWOUR/tTVdqIip+vGRh6cXWzTl4LsTfndUttIJJsi
	qQlF+F29z0Y4TXU/NBUnVp5Poac4A8NwyxukbdE01xKDNYhWe1EqRrdNRX+AgAT8clbnqKGaO9I
	l
X-Gm-Gg: ASbGncvdsnO727UyaOOqQvFP9Ndr6zzQ3WZXR/eALgFlO0mnpM6CUqOIkw8rke/uR8K
	W6JDkX6W7o+xsHGTUVWOKIFB4qerURPLIj9pFXld7ythCFhdOrc81rFnJIIRnimM3nj2yUjt81o
	RwYLKzEDhxQ0KYdYaC7lLHYGkV96683ZjWG4/M+wdwj+Q/cBsLS5zXAi2YZNqxp7bW9Zl4BYgnP
	5olMz85joriJ0Gdk8V+ENVS3gC13T2WP3f6WWV31zENcFfUts9Fhq6UfBgxktY7bF6WdFWRByTI
	FZG7BYmNuLV563XfGHqqB7nfReI5pbddsBMUIu96SK8rL/QOhaOm16slOo7n
X-Google-Smtp-Source: AGHT+IHI2rP2Hyd2lOR7EMEDGvOEHYUYseZqcPAUg2IT9Fva6WUyScEehXV53qnCOoMF9yh/zzST8w==
X-Received: by 2002:a17:902:f710:b0:21f:2ded:76ea with SMTP id d9443c01a7336-223f1d6ccddmr92798435ad.36.1741221845509;
        Wed, 05 Mar 2025 16:44:05 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:04 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v5 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Wed, 05 Mar 2025 16:43:43 -0800
Message-Id: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/vyGcC/3XNwW7CMAzG8VdBOS8odWya7LT3QBMaqTt8oEFJF
 cFQ331pTxWix/8n+eenypyEs/rcPVXiIlniUIM+dipcfoZf1tLVVmAADRrQSXIop3gb5Sp/fOJ
 hTA9Nzjq0CMYCqXp6S9zLfWGP37UvkseYHsuX0szrDJJpYAMsjTYamT0R+dB35itJiVmGsA/xq
 mazwNqxGw5Upw1AHj10ZNwbx64d3HBsddzB9/Zw9oz2/MbBtdNuOLg4LvRta6AL/sWZpukfmPs
 pi5MBAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/XPBPYPK+Ts2ontme00hSLTZRIeMbEhmEiIPzB22szs=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ92c6erj6L4quN/7dqcybGPVlekXdFbf23JKd89sNn
 093enajo5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlcfsTIcOXwk9z4c12MHic+
 SL44N4X38GztPo8bhyp5i4s+sRisWsrwP7XpyOZn0m+5BC8/XdKZ9zfBw/v5w+91ZyS1G972H52
 Rxw4A
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

