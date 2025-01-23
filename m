Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61620F98A
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638901; cv=none; b=XenmpSc5g9xI37Prf61dC+GApXHXyWYY5z23N65bUP2vIltGeVOze0BJnnj8RmXv3gpstQbYdr4OeCh1m6oHXkUfUKRRU96GMt1QCujXXF6YbbCB4BU153f0VKUFfBQfX+kGvETB1J4l1c3VD7CUSN7J1r+YeHxarT942vyV1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638901; c=relaxed/simple;
	bh=2QT8xw8Hnr0PZ0li5OKVWEtgoR+SI3nKyV65SN+WB9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kBp6vtUem1+bABw4im0Av5bRvheVy+GRVyDVkPpxFIjNTcCuyFer5LDKLyfFEKV5PWmTwKvfrGlWbUJCr1YFylqgxgN3SZnXnIBCkIT2wJ89TBI2lsi4HxVvj02M+LeaREUkH6pA/GyLQTnF86JQk14JN8OKLnSEs7sICUt5Tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=K1Ps9ywA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="K1Ps9ywA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21644aca3a0so18727655ad.3
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638899; x=1738243699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=K1Ps9ywA2YvZ40TOZfY0SmseasWT2NCNkWHL552pyTVjr5Xtlpr5k01cmgKwMWnVnL
         WtgIuKosefY2SL2thhaGhE8vdfTAx+VVXQZn6fyzE7ok2+SEF2tT1UAjWbiwsd0LxUXw
         sheBVrfNyMnEKt1vwz1fGxv/K4lmhijI5+kwzLVvVgoJRohrorSQq+7mnXmM72kBb1Vu
         NpTRyxUmEJoB5APD7HzlfacK8hGIrN0pPXkrYxsTsJDcJmOeHOe3NPFdIYo7IykEUNqV
         Lz8mRmO1uqtoGoxmQsHia9voV+zzxcgOxm9OdVG0fnXJpo2vF0jV7CcIUrSN6BkxcQX7
         qTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638899; x=1738243699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcMJmKKEtX+iYg+m7hTSfwAHD3Zpn1mRc3DXgtsxucU=;
        b=kM8s3fryfhyrsbbjGwgVvnPGvpkaxTM5AZrymWD4xdAzMUFggHlNcXmjShKlMNk8JL
         7RkTNLwn4HCe0BnH0a6rcSkBkv9Q3c+pmEMb2XcqmT3+C/yugTp20YoJrq820u3mfuUp
         3N7ozUMlP/ihOu+3Mp/B63o2B1o6PNR4xEA9pPobOsHclJmqAWA4zxi8WiXUTuUhyS6a
         RPmnUaoCBlBPak7obpcSGjG3CeQxfr4rN9++CK5kjaCf4HQjVsU8DvAJv5HfaN4aZzBw
         SSshL+vLmA8HoAMatX4iK4dThUF2VqGdQj3VORF7uURfSVLpZ9nB1fkl9Tag0PGE5iGK
         Q5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUjUUKLmlG1n/+umEBC3TI1lqk6AYn6DQpESIHr+yaKsMzaVk7Rxby2KtPrKESLrORT++35mizH5JM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1ixlPAwwghHxO0DnIm3LoAX9W0ulo/1AAqol5/wV/aHRfyWUG
	hnLzH6TKFpH8O2i2RvAex/XlwM5BqKBgplyDRNPGYEbedZgPnH4wsc9usB51voU=
X-Gm-Gg: ASbGnctdL6fl2I2w/uW4/eRWonMverdXFmJMCVAoLH/ts/9sQ4FftrFhc2Yq02/PTnl
	SW7HxxD3xpbOgWhfQDlCB3HCK3I83tfXyCLnhyOujk7k5T4FxWRZVFYr72m9+EFfdyHYIsiM3w9
	cOX6PfTE2tHQSkfP84bnct1E90h0zZqZyy4+877XbrAOxTUX3Pnb57tO9I9e9BpvVsvwb07YP6C
	Xss8gb5I0dS+Iv34H7vhH4cMhacnhybQJYYBxhtJrwzdes1F1vVp0vtUFy4PHA/Mp1qCAbFjwXs
	KDcixYwK/arjZrQg0IsyEZxDqA9hSvGgUkPZblD3m6JO
X-Google-Smtp-Source: AGHT+IEganAe939WGDJlfH9nAWVZpA3TvM5SaYn7UYpmBsqsQlG5HSrZSGt5JfnUpmvzTx71ZR7Ekg==
X-Received: by 2002:a17:902:f545:b0:215:6e01:ad19 with SMTP id d9443c01a7336-21c35587f37mr410676135ad.29.1737638898793;
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:18 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:13 +0800
Message-Id: <cover.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

As suggested by Peter Zijlstra below [1], this series aims to remove
tlb_remove_page_ptdesc().

: Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
: there should not be a page-table anywhere near here *ever*.
:
: Yes, some architectures use tlb_remove_page() for page-tables too, but
: that is more or less an implementation detail that can be fixed.

After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
to remove the page table pages. In the future, once all architectures using
tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
may be possible to use only tlb_remove_ptdesc().

Note: there will be some overlap between my patch #4 and Rik van Riel's patch #1 [2],
      once his patch is merged into the next branch, I can rebase onto his patch.
      And patch #4 can actually make x86 use tlb_remove_ptdesc(), but due to the
      above situation, I have not done so yet.

This series is based on next-20250122.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/lkml/20250123042447.2259648-2-riel@surriel.com/

Qi Zheng (5):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: unconditionally use tlb_remove_table()
  mm: pgtable: remove tlb_remove_page_ptdesc()

 arch/csky/include/asm/pgalloc.h      |  3 +--
 arch/hexagon/include/asm/pgalloc.h   |  3 +--
 arch/loongarch/include/asm/pgalloc.h |  3 +--
 arch/m68k/include/asm/sun3_pgalloc.h |  3 +--
 arch/mips/include/asm/pgalloc.h      |  3 +--
 arch/nios2/include/asm/pgalloc.h     |  9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  |  3 +--
 arch/riscv/include/asm/pgalloc.h     | 26 ++++----------------------
 arch/sh/include/asm/pgalloc.h        |  3 +--
 arch/um/include/asm/pgalloc.h        |  9 +++------
 arch/x86/kernel/paravirt.c           | 17 +----------------
 arch/x86/mm/pgtable.c                | 11 -----------
 include/asm-generic/tlb.h            | 12 +++---------
 13 files changed, 22 insertions(+), 83 deletions(-)

-- 
2.20.1

