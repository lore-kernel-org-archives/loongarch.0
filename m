Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295061;
	b=4PmDYko6mJ5cCwAFJ+AYIxs26jbeiHO+8hMN2SMAz9sO4upnlv3favlzMhTHEIYiZHOj
	 8qHU7esfIln4m/7Pve7B1PMVt6FPo3oUHbcrPDS9/5FrYEknqtMp0ucE7Io7Ck9gR2lkK
	 hht7jkd0aGNCilq970PUTdbLi40rQmy/unNUK563woNqOGhv2O/hkxhY9y+LxggbYd8ZR
	 B/2pvLWq5s34HYr//XESs0FbUl6vvvBZSYX05/4NaMmPgYli8KJu5dHHOKVrU7yvjn3xt
	 /b6PZcWFCGEwRjElGSzeV15S20PQLiETHxRUX12DZ07AifmhO4wpUbSqhUbH3FQFPIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295061;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/+hjM5CsEedso/LlGxQH+kdJiIeJBeEghJpwPsmuqXM=;
	b=hTM088wJB3D/fYrO+mkdgh0PCc87vR6fnEKLId+XFOuXxy/GX3z1SVQeDGiKSq9uNemD
	 zbrU4ZINtIcrRw1oO1Xc/AQPeRaoEZsYZAil5eHED0qxeo3OWVPGLI2cOyIESNWCHAwDJ
	 yZFwnFLSpB7uT42WRhyPAJTR/aNRyld9VMCdh+Y9qqoHt9Vkume2etLR9irrVLMQHp542
	 /K8pef35ErhHfj1aPCRciMCkM+Fw0XvYcSjP07I7fXfFaD2YZgY1Jqjtc/37e7BvYcjo7
	 5dAp0R3X2DPBzva9D4O9uvxPqg/dDtwMINuQtDNn1+y7+VA+10/HK8woibEf6RZCsyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xPnFkVGP;
	arc=none smtp.remote-ip=91.218.175.195
Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816C3606A326
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 17:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xPnFkVGP
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XjaLIKpPNBz8YS+fveYxov34nv5lXYqg9aUyoW4HF6I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295058; v=1; x=1793899858;
 b=xPnFkVGPL1QlatO8UExQBh7I/oQ7dCIPtcm0w9D9uT/f3tQiHIeMhfaVOfxkUr317Yy8D3qq
 Z9q+BkBVSYSu8XAvbF7V302QzSYfro1VtTONorAqqtsMb84XMbG+lFZgfoRYpIiT7eF/FRER19m
 tadG1qwTfbcTGi96CL0Qf208=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 072f51d6be77a39d;
	Thu, 29 Oct 2026 17:30:58 +0000
X-Mizu-Trace-ID: 072f51d6be77a39d
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org
Cc: ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v6 7/8] selftests/kho: Add LoongArch vmtest support
Date: Fri, 30 Oct 2026 02:29:54 +0900
Message-ID: <20261029172956.20791-8-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029172956.20791-1-dongtai.guo@linux.dev>
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

Add loongarch.conf to run the test on QEMU's LoongArch virtual machine
with a la464 CPU and an 8250 serial console, and let vmtest.sh accept
the loongarch64 target.

Boot vmlinux.efi through EFI firmware. The EFI stub installs the KHO EFI
table, and QEMU's direct kernel boot would skip the stub. QEMU_EFI
defaults to /usr/share/edk2/loongarch64/QEMU_EFI.fd and can be set for
distributions that install the firmware elsewhere, such as Debian's
qemu-efi-loongarch64 package.

QEMU's LoongArch virtual machine has no i8042 controller. Enable the
generic PCI host so its I/O space is mapped before the i8042 fallback
probe touches the legacy ports. This keeps i8042 enabled, so the same
kernel configuration still works on real hardware.

Enable ACPI_SPCR_TABLE so the bare earlycon parameter gets the UART from
the SPCR table installed by EDK2. Unlike x86, LoongArch does not enable
it by default, and without it there is no early console and vmtest sees
no early boot output.

The KHO vmtest needs CONFIG_DEFERRED_STRUCT_PAGE_INIT=y, which depends
on SPARSEMEM, so select CONFIG_SPARSEMEM_MANUAL=y.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/kho/loongarch.conf | 11 +++++++++++
 tools/testing/selftests/kho/vmtest.sh      |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kho/loongarch.conf

diff --git a/tools/testing/selftests/kho/loongarch.conf b/tools/testing/selftests/kho/loongarch.conf
new file mode 100644
index 000000000000..36153b03c4ef
--- /dev/null
+++ b/tools/testing/selftests/kho/loongarch.conf
@@ -0,0 +1,11 @@
+QEMU_EFI="${QEMU_EFI:-/usr/share/edk2/loongarch64/QEMU_EFI.fd}"
+QEMU_CMD="qemu-system-loongarch64 -M virt -cpu la464 -bios $QEMU_EFI"
+QEMU_KCONFIG="
+CONFIG_ACPI_SPCR_TABLE=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SPARSEMEM_MANUAL=y
+"
+KERNEL_IMAGE="vmlinux.efi"
+KERNEL_CMDLINE="console=ttyS0 earlycon"
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 0014bd76e88d..d05ba0734b25 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -21,7 +21,7 @@ Options:
 	-d)	path to the kernel build directory
 	-j)	number of jobs for compilation, similar to -j in make
 	-t)	run test for target_arch, requires CROSS_COMPILE set
-		supported targets: aarch64, x86_64
+		supported targets: aarch64, loongarch64, x86_64
 	-h)	display this help
 EOF
 }
@@ -126,6 +126,7 @@ function target_to_arch() {
 
 	case $target in
 	     aarch64) echo "arm64" ;;
+	     loongarch64) echo "loongarch" ;;
 	     x86_64) echo "x86" ;;
 	     *) skip "architecture $target is not supported"
 	esac
-- 
2.53.0

