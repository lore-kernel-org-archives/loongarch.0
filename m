Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35914A4E1
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659720; cv=none; b=VMJvto1coUbXjLPcjZUcBfzeBi/ljpJyT6JNNO4DJX5j6SYBpjqjeM9lb6YWyK4bKOW7MtW/tMK7pcCYdk24Q8PaKhrsgjEj5JJU2pURlfPyNeqCO1i+4v7/qPd3G6/4G++WmJryEWxgagJrkvRK4fHmSCuBA9riktp9wgFtEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659720; c=relaxed/simple;
	bh=07MvLhT2Wy7RrEKkDU/7g2rxiX30LJFHB9CllhdgXSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jFyGPI3IDm8dVydLJmHQ0kM8QOpZbBM3Mply3cIEPpfCmCZdW0BlfIlGvwRSB8KHzdetf5PegVhSQbLdIbeWg6JWWo5EaOrTlijVXc+wuqHS31EBvAlMGfCSVtgH0L+kzKG5T0zjZH9wk0CfTqL/KH2DmbQUjRt7pNBhUSAz368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qY7eiSJJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qY7eiSJJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb95317so23405445ad.1
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 11:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659717; x=1738264517; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbFhHhTinc/thmLT0MtA207eqVgoMSXCZVa6DhPymsA=;
        b=qY7eiSJJZpbE6k1LtGFjXR6FhxxQKaljDY1Hzqloe1k5mr1CieVmCLAn+T7q6PcJ5W
         vQlOPPHi08Vk4JkX0txG21rbbr5/3/DtCee82F1p9bJ22lBlJ2KxeN9Aj7AtuVbxe01u
         r7zCPSTQHiuNt1xRAgp85b3u+2xBkPGDCTzF+GTphZPQyrWUZOP4lPzA02g0FoFcG3+X
         o3Fmfewn6tToGgZSjJbA5snSCKHhvbmUkJijTBdNxdtgOF+Iyl+Lnj3aJqW319kh/3aW
         VT9OIREEoImTuRcs8Ax8N1tkpk+TO0Caksnwoxo+frFA369p0BE/6PBeRjhwpIMFTclw
         ThTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659717; x=1738264517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbFhHhTinc/thmLT0MtA207eqVgoMSXCZVa6DhPymsA=;
        b=qqpeHEws/chJ6hZdeGiez6MVMIU7+rOKxVEsIhjnyPym8uc8bA7MJv0YtEl2+eRh+H
         JaPY6H03janRyJ82QUBOlSZeAq2OvYqglIeQuxI94i2am3T49tV4xm1Ka2eO4gicoTSc
         eyKHC6l7hh76PCxXRV/NRsQnJI+m4NJly23KAnb+tDPcETHWEdJiwAhFvdRe/eJx3hOT
         tt6XWM62N/io34vkJY8PLBKbPm8AyOSjI9HQei3jop4h0Q39skAZBQsZfb3iErw6nHIj
         h6bxAVxR88ecoE6aQDm3Ef6DU+fNOcpQDlUfAsDDhUnkTKCiJc0DbJ2ZugDNk2ZzFt90
         TvSw==
X-Forwarded-Encrypted: i=1; AJvYcCWD3PIeNU6EFLwRYkirWhto51JQ9XzAaF+vN2B5EXyupDy3/D/zirJjKnhhSyDq0ohgYx6lHALZNLs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWuybgHEZ4cK4bS29a1pm2XTDS4ODFQgftI9Ck3Fu3UKADG7B7
	8l8jspVzeIdjbUQdICmshgneKQ8G7vSNBiGjeCeN66JpFg7SlGNlkQgzBP9sMgM=
X-Gm-Gg: ASbGncsJCkGVXUVmLBLXOXaAwD17CHVhqxShXSHk0z9wq/Dh+AN1IUoQ80nKthUPxk6
	gRchESftpt01pS68dwRa+VVE8fisS8taTQu6SI2ysJDwT4qDmdOICXNWbdVVwWRrcbUmraH8JFt
	2jXfpBI03oXLPSdHQTdikIoVr3KEZiq7F4mJqGA5PjybUd4dEWP3hW1te4Mp+9DM14kkjZOTYnb
	CoYUlOqRT551qnXG8ukCkFekN+ZTmCfhIL/ROOAyTKmlIepZ+C04dwlqeJ9ovx2uDjQVqZHW6RB
	0vM6BNvyYWD0NUnUhudH
X-Google-Smtp-Source: AGHT+IHpzV+15pT9rC0dv425JvS+EQ7ijp2j9zmm/V4a6N6t16e1ARxMwg63ScRMethPfVN56ayBDw==
X-Received: by 2002:a17:902:eccf:b0:215:7cde:7fa3 with SMTP id d9443c01a7336-21c355301e2mr397914035ad.25.1737659716962;
        Thu, 23 Jan 2025 11:15:16 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Thu, 23 Jan 2025 11:14:28 -0800
Message-Id: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABSVkmcC/3WNQQqDMBBFryJZN2UcE9Cueg8RKXGsszCRiYRa8
 e6N7rt8D/77u4okTFE9il0JJY4cfAa8FcpNL/8mzUNmhYAGDKAWji71YVl55i/15FfZtK2r2lQ
 GoUKr8nQRGvlzZdsu88RxDbJdL6k87Rm0UOKfYCo1aEPUWGsbNw7wFE4hsnd3F2bVHcfxA9Aq+
 Ji7AAAA
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=07MvLhT2Wy7RrEKkDU/7g2rxiX30LJFHB9CllhdgXSA=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqdaz2SP2T34j8rlu2aSJZyu8VfoWbWAwlOEKlThfb
 pz69blFRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABM5dZmRYQN7ftcXnRyDwp93
 f5bZ/I1e1yW9ZokJ/yozL/eAozln7BkZHn/4bX1k54E6kchzPancQftU3ngJ7bUJ9XI7LVv6M1i
 ODQA=
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
Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      loongarch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  5 +++
 arch/loongarch/include/asm/switch_to.h      |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 34 ++++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 9 files changed, 125 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie

