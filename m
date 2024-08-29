Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75451189B85
	for <loongarch@lists.linux.dev>; Thu, 29 Aug 2024 07:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724915789; cv=none; b=OcAnoJ8Ge37IDPeaiwi+kalaAGrlOn06pLDVMYZu3/C37Jlo3iJYSGPGA6QqNeuwJYi8EtjHi3KSSlDFqQ2EurLMOiXdTlmjeouYnpwgO2FKr1KzI5Y52ol4kdMcWqHenoTky/g0HOZ26fYBn3/m7iHvv+KIS9ZsreHIFcHLPgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724915789; c=relaxed/simple;
	bh=s/V5Z34t4dT0xkb/r9QmO4zmTWyR+OmvwZt8Wf5I9yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfnJeUTE7xjmQ+gOPc6NUoBsvkqKFG2Wt8PHybiTEkmulFFU3fZ4iaEgJQVnmjg82eQ2hL3eDOK5B5AiX0AMvef9o/5FGbs5BfS+S8KA1R7kQJ7T5R/F5SJ0nlF+SQFLozg3nBRnlGEDZMLrsyAbKQ8BLTb0MlJBgPtKB6hJvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q+JARcvL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q+JARcvL"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-715c160e231so304500b3a.0
        for <loongarch@lists.linux.dev>; Thu, 29 Aug 2024 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915787; x=1725520587; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
        b=q+JARcvLt4coY/Oe+6IxIKPztqcOmRjNIcEV779yi5k29UCTVrcyljQE+0Hstdinl5
         qjx3XauuKh3zM9KVXVhFBK2jpX56IWUETLGC0u0J+l2N1x/QqeNHbH5HFy8KtGEg6TdM
         D4mLILpl9v8GHwVziwFosbtPdHfZZGSfkH4xPUOe+L18xM547ltf95jH3GzuvvaOHA2b
         kXrP9/J1Pai0NTU/0qE3mNUlekylMzwnDC/GM/9vOsldyTdtv6zpqKrnNft9thXYuz11
         pJ5mI7s9Xr3uKOtTDtXdMi37a86Bctt2Vl/ELJ9/DX/3A9pb88xTp1/l2hUMhZrrDf2F
         YZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915787; x=1725520587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
        b=q4KdP24mlsYua778K8SBWngRApz0IHzaAEsGb5+OZBzsQWLMHhwL4DNCVLC+W8seBU
         mA4UYfByRiiOm5ZyusjdpKRn+z21ivFJKKbe34+9zlg12MTcrjyVsxBCaRaXlx+lPj9a
         CANDUXLdpOEAtv1i9MkxOYXlimd9WCo9JLr6xqvbkMJ89IT9reJtfFZe0ceB21xzHigm
         Brln0x1I0zxgmtQu8U9BDzSGz7yIh5muzXEuuLAmPCkgikib1bNRkkG3A7BvwBJ2VXlj
         WpB/JsQSSKXJaVHy9PPS2D+ICmif/zyy3SNoZGxfApkqQ//aaasrcpFtgDawBhfCRm5s
         OkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX13SAKZzha58KJKJKv1Wtu6lajskSXxUkASD3sw6ehUaztSAK7F8xd/zN0t+mHR/MgRoUrQEF6ES0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTSbcOm91COX6CiUy+Q78Xw15avKWT8AjbHAotO8XmuCFWrhvo
	0iExe68r3KPkr7vZYsPUAF5HipJKh1FVlBzVTJ0cBJDlqZO7yY7GR5tegE086Do=
X-Google-Smtp-Source: AGHT+IF3t2cjexZNLvhhEG5lVGM8VXbW+pDj1JAzDu87zeFwskGcSX3PJG32Vb5o0zHIzYY5Gmbt2A==
X-Received: by 2002:a05:6a20:e196:b0:1be:c4bb:6f31 with SMTP id adf61e73a8af0-1cce1011dd6mr2308343637.18.1724915786799;
        Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:16:01 -0700
Subject: [PATCH RFC v2 4/4] selftests/mm: Create MAP_BELOW_HINT test
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-patches-below_hint_mmap-v2-4-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=s/V5Z34t4dT0xkb/r9QmO4zmTWyR+OmvwZt8Wf5I9yo=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBcsP6+L/Tm5SuNTuoL5vd1CHFePmle9+1/Le0d5Yp
 3hVY8XNjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYikcjwz6bDSmrzHWPjp6+e
 zUhZGF3tGZgzRbFMebrXzej5O9YXpDH8j7Z7ceLNKc+79Xs9s7LbGbZefbF4gvgksf23zjP3/b/
 +jhkA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add a selftest for MAP_BELOW_HINT that maps until it runs out of space
below the hint address.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/mm/Makefile         |  1 +
 tools/testing/selftests/mm/map_below_hint.c | 32 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cfad627e8d94..4e2de85267b5 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += hugepage-vmemmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
+TEST_GEN_FILES += map_below_hint
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
diff --git a/tools/testing/selftests/mm/map_below_hint.c b/tools/testing/selftests/mm/map_below_hint.c
new file mode 100644
index 000000000000..55d6cbf90645
--- /dev/null
+++ b/tools/testing/selftests/mm/map_below_hint.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the MAP_BELOW_HINT mmap flag.
+ */
+#include <sys/mman.h>
+#include <errno.h>
+#include "../kselftest.h"
+
+#define ADDR (1 << 20)
+#define LENGTH (ADDR / 10000)
+
+#define MAP_BELOW_HINT	  0x8000000	/* Not defined in all libc */
+
+/*
+ * Map memory with MAP_BELOW_HINT until no memory left. Ensure that all returned
+ * addresses are below the hint.
+ */
+int main(int argc, char **argv)
+{
+	void *addr;
+
+	do {
+		addr = mmap((void *)ADDR, LENGTH, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS | MAP_BELOW_HINT, -1, 0);
+	} while (addr != MAP_FAILED && (unsigned long)addr <= ADDR);
+
+	if (errno == ENOMEM)
+		ksft_test_result_pass("MAP_BELOW_HINT works\n");
+	else
+		ksft_test_result_fail("mmap returned address above hint with MAP_BELOW_HINT with error: %s\n",
+				      strerror(errno));
+}

-- 
2.45.0

