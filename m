Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7545BA3F
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 22:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F222EC433A7;
	Fri,  3 Feb 2023 22:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461948;
	bh=IUG7346ru2LIaCtxjax/xlHvBhlssHCzq8SttudiekY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDs+6rDG1dzYFDAxIKMUYCPpuI8xVxCk4vK7vY7SgBBbS+9M4fpuTaBD9RlOR4IpY
	 5NXqrjuw9ORKV94tm3vuwmSTrBJxoFJCTyK0InA92qEFqLJwQgCoGOouJ+2PtAAGkB
	 tywZI2GzgHL8sm2n0h5hvEG303bBDNv1IbORapWkTJr9KSjXUHNAj+2yMiIMNQdWSe
	 UL3lPmOXr1Dvb5uH4eKO4vP0s+38mGzfgCc7Dw5nVS3fnY1BCp6vQo477htt3OULlx
	 6ruyxQleCq0SasoQbj3h1mZCK0oMuduqz7cDOi0p2JVDR54NP7OttRvDrXst1X78to
	 FA+WZR+13rHMw==
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
Subject: [PATCH 04/22] arm64/cpu: Mark cpu_die() __noreturn
Date: Fri,  3 Feb 2023 14:05:13 -0800
Message-Id: <b0d5d5608d1485495204d3dcac29bdeb8036a619.1675461757.git.jpoimboe@kernel.org>
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

cpu_die() doesn't return.  Annotate it as such.  By extension this also
makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index fc55f5a57a06..5733a31bab08 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -100,7 +100,7 @@ static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
 extern int __cpu_disable(void);
 
 extern void __cpu_die(unsigned int cpu);
-extern void cpu_die(void);
+extern void __noreturn cpu_die(void);
 extern void cpu_die_early(void);
 
 static inline void cpu_park_loop(void)
-- 
2.39.0

