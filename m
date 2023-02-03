Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF0BA57
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 22:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D75C433A8;
	Fri,  3 Feb 2023 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461973;
	bh=Gy7oghtDbUapfyH6lmA7zeDcDutJ46pdh8WMl0cgvVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cz/e4Tiq0/BvLDX93eISE4dEcCFBPucrGZqH4/s6/uvyLanSuD8oY7sBMKXuYt07K
	 mhzTK34NA4E1JWXtyejdLqJNsro+yA1Yj3Uz502TOQTJjfQrpQWQsJNvWHGo5sndOU
	 phtWnBDv3YdyzJc4hPNyl2ZLxgw8Kbshx78FoeWjgczSitx7GhnaXT9X29zcTpGQXi
	 U01QFLtvja2ffq22rVz1PFTU+/uSTGm4lN21v5c1bGlJrZZQ1k+Db3jT20KJrVcazD
	 dzlT0LcCZCfDKhnovvW6WCWz4JZBeYAV+6FJaLKMYf4o9dmDrEbEXRuAD7jpQl0uB+
	 MCNtPX36W5EEw==
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
Subject: [PATCH 17/22] x86/cpu: Make sure play_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:26 -0800
Message-Id: <7bfd319e3ebf5a3e56d668bee7a3b981b22b1863.1675461757.git.jpoimboe@kernel.org>
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

After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
return"), play_dead() never returns.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/smp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index b4dbb20dab1a..8f628e08b25a 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
 static inline void play_dead(void)
 {
 	smp_ops.play_dead();
+	BUG();
 }
 
 static inline void smp_send_reschedule(int cpu)
-- 
2.39.0

