Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B385015C0
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 06:15:24 +0000 (UTC)
X-UUID: dfbab49fd60a4e0dabc0f21bb2a2da4c-20230725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:3a22af29-da51-4ad3-87f2-7eee7ef58c26,IP:15,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:-25
X-CID-INFO: VERSION:1.1.28,REQID:3a22af29-da51-4ad3-87f2-7eee7ef58c26,IP:15,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-META: VersionHash:176cd25,CLOUDID:1c3b7fa0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:230725141513XFGXOQYJ,BulkQuantity:0,Recheck:0,SF:24|17|19|44|38|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: dfbab49fd60a4e0dabc0f21bb2a2da4c-20230725
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 69104657; Tue, 25 Jul 2023 14:15:11 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	glider@google.com,
	elver@google.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Cc: zhangqing@loongson.cn,
	yangtiezhu@loongson.cn,
	dvyukov@google.com,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH 0/4 v2] Add KFENCE support for LoongArch
Date: Tue, 25 Jul 2023 14:14:47 +0800
Message-Id: <20230725061451.1231480-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patchset adds KFENCE support on LoongArch.

To run the testcases, you will need to enable the following options,

-> Kernel hacking
   [*] Tracers
       [*] Support for tracing block IO actions (NEW)
   -> Kernel Testing and Coverage
      <*> KUnit - Enable support for unit tests

and then,

-> Kernel hacking
   -> Memory Debugging
      [*] KFENCE: low-overhead sampling-based memory safety error detector (NEW)
          <*> KFENCE integration test suite (NEW)

With these options enabled, KFENCE will be tested during kernel startup.
And normally, you might get the following feedback,

========================================================
[   35.326363 ] # kfence: pass:23 fail:0 skip:2 total:25
[   35.326486 ] # Totals: pass:23 fail:0 skip:2 total:25
[   35.326621 ] ok 1 kfence
========================================================

you might notice that 2 testcases have been skipped.  If you tend to run
all testcases, please enable CONFIG_INIT_ON_FREE_DEFAULT_ON, you can
find it here,

-> Security options
   -> Kernel hardening options
      -> Memory initialization
         [*] Enable heap memory zeroing on free by default

and you might get all testcases passed.
========================================================
[   35.531860 ] # kfence: pass:25 fail:0 skip:0 total:25
[   35.531999 ] # Totals: pass:25 fail:0 skip:0 total:25
[   35.532135 ] ok 1 kfence
========================================================

v2:
   * Address Huacai's comments.
   * Fix typos in commit message.

Thanks,
Enze

Enze Li (4):
  LoongArch: mm: Add page table mapped mode support
  LoongArch: Get stack without NMI when providing regs parameter
  KFENCE: Defer the assignment of the local variable addr
  LoongArch: Add KFENCE support

 arch/loongarch/Kconfig               |  1 +
 arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
 arch/loongarch/include/asm/page.h    | 19 ++++++++-
 arch/loongarch/include/asm/pgtable.h | 16 ++++++-
 arch/loongarch/kernel/stacktrace.c   | 20 ++++++---
 arch/loongarch/mm/fault.c            | 22 ++++++----
 arch/loongarch/mm/pgtable.c          |  6 +++
 mm/kfence/core.c                     |  5 ++-
 8 files changed, 133 insertions(+), 18 deletions(-)
 create mode 100644 arch/loongarch/include/asm/kfence.h

-- 
2.34.1

