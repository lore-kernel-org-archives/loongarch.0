Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56A101CE
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SUh2AUGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702020652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMJ0khluh69+oGYQ45qNovXMn1kcyTft2Ss07SyrAMA=;
	b=SUh2AUGKWz7Qh2zLEzyTOnzH41cxy4V+bE3ULAEprRi08AdCMaRrHrMLM6Bag6h2BtdGGX
	xduAZrtrTT4KS/0wpNPZlrgwmW0ODRT9Zlu7CMIPVr5QPq4IJNY+Wk3vaCUfk9zcOwIu5E
	TzMmt34NWLpZfXnYJiZAA7Iv2fHjiko=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-fgcVBsYqNd-Y6txwm1BDyQ-1; Fri,
 08 Dec 2023 02:30:51 -0500
X-MC-Unique: fgcVBsYqNd-Y6txwm1BDyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 939181C05ED0;
	Fri,  8 Dec 2023 07:30:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7C5A8CD0;
	Fri,  8 Dec 2023 07:30:44 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	x86@kernel.org,
	akpm@linux-foundation.org,
	eric_devolder@yahoo.com,
	sfr@canb.auug.org.au,
	ignat@cloudflare.com,
	Baoquan He <bhe@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/5] loongarch, kexec: change dependency of object files
Date: Fri,  8 Dec 2023 15:30:32 +0800
Message-ID: <20231208073036.7884-2-bhe@redhat.com>
In-Reply-To: <20231208073036.7884-1-bhe@redhat.com>
References: <20231208073036.7884-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Currently, in arch/loongarch/kernel/Makefile, building machine_kexec.o
relocate_kernel.o depends on CONFIG_KEXEC.

Whereas, since we will drop the select of KEXEC for CRASH_DUMP in
kernel/Kconfig.kexec, compiling error will be triggered if below config
items are set:

===
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_CRASH_DUMP=y
===

---------------------------------------------------------------
loongarch64-linux-ld: kernel/kexec_core.o: in function `.L209':
>> kexec_core.c:(.text+0x1660): undefined reference to `machine_kexec_cleanup'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L287':
>> kexec_core.c:(.text+0x1c5c): undefined reference to `machine_crash_shutdown'
>> loongarch64-linux-ld: kexec_core.c:(.text+0x1c64): undefined reference to `machine_kexec'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L2^B5':
>> kexec_core.c:(.text+0x2090): undefined reference to `machine_shutdown'
   loongarch64-linux-ld: kexec_core.c:(.text+0x20a0): undefined reference to `machine_kexec'
---------------------------------------------------------------

Here, changing the dependency of machine_kexec.o relocate_kernel.o to
CONFIG_KEXEC_CORE can fix above building error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311300946.kHE9Iu71-lkp@intel.com/
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/loongarch/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
index 4fcc168f0732..3c808c680370 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -57,7 +57,7 @@ obj-$(CONFIG_MAGIC_SYSRQ)	+= sysrq.o
 
 obj-$(CONFIG_RELOCATABLE)	+= relocate.o
 
-obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 
 obj-$(CONFIG_UNWINDER_GUESS)	+= unwind_guess.o
-- 
2.41.0

