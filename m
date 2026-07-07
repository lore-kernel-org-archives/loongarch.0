Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44BF4F1
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406827; cv=none; b=alOtQzS5B+TT1n/OpirS9F/m6TRidchibsQke86jSl9BuFMKO6frdQ2eRxhYEO54LLMoXmi9CL3WQ2UhiDCP8AyBrXHP4Es8jeYsXrJVq4a24y00kZxqrVqQjCF4k9veTogvVZI1TY3zZO9HwubPjghXNlTvDhbiHBSVQ5KlGzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406827; c=relaxed/simple;
	bh=zmFXhYgK4zFp8kEICNqyHs2SgVFaKR9WpG22WYpJlsI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jFAFZU6FoPgq9MgT3Iqucg8pLzwxpxWEnGxBFPxT9x+2jGFBDgsYVeZHubHhpFenfTpxJLdTMPwh2sQmsybgLWpMdAciGV0Gl7/xB730geGQec9C7tn6vILzT2RhbwV9uMCAeujzBZOnZ92H8fpbKR7zwreyJQoGxpquItVMMaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=egfEGBE9; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="egfEGBE9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783406822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z4yPw8gZ3gm1nA+cgVnDiafGcuO38s0ABdYCsCwATzE=;
	b=egfEGBE9tuRZbfuI4e8WAqiteY15acihh+8CbSdhnT4s4eW7xEidGIdWHLF5lotEeSHTHk
	laxg4+BhHC3goRcp8C75Q/FpVANq/0jC5FWxVagrYcGZO8sp3YzS4X23a4yFUgMHZwMGcl
	fNDK+YNlnUrOXl61D1infkUPBBMGtZU=
From: haoran.jiang@linux.dev
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH 0/2] Add support to dump the kernel page tables
Date: Tue,  7 Jul 2026 14:45:54 +0800
Message-Id: <20260707064556.371881-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

Enforce the W^X principle on page tables, 
and also support the kernel page dump feature.

The following tests were performed:

kdb:
echo kgdbts=V1 > /sys/module/kgdbts/parameters/kgdbts

ebpf:
./test_progs -t struct_ops -d struct_ops_multi_pages
./test_progs -t fexit_stress
./test_progs -t module_fentry_shadow
./test_progs -t fentry_test/fentry
./test_progs -t fexit_test/fexit
./test_progs -t modify_return
./test_progs -t fexit_sleep
./test_progs -t test_overhead
./test_progs -t trampoline_count
./test_progs -t kprobe
./test_progs -t uprobe

livepatch:
insmod samples/livepatch/livepatch_sample.ko

kprobe:
insmod samples/kprobes/kprobe_example.ko
insmod samples/kprobes/kretprobe_example.ko

unxibench:
before this patch:
running 1 parallel copy of tests: 1492
running 128 parallel copies of tests:  8765

after this patch:
running 1 parallel copy of tests:  1440
running 128 parallel copies of tests:  8749


Haoran Jiang (2):
  LoongArch: Enforce W^X for page-mapped virtual memory region
  LoongArch: Add support to dump the kernel page tables

 arch/loongarch/Kconfig                    |   2 +
 arch/loongarch/include/asm/pgtable-bits.h |  12 +-
 arch/loongarch/kernel/ftrace_dyn.c        |  16 +
 arch/loongarch/kernel/inst.c              |  25 +-
 arch/loongarch/kernel/jump_label.c        |   3 +
 arch/loongarch/kernel/kgdb.c              |  50 +++
 arch/loongarch/kernel/kprobes.c           |   4 +-
 arch/loongarch/mm/Makefile                |   1 +
 arch/loongarch/mm/ptdump.c                | 474 ++++++++++++++++++++++
 9 files changed, 575 insertions(+), 12 deletions(-)
 create mode 100644 arch/loongarch/mm/ptdump.c

-- 
2.43.0

