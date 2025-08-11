Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158692DE1E4
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904496; cv=none; b=kCeF2R+cy/2YhUhZ9IO6JZukeAcFFdQkZ2bEyfVNp2rBfC6KRnEtGrg9bJ+uapOLvqsLmKf7GiPRT6Kvz4nVBmzkTa7k81PH9PrknoJg35ApUQZdIA2S6pSLOKeOyB1gQgDSSd/tSdxFsQqoAHz0x4PXS7+R/wN9bMcpZO5zy9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904496; c=relaxed/simple;
	bh=CG0C1SfyItXrt8ExFvXcVaNmWSYCE6+KwVwVWwt3c7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TuVL61vzjCBd/1p3JF12t9Vd0gnbl82FhCnOvAsWdd7R8M0hPNQ3fipEFUJiJDSjyElxlhrKyFEgRtR57UA8lNH/j+q3rmI5SxGDNUYVn4KSS7rRDLLsPKXOuo1NDoYWjPvwGQcNX2xj8u9+11ocoexgMZn7qJc0KrciGQodezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FBkchM+o; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FBkchM+o"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754904491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mn6yGCgIfkqUqRIzMPkZRCyDdMUzEhApvE49oVqcvo0=;
	b=FBkchM+oKFunptI/GonLa8A971t0vOUJRpSTuUu1uo3GD5p/4CJaRBj3DOaSI+upBgQjI1
	0kRrxqpEG1a1PyQwR3GxtXFAroLuvQyOAsNJUexLT72W2BwtQL3kb3raTMXH8nWm8/btDR
	OeW3oQyHT9ieBvmxlunj/quxeNvbQVw=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 0/6] Add kexec_file support for LoongArch
Date: Mon, 11 Aug 2025 17:26:53 +0800
Message-Id: <20250811092659.14903-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

This patchset implement kexec_file_load() support on LoongArch.

This patch series enables us to load the LoongArch vmlinuz.efi or
vmlinux.efi by specifying its file decriptor, instead of user-filled
buffer via kexec_load() syscall.

To use kexec_file_load() system call, instead of kexec_load(), at kexec
command, '-s' options must be specified. kexec-tools needs to apply the
corresponding patches. These patches can be found in repository [1] and
will be submitted to the kexec-tools community later.

The basic usage of kexec_file is:
1) Load second kernel image:
 # kexec -s -l vmlinuz.efi --initrd=initrd.img --reuse-cmdline

2) Startup second kernel:
 # kexec -e

For kdump:
1) Load capture kernel image:
 # kexec -s -p vmlinuz.efi --initrd=initrd.img --reuse-cmdline

2) Do something to crash, like:
 # echo c > /proc/sysrq-trigger

Link:
[1] https://github.com/tangyouling/kexec-tools/commits/main/

Youling Tang (6):
  LoongArch: Add struct loongarch_image_header for kernel image
  LoongArch: Add kexec_file support
  LoongArch/kexec_file: Add initrd loading
  LoongArch/kexec_file: Add crash dump support
  LoongArch/kexec_file: Add "mem" parameter to limit memory usage of
    kdump kernel
  LoongArch: Enable CONFIG_KEXEC_FILE

 arch/loongarch/Kconfig                     |   8 +
 arch/loongarch/configs/loongson3_defconfig |   1 +
 arch/loongarch/include/asm/image.h         |  58 +++++
 arch/loongarch/include/asm/kexec.h         |  12 ++
 arch/loongarch/kernel/Makefile             |   1 +
 arch/loongarch/kernel/kexec_image.c        | 112 ++++++++++
 arch/loongarch/kernel/machine_kexec.c      |  33 ++-
 arch/loongarch/kernel/machine_kexec_file.c | 234 +++++++++++++++++++++
 8 files changed, 448 insertions(+), 11 deletions(-)
 create mode 100644 arch/loongarch/include/asm/image.h
 create mode 100644 arch/loongarch/kernel/kexec_image.c
 create mode 100644 arch/loongarch/kernel/machine_kexec_file.c

-- 
2.34.1

