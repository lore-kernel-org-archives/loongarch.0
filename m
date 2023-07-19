Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985893D87
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:33:48 +0000 (UTC)
X-UUID: 3439a2eb271147a5a78e7a938c3948d3-20230719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:eba608f6-b7f5-4435-a8c7-db8af9869d8f,IP:25,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:-15
X-CID-INFO: VERSION:1.1.28,REQID:eba608f6-b7f5-4435-a8c7-db8af9869d8f,IP:25,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-META: VersionHash:176cd25,CLOUDID:f617c5dc-dc79-4898-9235-1134b97257a8,B
	ulkID:2307191614510XI4YAKB,BulkQuantity:1,Recheck:0,SF:17|19|44|38|24|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 3439a2eb271147a5a78e7a938c3948d3-20230719
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1885092020; Wed, 19 Jul 2023 16:28:18 +0800
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
Subject: [PATCH 0/4] Add KFENCE support for LoongArch
Date: Wed, 19 Jul 2023 16:27:28 +0800
Message-Id: <20230719082732.2189747-1-lienze@kylinos.cn>
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

Thanks,
Enze

Enze Li (4):
  LoongArch: mm: Add page table mapped mode support
  LoongArch: Get stack without NMI when providing regs parameter
  KFENCE: Deferring the assignment of the local variable addr
  LoongArch: Add KFENCE support

 arch/loongarch/Kconfig               |  1 +
 arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
 arch/loongarch/include/asm/page.h    | 10 +++++
 arch/loongarch/include/asm/pgtable.h | 12 ++++++
 arch/loongarch/kernel/stacktrace.c   | 16 ++++---
 arch/loongarch/mm/fault.c            | 22 ++++++----
 arch/loongarch/mm/pgtable.c          | 25 +++++++++++
 mm/kfence/core.c                     |  5 ++-
 8 files changed, 137 insertions(+), 16 deletions(-)
 create mode 100644 arch/loongarch/include/asm/kfence.h

-- 
2.34.1

