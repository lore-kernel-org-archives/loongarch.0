Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B9BA57
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 22:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA2EC433D2;
	Fri,  3 Feb 2023 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461980;
	bh=cvjRNwH2kRiWR8c5UNqBmClynEmYqcho7035VrMra1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzBDKmAx5z+R9uqapSiL6Cn1VpVHH7drD5XxGu9fuiYmqLWPLl1KOVTTd69GQOZd5
	 ARPsyjFCWJ2cab/VUgVf5aLu2kjehWHFLflwHnpV4ETtShxVzGqPJj3jYZnAXjZ6vZ
	 ILdvD+LHRKRK52SNwHW1v5UeCOq0Mb/aTdvnASi6K9qK4VC6gz7+t8xuKUqURMG9ry
	 A57A0tZJ6+ElGZjnAGmS3t0NQQ386BYUrN/eXS2nP/L90dcie8kCbHpV4WPfJtZW6M
	 Rqh4LPiEGX0Wb2TD086V1ccTZQJggpkhl/Zc5pAPnq0twHUFHirhVfRcjsHHRHfB30
	 nNVhfg+wbZp4A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com,
	richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	jiaxun.yang@flygoat.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-sh@vger.kernel.org,
	davem@davemloft.net,
	sparclinux@vger.kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-xtensa@linux-xtensa.org,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	paulmck@kernel.org
Subject: [PATCH 21/22] sched/idle: Make sure weak version of arch_cpu_idle_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:30 -0800
Message-Id: <52f887a01f8ee38fb710c915c1a3205983563736.1675461757.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

arch_cpu_idle_dead() should never return.  Make it so.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 kernel/sched/idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index e9ef66be2870..56e152f06d0f 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -75,7 +75,7 @@ static noinline int __cpuidle cpu_idle_poll(void)
 void __weak arch_cpu_idle_prepare(void) { }
 void __weak arch_cpu_idle_enter(void) { }
 void __weak arch_cpu_idle_exit(void) { }
-void __weak arch_cpu_idle_dead(void) { }
+void __weak arch_cpu_idle_dead(void) { while (1); }
 void __weak arch_cpu_idle(void)
 {
 	cpu_idle_force_poll = 1;
-- 
2.39.0

