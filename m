Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263361FCF
	for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQtnLEWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7286AC433C7;
	Wed, 15 Nov 2023 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700019276;
	bh=K9lq4b4xli/0qrsq9veIqfV5CRENhYQ+seLOfRxbm48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQtnLEWjmyTPWuRuI2Hh7N7+zf/UXMs6/bQtCNq0x2XTmq9OLEH1g5K5zMjMizamo
	 TeAWfJN91IFdClnaNls0cUA4mUTWzWhUfls6T/y2uhrgZLJW3+sq0/tnvQK7O5yPxp
	 NtVHMj8vmc/4YWucO44yv2YD5stgsaESluHd3TfcXgUEn75p5/auI4nKSeIfD8ymAV
	 hsDt3ud9RkYEZKpggoZUuwq4taogRqoEGw4Sn3hUOTrdU77TgY/niDqyBGlMTqPdx2
	 iOZcuqPTGkjCEU4Jr7xzhCEYtDST/E1euuC4DbtIMYiarfWqAbR8o3mJaWFF+aT3yA
	 kycYQyFuHvgCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	maobibo@loongson.cn,
	palmer@rivosinc.com,
	yangtiezhu@loongson.cn,
	wangliupu@loongson.cn,
	jpoimboe@kernel.org,
	zhoubinbin@loongson.cn,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 4/6] LoongArch/smp: Call rcutree_report_cpu_starting() earlier
Date: Tue, 14 Nov 2023 22:33:38 -0500
Message-ID: <20231115033350.1228588-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115033350.1228588-1-sashal@kernel.org>
References: <20231115033350.1228588-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.1
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit a2ccf46333d7b2cf9658f0d82ac74097c1542fae ]

rcutree_report_cpu_starting() must be called before cpu_probe() to avoid
the following lockdep splat that triggered by calling __alloc_pages() when
CONFIG_PROVE_RCU_LIST=y:

 =============================
 WARNING: suspicious RCU usage
 6.6.0+ #980 Not tainted
 -----------------------------
 kernel/locking/lockdep.c:3761 RCU-list traversed in non-reader section!!
 other info that might help us debug this:
 RCU used illegally from offline CPU!
 rcu_scheduler_active = 1, debug_locks = 1
 1 lock held by swapper/1/0:
  #0: 900000000c82ef98 (&pcp->lock){+.+.}-{2:2}, at: get_page_from_freelist+0x894/0x1790
 CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0+ #980
 Stack : 0000000000000001 9000000004f79508 9000000004893670 9000000100310000
         90000001003137d0 0000000000000000 90000001003137d8 9000000004f79508
         0000000000000000 0000000000000001 0000000000000000 90000000048a3384
         203a656d616e2065 ca43677b3687e616 90000001002c3480 0000000000000008
         000000000000009d 0000000000000000 0000000000000001 80000000ffffe0b8
         000000000000000d 0000000000000033 0000000007ec0000 13bbf50562dad831
         9000000005140748 0000000000000000 9000000004f79508 0000000000000004
         0000000000000000 9000000005140748 90000001002bad40 0000000000000000
         90000001002ba400 0000000000000000 9000000003573ec8 0000000000000000
         00000000000000b0 0000000000000004 0000000000000000 0000000000070000
         ...
 Call Trace:
 [<9000000003573ec8>] show_stack+0x38/0x150
 [<9000000004893670>] dump_stack_lvl+0x74/0xa8
 [<900000000360d2bc>] lockdep_rcu_suspicious+0x14c/0x190
 [<900000000361235c>] __lock_acquire+0xd0c/0x2740
 [<90000000036146f4>] lock_acquire+0x104/0x2c0
 [<90000000048a955c>] _raw_spin_lock_irqsave+0x5c/0x90
 [<900000000381cd5c>] rmqueue_bulk+0x6c/0x950
 [<900000000381fc0c>] get_page_from_freelist+0xd4c/0x1790
 [<9000000003821c6c>] __alloc_pages+0x1bc/0x3e0
 [<9000000003583b40>] tlb_init+0x150/0x2a0
 [<90000000035742a0>] per_cpu_trap_init+0xf0/0x110
 [<90000000035712fc>] cpu_probe+0x3dc/0x7a0
 [<900000000357ed20>] start_secondary+0x40/0xb0
 [<9000000004897138>] smpboot_entry+0x54/0x58

raw_smp_processor_id() is required in order to avoid calling into lockdep
before RCU has declared the CPU to be watched for readers.

See also commit 29368e093921 ("x86/smpboot: Move rcu_cpu_starting() earlier"),
commit de5d9dae150c ("s390/smp: move rcu_cpu_starting() earlier") and commit
99f070b62322 ("powerpc/smp: Call rcu_cpu_starting() earlier").

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index ef35c871244f0..5bca12d16e069 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -504,8 +504,9 @@ asmlinkage void start_secondary(void)
 	unsigned int cpu;
 
 	sync_counter();
-	cpu = smp_processor_id();
+	cpu = raw_smp_processor_id();
 	set_my_cpu_offset(per_cpu_offset(cpu));
+	rcutree_report_cpu_starting(cpu);
 
 	cpu_probe();
 	constant_clockevent_init();
-- 
2.42.0

