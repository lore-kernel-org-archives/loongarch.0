Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE79368D6F
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742510; cv=none; b=FvHMt2SEyU1CcrRWCmHFHdCiNJ4ycQABGfOdkiHMkEujHISJOAYGmbiKADXZO3JQltYThCVjJDNBn1gPZuY2dxuVqsLBXMcffnSw54EKLhcZ8dTvsMcz+qojLYXzMCC5NDgkunL9NhJ4aZCLniMQZ4WVYXXcpWggMJreJyGwXp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742510; c=relaxed/simple;
	bh=jTjvbdhNGo+PKhuP81ulVCYXmzuZQl7dtCjJx0xGBYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3q3VyBUa1leGtmozhj1AbhAr85n2HMb/KNoJ9qGJIy15F2vHs8scwRUv2nuoRWatNgo97lo1J+TkRXctxs84LfEZEOzCIS/uNL0xtIZSkvYmgTLwCRjsDh7IUGMsh8tVghQPsIwDhbld/9F4upBFdV4rr4qrNmV3Ox0G+C+Y0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxC9Lsx45q3zsFAA--.14699S3;
	Wed, 26 Aug 2026 19:03:08 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zrx45qn+8SAA--.8826S2;
	Wed, 26 Aug 2026 19:03:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] LoongArch: Fix perf hardware breakpoints
Date: Wed, 26 Aug 2026 19:03:00 +0800
Message-ID: <20260826110306.6847-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8zrx45qn+8SAA--.8826S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZrWfXFyfCr4rWryrKw1kCrX_yoW5JFy8pF
	Z8CFn8K3yrJFW7W3W3tw1xu3W3Kws7urWFgry3KrWYyF4DKr13G3yI9FsxJF1rJ3ykZa40
	grWkWw1S9FWxAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==

This series addresses severe functional degradations in standard
perf_event usage, including initialization failures and one-shot
triggering limitations.

All fixes have been verified with user-space reproducers on real
hardware and align with the LoongArch Reference Manual.

Here is a user-space reproducer demonstrating that standard perf
hardware breakpoints can now reliably monitor 10,000 hits without
a single event leakage or subsystem lockup.

(1) Test program (perf-hw-breakpoint.c):

  #include <stdint.h>
  #include <stdio.h>
  #include <sys/ioctl.h>
  #include <sys/syscall.h>
  #include <unistd.h>
  #include <linux/hw_breakpoint.h>
  #include <linux/perf_event.h>

  #ifndef noinline
  #define noinline __attribute__((noinline))
  #endif

  static noinline void test_function(const uint8_t *data)
  {
	asm volatile("" :: "r"(data[0]) : "memory");
  }

  int main(void)
  {
	int fd, ret, i;
	size_t count;
	uint8_t data[] = "TEST DATA";
	struct perf_event_attr attr = {0};

	attr.type = PERF_TYPE_BREAKPOINT;
	attr.size = sizeof(struct perf_event_attr);
	attr.bp_type = HW_BREAKPOINT_RW;
	attr.bp_addr = (uintptr_t)data;
	attr.bp_len  = HW_BREAKPOINT_LEN_1;
	attr.exclude_kernel = 1;
	attr.exclude_hv = 1;
	attr.disabled = 1;

	fd = syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
	ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);

	for (i = 0; i < 10000; i++)
		test_function(data);

	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
	read(fd, &count, sizeof(size_t));

	printf("perf count = %zu\n", count);

	close(fd);
	return 0;
  }

(2) Test steps:

  $ gcc perf-hw-breakpoint.c -o perf-hw-breakpoint
  $ ./perf-hw-breakpoint

(3) Test results:

Without this series:

  perf count = 0

With this series:

  perf count = 10000

Tiezhu Yang (6):
  LoongArch: Fix bitmask corruption in update_bp_registers()
  LoongArch: Remove redundant call in update_bp_registers()
  LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
  LoongArch: Only send SIGTRAP signal if necessary in do_watch()
  LoongArch: Fix perf hardware breakpoint failure via installation
  LoongArch: Fix one-shot limitation for perf hardware breakpoints

 arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
 arch/loongarch/include/asm/loongarch.h     |  7 +++-
 arch/loongarch/kernel/hw_breakpoint.c      | 43 ++++++++++++++++------
 arch/loongarch/kernel/traps.c              | 12 +++---
 4 files changed, 46 insertions(+), 20 deletions(-)

-- 
2.42.0

